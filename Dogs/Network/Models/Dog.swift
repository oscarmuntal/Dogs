//
//  Dog.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation

enum Gender {
    case Male
    case Female
}

enum Size {
    case Small
    case Medium
    case Large
    case Giant
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
