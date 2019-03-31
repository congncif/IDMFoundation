//
//  SearchUserNavigationView.swift
//  IDMSample
//
//  Created by NGUYEN CHI CONG on 3/31/19.
//  Copyright © 2019 [iF] Solution. All rights reserved.
//

import UIKit
import ViewStateCore

final class SearchUserNavigationView: NSObject {
    weak var actionDelegate: SearchUserViewActionDelegate?
    
    weak var navigationItem: UINavigationItem!
    
    @objc func refreshButtonDidTap() {
        actionDelegate?.refresh()
    }
}

extension SearchUserNavigationView: ViewStateRenderable {
    func render(state: ViewState) {
        guard let state = state as? SearchUserViewState else { return }
        navigationItem.title = state.query
    }
}
