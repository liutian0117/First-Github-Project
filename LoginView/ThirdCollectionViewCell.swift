//
//  ThirdCollectionViewCell.swift
//  LoginView
//
//  Created by liutian on 2018/4/23.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    
    
    var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var imageName: String? {
        didSet {
            guard let imageName = imageName else{
                return
            }
            let image = UIImage(named: imageName)
            imageView.image = image
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: self.bounds)
        
        //图片成比例居中显示
        imageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
