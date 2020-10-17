//
//  ErrorViewProtocol.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
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
