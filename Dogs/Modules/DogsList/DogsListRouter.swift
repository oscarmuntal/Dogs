//
//  DogsListRouter.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class DogsListRouter: Router {
    
    func goToNewDog(onSuccess: @escaping ObjectClosure<NewDogView>) {
        guard   let detailRouter = AppModules.NewDog.build().router as? NewDogRouter,
        let vc = self.presenter._view else { return }
        
        detailRouter.showNewDog(fromVC: vc, onSuccess: onSuccess)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension DogsListRouter {
    var presenter: DogsListPresenter {
        return _presenter as! DogsListPresenter
    }
}
