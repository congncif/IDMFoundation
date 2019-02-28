//
//  SearchUserView.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 2/28/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ViewStateCore

class SearchUserView: UIView {
    @IBOutlet weak var tableView: UITableView!

    var dataSource = SearchUserArrayController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.dataSource = dataSource
    }
}

extension SearchUserView: ViewStateRenderable {
    func render(state: ViewState) {
        guard let state = state as? SearchUserViewState else {
            return
        }
        dataSource.users = state.users
        tableView.reloadData()
    }
}
