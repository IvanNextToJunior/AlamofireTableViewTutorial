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
    
    static var names: [String] = []
    
    func save(_ name: String)  {
        userDefaults.setValue(name, forKey: key)
    }
  
    private var name: String {
        get {
            return userDefaults.value(forKey: key) as! String
        }
        set {
            guard let userName = userDefaults.string(forKey: key) else { return  }
            UserData.names.append(userName)
        }
    
    }
  

}
