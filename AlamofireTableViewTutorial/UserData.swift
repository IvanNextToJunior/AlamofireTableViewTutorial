//
//  UserData.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 02.01.2022.
//

import Foundation
class UserData {
    
    private let key = "name"
    private let userDefaults = UserDefaults()
    
    func getUserName(_ name: String) -> String {
      
        userDefaults.setValue(name, forKey: key)
        
        guard let userName = userDefaults.string(forKey: key) else {return ""}
        print(userName)
        return name
    }
    
}
