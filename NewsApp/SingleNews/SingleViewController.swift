//
//  SingleViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 23/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(rootView)
        rootView.addSubview(photoImageView)
        rootView.addSubview(titleLabel)
        rootView.addSubview(descriptionLabel)
        setupConstraints()
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
        image.image = #imageLiteral(resourceName: "image1")
        return image
    }()
    
    let titleLabel: UILabel = {
        let titleText = UILabel()
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.font = .boldSystemFont(ofSize: 25)
        titleText.text = "Dobar naslov"
        return titleText
    }()
    
    let descriptionLabel: UITextView = {
        let descriptionText = UITextView()
        descriptionText.isEditable = false
        descriptionText.textColor = .gray
        descriptionText.font = .systemFont(ofSize: 18)
        descriptionText.textAlignment = .left
        descriptionText.text="Dobar naslov Dobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobarnaslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslovDobar naslov"
        
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
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -12),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 9),
            descriptionLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -12)
            ])
    }

}
