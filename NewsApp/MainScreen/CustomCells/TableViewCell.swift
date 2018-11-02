//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell{
    
    var photo : UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    var title : UILabel = {
        var title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        title.numberOfLines = 0
        title.contentMode = .left
        return title
    }()
    
    var button : UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = button.tintColor.cgColor
        button.layer.cornerRadius = 10
        button.setBackgroundImage(#imageLiteral(resourceName: "addImage"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(photo)
        contentView.addSubview(title)
        contentView.addSubview(button)
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.widthAnchor.constraint(equalTo: photo.heightAnchor, multiplier: 1.4)
            ])
        let constraintPhotoHeight = photo.heightAnchor.constraint(equalToConstant: 100)
        constraintPhotoHeight.priority = .init(999)
        constraintPhotoHeight.isActive = true
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
            title.trailingAnchor.constraint(lessThanOrEqualTo: button.leadingAnchor, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: photo.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 20),
            button.heightAnchor.constraint(equalToConstant: 20),
            button.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20)
            ])
    }
    
    func setTitle(title: String){
        self.title.text = title
    }
    
    func setPicture(url: String){
        let url = URL(string: url)
        photo.kf.setImage(with: url)
    }
    
}
