//
//  ImageCell.swift
//  LoginView
//
//  Created by liutian on 2018/4/12.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
   
    @IBOutlet weak var normalCell: UIView!
    @IBOutlet weak var normalLabel: UILabel!
    @IBOutlet weak var normalIamge: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    		
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        normalCell.layer.cornerRadius = 8

    }
    
//    func refleshUI(image: UIImage, titleLabel: String, contentLabel: String) {
//        normalIamge.image = image
//        normalLabel.text = titleLabel
//        self.contentLabel.text = contentLabel
//        
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
