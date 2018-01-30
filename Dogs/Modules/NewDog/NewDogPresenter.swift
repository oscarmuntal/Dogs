//
//  NewDogPresenter.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class NewDogPresenter: Presenter {
    
    var dog: Dog?
    var onSuccess: ObjectClosure<NewDogView>?
    
    func validateDog() -> Bool {
        if  isValidName() && isValidDescription() {
            return true
        } else { return false }
    }
    
    func isValidName() -> Bool {
        if  let validDog = self.dog,
            let name = validDog.name,
            name != "" {
            return true
        } else { return false }
    }
    
    func isValidDescription() -> Bool {
        if  let validDog = self.dog,
            let description = validDog.description,
            description != "" {
            return true
        } else { return false }
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension NewDogPresenter {
    var view: NewDogViewInterface {
        return _view as! NewDogViewInterface
    }
    var interactor: NewDogInteractor {
        return _interactor as! NewDogInteractor
    }
    var router: NewDogRouter {
        return _router as! NewDogRouter
    }
}
