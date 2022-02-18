//
//  NewConversationViewController.swift
//  ChatApp
//
//  Created by 최기훈 on 2022/02/15.
//

import UIKit
import JGProgressHUD


class NewConversationViewController: UIViewController {

    private let spinner = JGProgressHUD()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "친구 찾기"
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let noResultLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과 없음"
        label.textColor = .green
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "취소",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        searchBar.becomeFirstResponder() 
    }

    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

}
extension NewConversationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    
}
