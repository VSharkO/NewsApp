//
//  SingleViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import Kingfisher

class SingleViewController: UIViewController, SingleView, SpinnerManager{
    
    var index: Int? = nil
    var presenter: SinglePresenter? = nil
    var spinner : UIView?
    
    let rootView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    init(singleArticle: Article) {
        super.init(nibName: nil, bundle: nil)
        presenter = SinglePresenterImpl(view: self, singleArticle: singleArticle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setNeedsLayout()
    }
    
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
            photoImageView.heightAnchor.constraint(equalTo: self.rootView.heightAnchor, multiplier: 1/2.5)
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
    
    private func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubview(rootView)
        rootView.addSubview(photoImageView)
        rootView.addSubview(titleLabel)
        rootView.addSubview(descriptionLabel)
    }
    
    func setImage(imageUrl: String){
        let url = URL(string: imageUrl)
        photoImageView.kf.setImage(with: url)
    }
    
    func showSpinner(){
        spinner = displaySpinner(onView: self.view)
    }
    
    func hideSpinner(){
        if let spin = spinner{
            removeSpinner(spinner: spin)
        }
    }
    
    func setTitle(title: String){
        titleLabel.text = title
        navigationItem.title = title
    }
    
    func setDescription(description: String){
        descriptionLabel.text = description
    }
    
}
