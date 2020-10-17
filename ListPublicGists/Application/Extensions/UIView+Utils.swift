//
//  UIView+Utils.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

// MARK: Extensions

extension UIView: ErrorViewProtocol {}

extension UIView {
    /// Carrega a view de um XIB para uma classe UIView
    func loadView() {
        let nib = UINib(nibName: String(describing: Self.self),
                        bundle: nil)
        
        guard let view = nib.instantiate(withOwner: self,
                                         options: nil).first as? UIView else {
            return
        }
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    /// Seta o anchor automaticamente para top, left, right e bottom
    /// - Parameter view: UIView
    func allAnchor(equalTo view: UIView) {
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    /// Helper para cuidar da inserção de views sem precisar preocupar se as mesmas
    /// estão `unwrapped`
    /// - Parameter view: UIView
    func addSubview(_ view: UIView?) {
        guard let view = view else {
            return
        }
        addSubview(view)
    }
}
