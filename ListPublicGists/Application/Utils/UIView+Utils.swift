//
//  UIView+Utils.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

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
}
