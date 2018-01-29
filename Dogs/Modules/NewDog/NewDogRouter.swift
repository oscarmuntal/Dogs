//
//  NewDogRouter.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import Foundation
import Viperit

class NewDogRouter: Router {
    
    func showNewDog(fromVC: UIViewController, onSuccess: @escaping ObjectClosure<NewDogView>) {
        presenter.onSuccess = onSuccess
        guard let vc = self.presenter._view else { return }
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension NewDogRouter {
    var presenter: NewDogPresenter {
        return _presenter as! NewDogPresenter
    }
}
