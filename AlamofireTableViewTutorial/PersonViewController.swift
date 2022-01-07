//
//  ViewController.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 25.12.2021.
//

import UIKit
import Alamofire
class PersonViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBOutlet weak private var spinner: UIActivityIndicatorView!
   
    private let identifier = "cell"
    private let nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
    
    private var human: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup () {
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
      
       
        
    }
  
    private func predictAge(for personAtIndex: Int) -> [Person] {
        AF.request("https://api.agify.io?name[]=\(UserData.names[personAtIndex])").responseDecodable(of: [Person].self) {
            response in
         
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.spinner.startAnimating()
            }
            

            guard let person = response.value else {return}
            print(response.value)
            self.human = person
        
        
        }
   return human
    }

}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserData.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonTableViewCell
        
      
        let person = predictAge(for: indexPath.row)
        
        guard !human.isEmpty else {return cell}
        spinner.stopAnimating()
        
        for field in person {
        cell.nameLabel.text = field.name
            cell.ageLabel.text = String(field.age)
        }
        
        return cell
    }
    
}
