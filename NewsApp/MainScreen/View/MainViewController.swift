//
//  MainViewController.swift
//  NewsApp
//
//  Created by Valentin Šarić on 22/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift
class MainViewController: UITableViewController,LoaderManager{
    
    
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
        viewModel.initData().disposed(by: disposeBag)
        viewModel.initGetingDataFromRepository().disposed(by: disposeBag)
        viewModel.initSpinnerLogic().disposed(by: disposeBag)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.refreshData() //TODO: ovdje logiku ispraviti
        print(Realm.Configuration.defaultConfiguration.fileURL!)
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
            (viewModel.getNews()[indexPath.row].isFavorite) ? cell.button.setBackgroundImage(#imageLiteral(resourceName: "removeImage"), for: .normal) : cell.button.setBackgroundImage(#imageLiteral(resourceName: "addImage"), for: .normal)
            cell.button.tag = indexPath.row
            cell.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
            return cell
        }
        else{
            return TableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToSingleScreenWithIndex(clickedNews: indexPath.row)
    }
    
    private func registerCells(){
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "customeCell")
    }
    
    private func setupNavigationBar(){
        navigationItem.title = "New Articles"
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
    
    private func initSubscripts(){
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
    
    @objc func moveToSingleScreenWithIndex(clickedNews: Int){
        navigationController?.pushViewController(SingleViewController(singleArticle: viewModel.getNews()[clickedNews]), animated: true)
    }
    
    @objc func refreshNewsData(){
        viewModel.refreshData()
    }
    
    @objc func buttonClicked(sender:UIButton)
    {
        viewModel.setNewsToFavorites(index: sender.tag)
    }
}
