//
//  UITableView+Utils.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

// MARK: Protocols

protocol ReusableView {
    /// Otém um identificador da `célula` baseado no seu `nome`
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

// MARK: Extensions

extension UITableView {
    
    /// Registra um `célula` na `UITableView`
    /// - Parameter cell: Tipo da `célula`
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Wrapper para realizar o dequeue baseado no tipo da `célula`, sem precisar de fazer `downcasting`.
    /// Caso falhe o dequeue um `fataError` será lançado
    /// - Returns: Célula a ser apresentada
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Error dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableViewCell: ReusableView {}
