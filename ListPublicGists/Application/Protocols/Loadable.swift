//
//  Loadable.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 16/10/20.
//

import UIKit

protocol Loadable {
    func loading(show: Bool)
}

extension Loadable where Self: UITableView {
    
    /// Exibe uma view de fundo dentro da UITableView, para indicar estado de carregamento
    /// - Parameter show: Exibir/Ocultar a tela de estado de carregamento
    func loading(show: Bool) {
        if show {
            let view = UIView()
            view.backgroundColor = .white
            tableFooterView = view
            
            let spinning = UIActivityIndicatorView()
            spinning.startAnimating()
            spinning.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(spinning)
            spinning.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            spinning.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
            backgroundView = view
        } else {
            backgroundView = nil
        }
    }
}
