//
//  Animal.swift
//  SwiftObiC
//
//  Created by Ludovic Ollagnier on 27/04/2021.
//

import Foundation

class Animal: NSObject {

    @objc var name: String

    override init() {
        name = ""
    }

    @objc init(name: String) {
        self.name = name
    }
}
