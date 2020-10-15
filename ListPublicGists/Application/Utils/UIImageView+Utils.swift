//
//  UIImageView+Utils.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

extension UIImageView {
    
    private struct AssociatedKeys {
        static var sessionDataTask = "sessionDataTask"
    }
    
    private var task: URLSessionDataTask? {
        get {
            return objc_getAssociatedObject(self,
                                            &AssociatedKeys.sessionDataTask) as? URLSessionDataTask
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self,
                                         &AssociatedKeys.sessionDataTask,
                                         newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    func load<T: CacheProtocol>(url: URL, view: UIView, cache: T) where T.Key == String, T.Object == UIImage {
        if let imageCache = cache.get(key: url.absoluteString) {
            self.image = imageCache
        } else {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
            view.allAnchor(equalTo: self)
            
            if let imageCache = Cache.shared.get(key: url.absoluteString) {
                self.image = imageCache
            } else {
                task?.cancel()
                task = URLSession.shared.dataTask(with: url) { (data, _, _) in
                    DispatchQueue.main.async {
                        view.removeFromSuperview()
                        guard let data = data else {
                            return
                        }
                        guard let image = UIImage(data: data) else {
                            return
                        }
                        self.image = image
                        cache.set(key: url.absoluteString,
                                         image: image)
                    }
                }
            }
            task?.resume()
        }
    }
}
