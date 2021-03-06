//
//  TableArrayController.swift
//  NativeRouter
//
//  Created by NGUYEN CHI CONG on 2/1/19.
//  Copyright © 2019 NGUYEN CHI CONG. All rights reserved.
//

import Foundation
import UIKit
import ViewStateCore

class SearchUserArrayController: NSObject, UITableViewDataSource {
    var users: [SearchUserModel] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: SearchUserTableViewCell.className, for: indexPath)
        
        if let cell = dequeueCell as? SearchUserTableViewCell {
            let model = users[indexPath.row]
            
            cell.thumbImageView.image = nil
            if let avatar = model.avatar {
                let url = URL(string: avatar)
                cell.thumbImageView.sd_setImage(with: url)
            }
            cell.titleLabel.text = model.name
            cell.homePageLabel.text = model.profileUrl
        }
        
        return dequeueCell
    }
}
