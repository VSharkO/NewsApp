//
//  MainViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController,MainView,SpinnerManager{
    
    var presenter : MainPresenter!
    var spinner : UIView?
    var refreshController: UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MainPresenterImpl(view: self)
        setupNavigationBar()
        registerCells()
        setupRefreshControl()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNews().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customeCell", for: indexPath) as? TableViewCell{
            cell.setTitle(title: presenter.getNews()[indexPath.row].title)
            cell.setPicture(url: presenter.getNews()[indexPath.row].urlToImage)
            return cell
        }
        else{
            return TableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToMealScreenWithIndex(clickedMeal: indexPath.row)
    }
    
    private func registerCells(){
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "customeCell")
    }
    
    private func setupNavigationBar(){
        navigationItem.title = "Factory"
    }
    private func setupRefreshControl(){
        refreshController = UIRefreshControl()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshController
        } else {
            self.tableView.addSubview(refreshController!)
        }
        refreshController?.addTarget(self, action: #selector(refreshNewsData), for: .valueChanged)
    }
    
    func reloadData(){
        self.tableView.reloadData()
    }
    
    func showSpinner(){
        spinner = displaySpinner(onView: self.view)
    }
    
    func hideSpinner(){
        if let spin = spinner{
            removeSpinner(spinner: spin)
        }
        if let refresher = refreshController{
            refresher.endRefreshing()
        }
        
    }
    
    @objc func moveToMealScreenWithIndex(clickedMeal: Int){
        navigationController?.pushViewController(SingleViewController(singleArticle: presenter.getNews()[clickedMeal]), animated: true)
    }
    
    @objc func refreshNewsData(){
        presenter.refreshData(forceRefresh:true)
    }
}
