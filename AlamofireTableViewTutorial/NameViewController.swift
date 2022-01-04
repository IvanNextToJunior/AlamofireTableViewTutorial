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
    private let content = TableOFContents()
    
    
    let userDefaults = UserData()
    private func validate() {
       
        do {
            let name = try nameTextField.validateText(validators: [TextLengthValidator(minTextLength: 2, message: "В имени должно быть не менее 2 символов"), RegularExpressionValidator(pattern: "^[a-zA-Zа-яА-Я]+$", message: "Имя содержит недопустимые симоволы")])
            content.names.append(name)
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
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PersonViewController
        destination.delegate = self
//        guard !destination.model.people.isEmpty else {return}
      
    
    }
}
extension NameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension NameViewController: PersonViewControllerDelegate {
   
    func personViewControllerDidShowVC(vc: PersonViewController) {
      
        userDefaults.save(names: content.names)
        vc.userDefaults = userDefaults
      
         
    }
    
    
}
