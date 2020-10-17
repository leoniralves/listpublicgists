//
//  ErrorView.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import UIKit

protocol ErrorViewProtocol {
    func showError(title: String,
                   description: String,
                   image: UIImage,
                   action: @escaping ()->Void)
}

extension ErrorViewProtocol where Self: UIView {
    func showError(title: String,
                   description: String,
                   image: UIImage,
                   action: @escaping ()->Void) {
        print(">>> UIView")
    }
}

extension ErrorViewProtocol where Self: UITableView {
    func showError(title: String,
                   description: String,
                   image: UIImage,
                   action: @escaping ()->Void) {
        let errorView = ErrorView(title: title,
                                  descriptionText: description,
                                  image: image,
                                  action: action)
        backgroundView = errorView
        
        errorView.close = {
            self.backgroundView = nil
        }
    }
}

extension UIView: ErrorViewProtocol {}

class ErrorView: UIView {
    
    // MARK: Private Outlets
    @IBOutlet weak private var iconImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    // MARK: Private Properties
    private var action: (()->Void)?
    
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
    
    @IBAction func actionOk(_ sender: Any) {
        action?()
        close?()
    }
}
