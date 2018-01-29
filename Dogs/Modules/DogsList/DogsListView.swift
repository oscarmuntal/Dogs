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
    
    @IBOutlet weak var emptyListLabel: UILabel!
    @IBOutlet weak var addDogButton: UIButton!
    
    @IBAction func addDogButtonAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension DogsListView {
    
    fileprivate func setUI() {
        setTitle()
        setNavigationBarColor()
        initializeEmptyListProperties()
        
        if presenter.dogs.isEmpty {
            showEmptyProperties()
        } else {
            hideEmptyProperties()
        }
    }
    
    private func setTitle() {
        title = displayData.dogsListTitle
    }
    
    private func setNavigationBarColor() {
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    private func initializeEmptyListProperties() {
        emptyListLabel.text = displayData.emptyListLabel
        addDogButton.setTitle(displayData.addDogButtonLabel, for: .normal)
        addDogButton.backgroundColor = UIColor.red
        addDogButton.layer.cornerRadius = 10
        addDogButton.clipsToBounds = true
    }
    
    private func showEmptyProperties() {
        self.emptyListLabel.isHidden = false
        self.addDogButton.isHidden = false
    }
    
    private func hideEmptyProperties() {
        self.emptyListLabel.isHidden = true
        self.addDogButton.isHidden = true
    }
    
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
