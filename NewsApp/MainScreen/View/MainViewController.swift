//
//  MainViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UITableViewController,MainView,LoaderManager{
    
    
    var viewModel : MainViewModelProtocol!
    var loader : UIView?
    var refreshController: UIRefreshControl?
    var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCells()
        setupRefreshControl()
        self.viewModel = MainViewModel()
        initSubscripts()
        //Init disposebles in presenter
        viewModel.initGetingDataFromRepository().disposed(by: disposeBag)
        viewModel.initSpinnerLogic().disposed(by: disposeBag)
        viewModel.refreshData(forceRefresh: false)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNews().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customeCell", for: indexPath) as? TableViewCell{
            cell.setTitle(title: viewModel.getNews()[indexPath.row].title)
            cell.setPicture(url: viewModel.getNews()[indexPath.row].urlToImage)
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
    
    func initSubscripts(){
        //reloading data
        
        viewModel.viewReloadData.subscribe(onNext: { [unowned self] reload in
                if reload{
                    self.reloadData()
                }
            }).disposed(by: self.disposeBag)
        // show/hide Loader
        
        viewModel.viewShowLoader.subscribe(onNext: { [unowned self] showLoader in
            if showLoader{
                self.displayLoader()
            }else{
                self.hideLoader()
            }
        }).disposed(by: self.disposeBag)
        
        // show/hide Loader
        viewModel.viewShowSpinner.subscribe(onNext: { [unowned self] showSpinner in
            if showSpinner{
                self.displayLoader()
            }else{
                self.hideSpinner()
            }
        }).disposed(by: self.disposeBag)
    }
    
    func displayLoader() {
        loader = displayLoader(onView: self.view)
    }
    
    func hideLoader() {
        if let loader = loader{
            removeLoader(loader: loader)
        }
    }
    
    func reloadData(){
        self.tableView.reloadData()
    }
    
    func hideSpinner(){
        refreshController?.endRefreshing()
    }
    
    @objc func moveToMealScreenWithIndex(clickedMeal: Int){
        navigationController?.pushViewController(SingleViewController(singleArticle: viewModel.getNews()[clickedMeal]), animated: true)
    }
    
    @objc func refreshNewsData(){
        viewModel.refreshData(forceRefresh:true)
    }
}
