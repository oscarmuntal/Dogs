//
//  DogTableViewCell.swift
//  Dogs
//
//  Created by Òscar Muntal on 30/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(_ dog: Dog) {
        titleLabel.text = dog.name
        
        subtitleLabel.text = "\(gender(dog)), \(years(dog)) years old"
    }
    
    private func gender(_ dog: Dog) -> String {
        guard let gender = dog.gender else { return "" }
        return gender.rawValue
    }
    
    private func years(_ dog: Dog) -> String {
        guard let years = dog.age else { return "" }
        return "\(years)"
    }
    
    
}
