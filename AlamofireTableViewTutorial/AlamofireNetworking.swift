//
//  AlamofireNetworking.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 27.12.2021.
//

import Foundation
import Alamofire

class AlamofireNetworking {
  
    var people: [Person] = []

    func getAge(for names: [String]) -> [Person] {
        for name in names {
            AF.request("https://api.agify.io?name=\(name)").responseDecodable(of: Person.self, queue: .global(qos: .userInitiated)){ response in
              
                guard let person = response.value else {return}
                self.people.append(person)
        }
         
    }
return people
    }
 

}
