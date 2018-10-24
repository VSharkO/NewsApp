//
//  MainViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController,MainView{
    
    var presenter : MainPresenter?
    var spinner : UIView?
    var loadedImagesCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MainPresenterImpl(view: self)
        spinner = UIViewController.displaySpinner(onView: self.view)
        presenter?.getResponseFromUrl()
        registerCells()
        setupNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = presenter?.getNumberOfItems() else{
            return 0
        }
        return count
    }
    
    func registerCells(){
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "customeCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customeCell", for: indexPath) as? TableViewCell,
            let news = presenter?.getSingleNewsFromRepository(index: indexPath.row){
            cell.setTitle(title: news.title)
            presenter?.getPictureFromUrl(url: news.urlToImage, response: { (success, data, error) in
                if let picture = UIImage(data: data as! Data){
                    if(success){
                        cell.setPicture(image: picture)
                        if(self.loadedImagesCounter == FakeRepository.articles.count-1){
                            self.loadedImagesCounter = 0
                            UIViewController.removeSpinner(spinner: self.spinner!)
                        }else{
                            self.loadedImagesCounter += 1
                        }
                    }else{
                        UIViewController.removeSpinner(spinner: self.spinner!)
                    }
                }
            })
            
            return cell
        }
        else{
            return TableViewCell()
        }
    }
    
    func setupNavigationBar(){
        navigationItem.title = "Factory"
    }
    
    func reloadData(){
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToMealScreenWithIndex(clickedMeal: indexPath.row)
    }
    
    @objc func moveToMealScreenWithIndex(clickedMeal: Int){
        navigationController?.pushViewController(SingleViewController(index: clickedMeal), animated: true)
    }
}
