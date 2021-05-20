//
//  RealEstTableViewController.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import UIKit
import SDWebImage

class RealEstTableViewController: UITableViewController {
    
    var apiService = APIService()
    var propertyArray = [PropertyViewModel]()
    var selectedPropertyViewModel: PropertyViewModel?
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setUp()
    }
    
    func setUp() {
        tableView.tableFooterView = UIView()
        
        self.apiService.delegate = self
        self.apiService.getPropertyData()
        self.tableView.reloadData()
    }

}

extension RealEstTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let vc = segue.destination as! DetailViewController
            vc.propertyViewModel = selectedPropertyViewModel!
        }
    }
}

extension RealEstTableViewController: GetPostDelegate {
    func didGetPost(_ apiService: APIService, propertyViewModel: [PropertyViewModel]) {
        self.propertyArray = propertyViewModel
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


// MARK: - Table view data source and delegate

extension RealEstTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RealEstTableViewCell
        cell.propertyViewModel = propertyArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPropertyViewModel = propertyArray[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320.0
    }
    
}
