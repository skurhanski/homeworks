//
//  PersonTableViewCell.swift
//  UITableView
//
//  Created by Sergey Kurgansky on 20.01.2024.
//

import UIKit

final class PersonTableViewCell: UITableViewCell {
    
    static let identifire = "PersonTableViewCell"
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var surnameLabel: UILabel!
}
