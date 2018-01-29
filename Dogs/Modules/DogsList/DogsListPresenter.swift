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
    
    var dogs: [String] = []
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
