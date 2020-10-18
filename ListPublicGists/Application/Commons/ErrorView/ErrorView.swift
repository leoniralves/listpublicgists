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
    
    convenience init(error: NetworkError,
                     action: @escaping ()->Void) {
        self.init(frame: .zero)
        self.action = action
        setupLayout(error: error)
    }
    
    private func setupLayout(error: NetworkError) {
        confirmButton.layer.cornerRadius = 10.0
        
        switch error {
        case .network:
            break
        case .parse:
            break
        case .service:
            setupServiceError()
        case .unknown:
            break
        }
    }
    
    private func setupNetworkError() {
        iconImage.image = #imageLiteral(resourceName: "networkError")
        titleLabel.text = ErrorViewStrings.Network.title
        descriptionLabel.text = ErrorViewStrings.Network.description
    }
    
    private func setupServiceError() {
        iconImage.image = #imageLiteral(resourceName: "networkError")
        titleLabel.text = ErrorViewStrings.Service.title
        descriptionLabel.text = ErrorViewStrings.Service.description
    }
    
    // MARK: Actions
    @IBAction func actionOk(_ sender: Any) {
        action?()
        close?()
    }
}
