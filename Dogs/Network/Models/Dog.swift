//
//  Dog.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation

enum Gender: String {
    case Male = "Male"
    case Female = "Female"
}

enum Size: String {
    case Small = "Small"
    case Medium = "Medium"
    case Large = "Large"
    case Giant = "Giant"
}

class Dog {
    
    var name: String?
    var gender: Gender?
    var size: Size?
    var age: Int?
    
    init() {
        self.name = nil
        self.gender = nil
        self.size = nil
        self.age = nil
    }
    
    init(name: String, gender: Gender, size: Size, age: Int) {
        self.name = name
        self.gender = gender
        self.size = size
        self.age = age
    }
}
