//
//  TextField_Extension.swift
//  TutorTask
//
//  Created by Ivan on 08.07.2021.
//

import UIKit

extension UITextField {
   
    var isValidated: Bool {
        self.text != ""
    }
    
//    func validateText(pattern: String, message: String) throws -> String {
//
//        try RegularExpressionHelper.setTextWithRegularExpression(pattern: pattern, text: self.text!, message: message)
//    }
    
    func validateText(validators: [ValidationHandler]) throws -> String {
        var result = ""
        
        try validators.forEach {
            result = try $0.validate(self.text!)
        }
        
        return result
    }
}
