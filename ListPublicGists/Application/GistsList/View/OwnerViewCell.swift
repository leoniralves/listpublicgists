//
//  OwnerViewCell.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

class OwnerViewCell: UITableViewCell {
    
    // MARK: Private Outlets
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: Public Methods
    func configure(_ owner: GistOwner) {
        nameLabel.text = owner.login
    }
}
