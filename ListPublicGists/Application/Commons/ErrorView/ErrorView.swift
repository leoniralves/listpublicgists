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
    @IBOutlet weak private var confirmButton: UIButton!
    
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
                     action: (()->Void)?) {
        self.init(frame: .zero)
        self.action = action
        configureView(title: title,
                      descriptionText: description,
                      image: image)
    }
    
    convenience init(error: NetworkError,
                     action: (()->Void)?) {
        self.init(frame: .zero)
        self.action = action
        configureDefaultView(with: error)
    }
    
    // MARK: Private Methods
    private func configureDefaultView(with error: NetworkError) {
        switch error {
        case .network:
            configureView(title: ErrorViewStrings.Network.title,
                          descriptionText: ErrorViewStrings.Network.description,
                          image: #imageLiteral(resourceName: "networkError"))
        case .service:
            configureView(title: ErrorViewStrings.Service.title,
                          descriptionText: ErrorViewStrings.Service.description,
                          image: #imageLiteral(resourceName: "serviceError"))
        default:
            configureView(title: ErrorViewStrings.Generic.title,
                          descriptionText: ErrorViewStrings.Generic.description,
                          image: #imageLiteral(resourceName: "genericError"))
        }
    }
    
    private func configureView(title: String,
                               descriptionText: String,
                               image: UIImage) {
        titleLabel.text = title
        descriptionLabel.text = descriptionText
        iconImage.image = image
        confirmButton.layer.cornerRadius = 10.0
    }
    
    // MARK: Actions
    @IBAction func actionOk(_ sender: Any) {
        action?()
        close?()
    }
}
