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
//        spinner = UIViewController.displaySpinner(onView: self.view)
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customeCell", for: indexPath) as? TableViewCell{
            
            if let newsTitle = presenter?.getSingleNews(index: indexPath.row)?.title{
                cell.setTitle(title: newsTitle)
            }
            
            presenter?.getPictureFromRepository(forArticleAtIndex: indexPath.row, response: { (success, immage, error) in
                if(success){
                    if let picture = immage{
                        cell.setPicture(image: picture)
                    }
                }else{
                    print("somethings wrong with picture")
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
