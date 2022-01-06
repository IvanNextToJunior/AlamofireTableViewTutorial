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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup () {
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        
        
    }

}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserData.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonTableViewCell
        
        let person = model.predictAge(for: indexPath.row)
//        for field in person{
//        cell.nameLabel.text = field.name
//            cell.ageLabel.text = String(field.age!)
//        }
        
        return cell
    }
    
}
