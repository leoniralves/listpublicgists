//
//  OwnerViewCell.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

class OwnerViewCell: UITableViewCell {
    
    // MARK: Private Outlets
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: Public Methods
    func configure(_ owner: GistOwner) {
        nameLabel.text = owner.login
        
        guard let url = URL(string: owner.avatar_url) else {
            return
        }
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        
        thumbImageView.load(url: url,
                            view: activityIndicator,
                            cache: Cache.shared)
    }
    
    override func prepareForReuse() {
        thumbImageView.image = nil
        nameLabel.text = nil
    }
}
