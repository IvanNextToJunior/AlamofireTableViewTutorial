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
    
    private let identifier = "cell"
    private let nib = UINib(nibName: "MusicTableViewCell", bundle: nil)
    

    private var array: [String] = []
    
    
    func predictAge(for name: String) {
        AF.request("https://api.agify.io?name=\(name)").responseDecodable(completionHandler: <#T##(DataResponse<Decodable, AFError>) -> Void#>)
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
    }
    
}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonTableViewCell
        
        return cell
    }
    
}
