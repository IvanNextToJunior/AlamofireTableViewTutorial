//
//  ViewController.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 25.12.2021.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    private let identifier = "cell"
    private let nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
    private let model = AlamofireNetworking()
   
    private var people: [Person] {
        model.predictAge(for: "Ivan")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup () {
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        
       
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonTableViewCell
    
        cell.nameLabel.text = people[indexPath.row].name
        cell.ageLabel.text = String(people[indexPath.row].age)
        return cell
    }
    
}
