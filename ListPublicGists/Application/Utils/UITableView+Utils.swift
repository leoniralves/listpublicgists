//
//  UITableView+Utils.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

// MARK: Protocols

protocol ReusableView {
    /// Obtém um identificador da `célula` baseado no seu `nome`
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

// MARK: Extensions

extension UITableViewCell: ReusableView {}

extension UITableView {
    
    /// Registra um `célula` na `UITableView`
    /// - Parameter cell: Tipo da `célula`
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: String(describing: T.self),
                            bundle: nil),
                      forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Wrapper para realizar o dequeue baseado no tipo da `célula`, sem precisar de fazer `downcasting`.
    /// Caso falhe o dequeue um `fataError` será lançado
    /// - Returns: Célula a ser apresentada
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier,
                                                  for: indexPath) as? T else {
            fatalError("Error dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {
    private struct AssociatedKeys {
        static var originalFooterView = "originalFooterView"
    }
    
    private var originalFooterView: UIView? {
        get {
            return objc_getAssociatedObject(self,
                                            &AssociatedKeys.originalFooterView) as? UIView
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self,
                                         &AssociatedKeys.originalFooterView,
                                         newValue,
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    /// Adiciona uma view à FooterView para representar o estado de carregamento
    /// - Parameter show: Exibir ou esconder a view de carregamento
    func loadingInFooterView(show: Bool) {
        self.originalFooterView = self.originalFooterView ?? tableFooterView
        
        if show {
            let view = UIView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: self.frame.width,
                                            height: 44))
            view.backgroundColor = .red
            tableFooterView = view
            
            let spinning = UIActivityIndicatorView()
            spinning.startAnimating()
            spinning.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(spinning)
            spinning.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            spinning.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        } else {
            tableFooterView = self.originalFooterView
        }
    }
}
