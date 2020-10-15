//
//  Cache.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 14/10/20.
//

import UIKit

final class Cache: CacheProtocol {
    static var shared: Cache = Cache()
    
    private var cache: NSCache<NSString, UIImage>
    
    private init() {
        self.cache = NSCache()
    }
    
    func set(key: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: key))
    }
    
    func get(key: String) -> UIImage? {
        cache.object(forKey: NSString(string: key))
    }
}
