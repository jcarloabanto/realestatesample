//
//  DetailViewController.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var propertyIdLabel: UILabel!
    
    var propertyViewModel: PropertyViewModel?
      
    override func viewDidLoad() {
        propertyIdLabel.text = propertyViewModel?.id
    }
}
