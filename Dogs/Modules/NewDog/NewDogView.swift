//
//  NewDogView.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol NewDogViewInterface {
    func saveDog(dog: Dog)
}

//MARK: NewDogView Class
final class NewDogView: UserInterface {
    
    var delegate: NewDogViewInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension NewDogView {
    var presenter: NewDogPresenter {
        return _presenter as! NewDogPresenter
    }
    var displayData: NewDogDisplayData {
        return _displayData as! NewDogDisplayData
    }
}
