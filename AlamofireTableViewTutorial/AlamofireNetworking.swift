//
//  AlamofireNetworking.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 27.12.2021.
//

import Foundation
import Alamofire

class AlamofireNetworking {
    
    private var human = Person()
    
    func predictAge(for personAtIndex: Int) -> Person {
      
        AF.request("https://api.agify.io?name[]=\(UserData.names[personAtIndex])").responseDecodable(of: [Person].self) {
            response in
            print(response.error.debugDescription)
            guard let elements = response.value else {return}
          let person = elements[personAtIndex]
            assert(person.name != "" && person.age != 0, "There is no person")
            
            self.human = person
            print(self.human)
            
           
        }
        return human
    }
    
    
}
