//
//  File.swift
//  
//
//  Created by Barış Uyar on 1.12.2020.
//

import Foundation

var BaseURLKey: UInt8 = 0
public extension URLSession {
    var baseURL: String? {
        get {
            return objc_getAssociatedObject(self, &BaseURLKey) as? String
        }
        set {
            if let value = newValue {
                objc_setAssociatedObject(self, &BaseURLKey, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
