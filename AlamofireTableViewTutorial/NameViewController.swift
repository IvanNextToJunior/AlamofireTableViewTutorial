//
//  NameViewController.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 01.01.2022.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak private var nameTextField: UITextField!
    
    @IBAction private func registerNameButtonTouchUpInside(_ sender: UIButton) {
        validate()
    }
    
    
    private func validate() {
       
        do {
            let name = try nameTextField.validateText(validators: [TextLengthValidator(minTextLength: 2, message: "В имени должно быть не менее 2 символов"), RegularExpressionValidator(pattern: "^[a-zA-Zа-яА-Я]+$", message: "Имя содержит недопустимые симоволы")])
            
            userData.save(name)
            performSegue(withIdentifier: "person", sender: self)
        }
        catch {
            let e = error
            
            debugPrint(e)
            let alert = UIAlertController(title: "Ошибка валидации", message: (error as! ValidationError).message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default, handler:nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    let userData = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
    }
    
    
}
extension NameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


