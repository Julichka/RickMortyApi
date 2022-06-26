//
//  ViewController.swift
//  RickMortyApi
//
//  Created by Yuliia Khrupina on 6/26/22.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UITableViewController {

    let urlString = "https://rickandmortyapi.com/api/character"
    
    var results: Array<Character> = []
    
    let cellReuseIdentifier = "ListItem"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        requestData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ListItem else { return  UITableViewCell() }
            
            let data = self.results[indexPath.row]
            
        cell.name.text = data.name
             
            return cell
        }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func requestData() {
        AF.request(urlString, method: .get).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                guard let castingValue = value as? [String: Any] else { return }
                print(castingValue)
                guard let data = Mapper<ResponseData>().map(JSON: castingValue) else { return }
                self.results = data.results
                print(self.results.count)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

