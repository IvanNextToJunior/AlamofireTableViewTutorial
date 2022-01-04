//
//  UserData.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 04.01.2022.
//

import Foundation
class UserData {
    private let key = "names"
    private let userDefaults = UserDefaults()
    
    func save (names: [String]) {
        userDefaults.setValue(names, forKey: key)
    }
    func getValue () -> [String] {
       
        guard let array = userDefaults.array(forKey: key) as? [String] else {return []}
   
        return array
    }

}
