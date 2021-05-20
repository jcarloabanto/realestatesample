//
//  RealEstTableViewCell.swift
//  real estate
//
//  Created by jcarloabanto on 5/20/21.
//

import UIKit
import SDWebImage
class RealEstTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var agentName: UILabel!
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var bathCountLabel: UILabel!
    @IBOutlet weak var bedCountLabel: UILabel!
    @IBOutlet weak var carCountLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var propertyImageView: UIImageView!
    
    var propertyViewModel: PropertyViewModel! {
        didSet {
       
            self.addressLabel.text = propertyViewModel.address
            self.agentName.text = propertyViewModel.agentName
            
            self.bathCountLabel.text = propertyViewModel.bathCount
            self.bedCountLabel.text = propertyViewModel.bedCount
            self.carCountLabel.text = propertyViewModel.carCount
            
            self.companyLabel.text = propertyViewModel.companyName
            
            self.agentImageView.sd_setImage(with: propertyViewModel.agentImageUrl, placeholderImage: nil, options: [.progressiveLoad])
            self.agentImageView.clipsToBounds = true
            self.agentImageView.layer.cornerRadius = self.agentImageView.frame.size.width / 2
            
            self.propertyImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            self.propertyImageView.sd_setImage(with: propertyViewModel.properyImageUrl, placeholderImage: UIImage(systemName: "house"))
        }
    }
    
    func makeCircularImage(imageView: UIImageView) {
     
    }
    
}
