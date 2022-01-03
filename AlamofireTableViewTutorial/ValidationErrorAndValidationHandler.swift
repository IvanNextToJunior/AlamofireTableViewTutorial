//
//  ErrorValidation.swift
//  TutorTask
//
//  Created by Ivan on 08.07.2021.
//

import Foundation

protocol ValidationHandler {
    func validate (_ value: String) throws -> String
}

class ValidationError: Error {
    
    var message: String
    
    init (message: String) {
        self.message = message
    }
}



