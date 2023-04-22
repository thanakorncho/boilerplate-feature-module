//
//  Pheriphery.swift
//  Feature_Example
//
//  Created by Thanakorn Chongcharoenthanakul on 22/4/2566 BE.
//  Copyright © 2566 BE CocoaPods. All rights reserved.
//

import Foundation

protocol MyProtocol {
    var usedProperty: String { get }
    var unusedProperty: String { get } // 'unusedProperty' is unused
}

class MyConformingClass: MyProtocol {
    var usedProperty: String = "used"
    var unusedProperty: String = "unused" // 'unusedProperty' is unused
}

class MyClass {
    let conformingClass: MyProtocol
    
    init() {
        conformingClass = MyConformingClass()
    }
    
    func perform() {
        print(conformingClass.usedProperty)
    }
}

class BaseGreeter {
    func greet(name: String) {
        print("Hello.")
    }
    
    func farewell(name: String) { // 'name' is unused
        print("Goodbye.")
    }
}

class InformalGreeter: BaseGreeter {
    override func greet(name: String) {
        print("Sup " + name + ".")
    }
    
    override func farewell(name: String) { // 'name' is unused
        print("Cya.")
    }
}
