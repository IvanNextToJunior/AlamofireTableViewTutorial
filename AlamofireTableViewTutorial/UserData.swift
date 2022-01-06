//
//  UserData.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 04.01.2022.
//

import Foundation
class UserData {
    
private let key = "name"
private let userDefaults = UserDefaults()
 static var names: [String] = []
    
    func saveArray()  {
        userDefaults.set(UserData.names, forKey: key)
    }

}
