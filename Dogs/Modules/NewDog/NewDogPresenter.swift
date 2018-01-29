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
    
    var onSuccess: ObjectClosure<NewDogView>?
    
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
