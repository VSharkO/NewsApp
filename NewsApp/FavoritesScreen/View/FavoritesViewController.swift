//
//  FavoritesViewConrtoller.swift
//  NewsApp
//
//  Created by Valentin Šarić on 31/10/2018.
//  Copyright © 2018 Valentin Šarić. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class FavoritesViewController:  UITableViewController{
    
    var viewModel : FavoritesViewModelProtocol!
    var disposeBag: DisposeBag = DisposeBag()
    var favoritesCoordinatorDelegate: SingleScreenCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerCells()
        initSubscripts()
        viewModel.initGetingDataFromRepository().disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.refreshData()
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
            cell.button.setBackgroundImage(#imageLiteral(resourceName: "removeImage"), for: .normal)
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
        navigationItem.title = "Favorites"
    }
    
    func reloadData(){
        self.tableView.reloadData()
    }
    
    private func initSubscripts(){
        viewModel.viewReloadData.subscribe(onNext: { [unowned self] reload in
            if reload{
                self.reloadData()
            }
        }).disposed(by: self.disposeBag)
    }
    
    @objc func moveToSingleScreenWithIndex(clickedNews: Int){
        favoritesCoordinatorDelegate?.openNextScreen(article: viewModel.getNews()[clickedNews])
    }
    
    @objc func buttonClicked(sender:UIButton)
    {
        viewModel.removeNewsFromFavorites(index: sender.tag)
    }
}

