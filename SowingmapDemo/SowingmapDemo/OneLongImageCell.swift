//
//  OneLongImageCell.swift
//  Maitama
//
//  Created by fenrir-32 on 2017/9/14.
//  Copyright © 2017年 Dalian Fenrir. All rights reserved.
//

import Foundation
import Kingfisher
import Gloss
class OneLongImageCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImg: UIImageView!
    private var imgUrl: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func itemSize(width: CGFloat) -> CGSize {
        return CGSize(width: width, height: (width * 9.0) / 16.0)
    }
    
    func refreshUI(item: String) {
        bannerImg.image = UIImage(named: item)
    }
   
    
    
}

