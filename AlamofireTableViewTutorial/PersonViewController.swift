//
//  ViewController.swift
//  AlamofireTableViewTutorial
//
//  Created by Ivan on 25.12.2021.
//

import UIKit
protocol PersonViewControllerDelegate: class {
    func personViewControllerDidShowVC(vc: PersonViewController)
}


class PersonViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    weak var delegate: PersonViewControllerDelegate?
     var userDefaults: UserData?
    
    private let identifier = "cell"
    private let nib = UINib(nibName: "PersonTableViewCell", bundle: nil)
   
private let model = AlamofireNetworking()
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup () {
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        guard let user = userDefaults else {return}
        names = user.getValue()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonTableViewCell
        
        let person = model.getAge(for: names)[indexPath.row]
        
        cell.nameLabel.text = person.name
        cell.ageLabel.text = String(person.age)
        
  
        return cell
    }
    
}
