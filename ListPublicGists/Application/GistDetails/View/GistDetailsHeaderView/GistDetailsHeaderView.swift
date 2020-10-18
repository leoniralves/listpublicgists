//
//  GistDetailsHeaderView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import UIKit

class GistDetailsHeaderView: UIView {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var ownerLoginInputLabel: UILabel!
    @IBOutlet weak var gistDescriptionInputLabel: UILabel!
    @IBOutlet weak var gistCreateAtLabel: UILabel!
    @IBOutlet weak var gistCreateAtInputLabel: UILabel!
    @IBOutlet weak var gistUpdateAtLabel: UILabel!
    @IBOutlet weak var gistUpdateAtInputLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func configure(gist: Gist) {
        
        // Owner
        if let url = URL(string: gist.owner.avatarUrl) {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.startAnimating()
            thumbImageView.load(url: url,
                                placeholder: activityIndicator,
                                cache: Cache.shared)
            thumbImageView.layer.cornerRadius = thumbImageView.frame.width/2
        }
        else {
            thumbImageView.isHidden = true
        }
        
        ownerLoginInputLabel.text = gist.owner.login
        
        // Gist
        gistDescriptionInputLabel.text = gist.description
        gistCreateAtLabel.text = GistDetailsStrings.GistDetailsHeaderView.gistCreateAtLabel
        gistCreateAtInputLabel.text = gist.createdAt.getFormattedDate(format: "dd/MM/yyyy")
        gistUpdateAtLabel.text = GistDetailsStrings.GistDetailsHeaderView.gistUpdateAtLabel
        gistUpdateAtInputLabel.text = gist.updatedAt.getFormattedDate(format: "dd/MM/yyyy")
    }
}
