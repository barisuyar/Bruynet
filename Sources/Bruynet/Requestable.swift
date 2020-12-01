//
//  File.swift
//  
//
//  Created by Barış Uyar on 1.12.2020.
//

import Foundation

public protocol Requestable {
    var networkProtocol: Calling { get }
}
