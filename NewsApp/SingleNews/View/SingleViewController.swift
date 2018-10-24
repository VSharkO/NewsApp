//
//  SingleViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController, SingleView{
    
    var index: Int? = nil
    var presenter: SinglePresenter? = nil
    var spinner : UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(rootView)
        rootView.addSubview(photoImageView)
        rootView.addSubview(titleLabel)
        rootView.addSubview(descriptionLabel)
        spinner = UIViewController.displaySpinner(onView: self.view)
        setupConstraints()
    }
    
    init(index: Int?) {
        super.init(nibName: nil, bundle: nil)
        self.index = index ?? nil
        presenter = SinglePresenterImpl(view: self)
        if let numberOfArticle = index{
            presenter?.getSingleNewsFromRepository(index: numberOfArticle)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setNeedsLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let rootView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let photoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let titleLabel: UILabel = {
        let titleText = UILabel()
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.numberOfLines = 0
        titleText.lineBreakMode = .byWordWrapping
        titleText.font = .boldSystemFont(ofSize: 25)
        return titleText
    }()
    
    let descriptionLabel: UITextView = {
        let descriptionText = UITextView()
        descriptionText.isEditable = false
        descriptionText.textColor = .gray
        descriptionText.font = .systemFont(ofSize: 18)
        descriptionText.textAlignment = .left
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        return descriptionText
    }()
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            rootView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            rootView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            rootView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            rootView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: rootView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 1/3 * self.view.frame.size.height)
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor,constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -12)
            ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 9),
            descriptionLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -12)
            ])
    }
    
    func setImage(imageURL: String){
        presenter?.getPictureFromUrl(url: imageURL, response: { (success, data, error) in
            if success{
                if let image = data,let picture = UIImage(data: image as! Data){
                    self.photoImageView.image = picture
                    UIViewController.removeSpinner(spinner: self.spinner!)
                }
            }else{
                UIViewController.removeSpinner(spinner: self.spinner!)
            }
        })
    }
    
    func setTitle(title: String){
        titleLabel.text = title
        navigationItem.title = title
    }
    
    func setDescription(description: String){
        descriptionLabel.text = description
    }

}
