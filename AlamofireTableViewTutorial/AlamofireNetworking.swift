//
//  AlamofireNetworking.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 27.12.2021.
//

import Foundation
import Alamofire

class AlamofireNetworking {
    
    private var human: Person?
    
    func predictAge(for personAtIndex: Int) -> Person {
        guard var individual = human else {return Person(name: "", age: 0)}
        
        
        AF.request("https://api.agify.io?name[]=\(UserData.names[personAtIndex])").responseDecodable(of: Person.self) {
            response in
            
            guard let person = response.value else {return}
            individual = person
            
            assert(response.value != nil, "There is no person")
            assert(self.human != nil)
            print("\(person)")
            print(self.human)
        }
        return individual
    }
    
    
}
