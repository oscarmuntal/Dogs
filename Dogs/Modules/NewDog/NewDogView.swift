//
//  NewDogView.swift
//  Dogs
//
//  Created by Òscar Muntal on 29/01/2018.
//Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Viperit

//MARK: - Public Interface Protocol
protocol NewDogViewInterface {
    func saveDog(_ dog: Dog)
}

//MARK: NewDogView Class
final class NewDogView: UserInterface {
    
    var delegate: NewDogViewInterface?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var yearOfBirtheButton: UIButton!
    
    @IBAction func genderButtonAction(_ sender: Any) {
    }
    @IBAction func sizeButtonAction(_ sender: Any) {
    }
    @IBAction func yearOfBirtheButtonAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onSuccess!(self)
        self.setUI()
    }
}


extension NewDogView {
    
    fileprivate func setUI() {
        title = displayData.addDogTitle
        
        setCancelButton()
        setSaveButton()
        setNewEmptyDog()
        setTextFieldDelegates()
        setTextFieldTags()
    }
    
    private func setNewEmptyDog() {
        presenter.dog = Dog()
    }
    
    fileprivate func setTextFieldDelegates() {
        nameTextField.delegate = self
        descriptionTextField.delegate = self
    }
    
    fileprivate func setTextFieldTags() {
        nameTextField.tag = displayData.nameTag
        descriptionTextField.tag = displayData.descriptionTag
    }
    
    fileprivate func saveContent(_ textField: UITextField) {
        
        switch textField.tag {
        case displayData.nameTag:
            presenter.dog?.name = textField.text ?? ""
        case displayData.descriptionTag:
            presenter.dog?.description = textField.text ?? ""
        default:
            presenter.dog?.name = textField.text ?? ""
        }
    }
    
    private func setCancelButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action:  #selector(cancelAction))
        cancelButton.tintColor = UIColor.white
        self.navigationItem.setLeftBarButton(cancelButton, animated: true)
    }
    
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func setSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action:  #selector(saveAction))
        saveButton.tintColor = UIColor.white
        self.navigationItem.setRightBarButton(saveButton, animated: true)
    }
    
    @objc private func saveAction() {
        if  presenter.validateDog(),
            let dog = presenter.dog{
            delegate?.saveDog(dog)
            navigationController?.popViewController(animated: true)
        } else {
            showMandatoryFields()
        }
    }
    
    private func showMandatoryFields() {
        if !presenter.isValidName() {
            self.nameTextField.attributedPlaceholder = NSAttributedString(string: displayData.mandatoryNamePlaceholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
        }
        
        if !presenter.isValidDescription() {
            self.descriptionTextField.attributedPlaceholder = NSAttributedString(string: displayData.mandatoryDescriptionPlaceholder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.red])
        }
    }
}

extension NewDogView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called\(textField.text!)")
        saveContent(textField)
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }
    
}


// MARK: - VIPER COMPONENTS API (Auto-generated code)
private extension NewDogView {
    var presenter: NewDogPresenter {
        return _presenter as! NewDogPresenter
    }
    var displayData: NewDogDisplayData {
        return _displayData as! NewDogDisplayData
    }
}
