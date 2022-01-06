//
//  AlamofireNetworking.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 27.12.2021.
//

import Foundation
import Alamofire

class AlamofireNetworking {
    
    private var human: [Person] = []
    
    func predictAge(for personAtIndex: Int) -> [Person]{
   
        
        AF.request("https://api.agify.io?name[]=\(UserData.names[personAtIndex])").responseDecodable(of: [Person].self) {
            response in
            

            guard let person = response.value else {return}
            print(response.value)
            self.human = person



        }
       
//        AF.request("https://api.agify.io?name[]=\(UserData.names[personAtIndex])").responseString { response in
//            guard let string = response.value else {
//                print(response.error)
//                return}
//
//            print(string)
//
//        }

       return human
    }
    
    
}
