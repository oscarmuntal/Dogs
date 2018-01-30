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
    @IBOutlet weak var tableView: UITableView!
    
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
        
        let fakeDog = Dog(name: "Fake Dog", description: "", gender: .Female, size: .Large, age: 21)
        presenter.dogs.append(fakeDog)
        
        if presenter.dogs.isEmpty {
            showEmptyProperties()
        } else {
            hideEmptyProperties()
        }
        registerCells()
        reloadData()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: displayData.dogTableViewCell, bundle: nil), forCellReuseIdentifier: displayData.dogTableViewCell)
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
        self.tableView.isHidden = true
    }
    
    private func hideEmptyProperties() {
        self.emptyListLabel.isHidden = true
        self.addDogButton.isHidden = true
        self.tableView.isHidden = false
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
    
    fileprivate func reloadData() {
        tableView.reloadData()
    }
    
}

extension DogsListView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: displayData.dogTableViewCell, for: indexPath as IndexPath) as! DogTableViewCell
        cell.configure(presenter.dogs[indexPath.row])
        return cell
    }
}

extension DogsListView: NewDogViewInterface {
    
    func saveDog(_ dog: Dog) {
        presenter.addDog(dog)
        reloadData()
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
