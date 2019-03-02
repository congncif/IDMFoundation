//
//  SearchUserView.swift
//  IDMFoundation_Example
//
//  Created by NGUYEN CHI CONG on 2/28/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ViewStateCore

class SearchUserView: UIView, SearchViewViewProtocol {
    weak var actionDelegate: SearchUserViewActionDelegate?

    var dataSource = SearchUserArrayController()

    private var tableView: UITableView!

    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero, style: .plain)
        super.init(frame: frame)

        tableView.frame = bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(tableView)

        let nib = UINib(nibName: SearchUserTableViewCell.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SearchUserTableViewCell.className)

        tableView.rowHeight = 80 // UITableView.automaticDimension
        tableView.estimatedRowHeight = 44

        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = dataSource
    }

    @objc func refreshButtonDidTap() {
        actionDelegate?.refresh()
    }
}

extension SearchUserView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        actionDelegate?.listItemDidSelect(at: indexPath.row)
    }
}

extension SearchUserView: ViewStateRenderable {
    func render(state: ViewState) {
        guard let state = state as? SearchUserViewState else { return }
        dataSource.users = state.users
        tableView.reloadData()
    }
}
