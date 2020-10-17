//
//  ErrorView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import UIKit

class ErrorView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet weak private var iconImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    // MARK: Private Properties
    private(set) var action: (()->Void)?
    
    // MARK: Public Properties
    var close: (()->Void)?
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String,
                     descriptionText: String,
                     image: UIImage,
                     action: @escaping ()->Void) {
        self.init(frame: .zero)
        
        titleLabel.text = title
        descriptionLabel.text = descriptionText
        iconImage.image = image
        self.action = action
    }
    
    // MARK: Actions
    @IBAction func actionOk(_ sender: Any) {
        action?()
        close?()
    }
}
