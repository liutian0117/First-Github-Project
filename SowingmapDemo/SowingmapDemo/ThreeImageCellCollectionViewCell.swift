//
//  ThreeImageCellCollectionViewCell.swift
//  SowingmapDemo
//
//  Created by liutian on 2018/4/26.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

class ThreeImageCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var IconImg: UIImageView!
    @IBOutlet weak var TitleLab: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func refreshUI(item: String) {
        IconImg.image = UIImage(named: item)
        TitleLab.text = item
    }
}
