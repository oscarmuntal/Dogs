//
//  DogsListView.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol DogsListViewInterface {
}

//MARK: DogsListView Class
final class DogsListView: UserInterface {
}

//MARK: - Public interface
extension DogsListView: DogsListViewInterface {
}

// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension DogsListView {
    var presenter: DogsListPresenter {
        return _presenter as! DogsListPresenter
    }
    var displayData: DogsListDisplayData {
        return _displayData as! DogsListDisplayData
    }
}
