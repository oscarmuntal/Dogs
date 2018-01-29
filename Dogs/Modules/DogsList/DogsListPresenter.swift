//
//  DogsListPresenter.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class DogsListPresenter: Presenter {
    
    var dogs: [Dog] = []
    
    func addDogTapped(onSuccess: @escaping ObjectClosure<NewDogView>) {
        router.goToNewDog(onSuccess: onSuccess)
    }
    
    func addDog(_ dog: Dog) {
        self.dogs.append(dog)
    }
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension DogsListPresenter {
    var view: DogsListViewInterface {
        return _view as! DogsListViewInterface
    }
    var interactor: DogsListInteractor {
        return _interactor as! DogsListInteractor
    }
    var router: DogsListRouter {
        return _router as! DogsListRouter
    }
}
