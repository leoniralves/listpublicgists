//
//  ErrorViewProtocol.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import UIKit

protocol ErrorViewProtocol {
    func showError(error: NetworkError,
                   action: @escaping ()->Void)
}

extension ErrorViewProtocol where Self: UIView {
    func showError(error: NetworkError,
                   action: @escaping ()->Void) {
        print(">>> UIView")
    }
}

extension ErrorViewProtocol where Self: UITableView {
    func showError(error: NetworkError,
                   action: @escaping ()->Void) {
        let errorView = ErrorView(error: error,
                                  action: action)
        backgroundView = errorView
        
        errorView.close = {
            self.backgroundView = nil
        }
    }
}
