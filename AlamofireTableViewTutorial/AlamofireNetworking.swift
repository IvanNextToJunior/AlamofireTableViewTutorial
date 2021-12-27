//
//  AlamofireNetworking.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 27.12.2021.
//

import Foundation
import Alamofire

class AlamofireNetworking {
  
   private var people: [Person] = []
   
    func predictAge(for name: String) -> [Person]{
      
        AF.request("https://api.agify.io?name=\(name)").responseDecodable(of: Person.self, queue: .global(qos: .userInitiated)){ response in
          
            guard let person = response.value else { return }
            print(person)
            self.people.append(person)
            
        }
   return people
}

}
