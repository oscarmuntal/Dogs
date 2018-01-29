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
        newDog()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension DogsListView {
    
    fileprivate func setUI() {
        setTitle()
        setAddMonumentButton()
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
    
    private func setAddMonumentButton() {
        let addDogButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:  #selector(addDogButtonAction))
        addDogButton.tintColor = UIColor.white
        self.navigationItem.setRightBarButtonItems([addDogButton], animated: true)
    }
    
    @objc private func addDogButtonAction(sender: UIButton!) {
        newDog()
    }
    
    fileprivate func newDog() {
        presenter.addDogTapped(onSuccess: { newDogViewController in
            self.setNewDogDelegate(newDogViewController)
        })
    }
    
}

extension DogsListView: NewDogViewInterface {
    
    func saveDog(dog: Dog) {
        presenter.addDog(dog)
//        tableView.reloadData()
    }
    
    func setNewDogDelegate(_ newDogViewController: NewDogView) {
        newDogViewController.delegate = self
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
