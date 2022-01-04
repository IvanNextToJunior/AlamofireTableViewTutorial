//
//  AlamofireNetworking.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 27.12.2021.
//

import Foundation
import Alamofire

class AlamofireNetworking {
  
    func predictAge(for personAtIndex: Int) -> Person {
        var human = Person(name: "", age: 0)
        
        AF.request("https://api.agify.io?name[]=\(UserData.names[personAtIndex])").responseDecodable(of: Person.self) {
            response in
            
            guard let person = response.value else { return }
            human = person
            
            print(person)
            print(human)
        }
    return human
    }
 

}
