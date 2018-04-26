//
//  ViewController.swift
//  SowingmapDemo
//
//  Created by liutian on 2018/4/25.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

@objc protocol OneImageSlideCellDelegate {
    func clickRow(sectin : Int, row :Int);
}


class ViewController: UIViewController{
    
    var items = ["mlxg.jpg","clearlove.jpg","condi.jpg"]
    
    @IBOutlet weak var oneSlideCV: UICollectionView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var oneSlidePC: UIPageControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.oneSlideCV.delegate = self
        self.oneSlideCV.dataSource = self
        oneSlideCV.isPagingEnabled = true
        oneSlideCV.decelerationRate = UIScrollViewDecelerationRateFast
        oneSlideCV.register(UINib(nibName: "OneLongImageCell", bundle: nil), forCellWithReuseIdentifier: "OneLongImageCell")
        oneSlidePC.setValue(#imageLiteral(resourceName: "img1.png"), forKey: "_pageImage")
        oneSlidePC.setValue(#imageLiteral(resourceName: "img2.png"), forKey: "_currentPageImage")
        oneSlidePC.isEnabled = false
        
        leftButton.isExclusiveTouch = true
        rightButton.isExclusiveTouch = true
    }
    weak var delegate : OneImageSlideCellDelegate?
    var section : Int = 0
    
    
    
    
    
    static func itemSize(width : CGFloat, isPCHidden : Bool) -> CGSize {
        if isPCHidden {
            return CGSize(width: width, height: (width * 9.0) / 16.0)
        }else {
            return CGSize(width: width, height: ((width * 9.0) / 16.0) + 40)
        }
    }
    
//    func refreshHomeUI(datas : Array<Any>, section : Int) {
//        self.section = section
//        oneSlidePC.numberOfPages = datas.count
//
//        if items.count < 2 {
//            leftButton.isHidden = true
//            rightButton.isHidden = true
//            oneSlidePC.isHidden = true
//            self.layoutIfNeeded()
//            bottomCVConstrains.constant = 0
//            oneSlideCV.layoutIfNeeded()
//            oneSlideCV.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        }else {
//            leftButton.isHidden = false
//            rightButton.isHidden = false
//            oneSlidePC.isHidden = false
//            self.layoutIfNeeded()
//            bottomCVConstrains.constant = 40
//            oneSlideCV.layoutIfNeeded()
//            oneSlideCV.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 40)
//        }
//        oneSlideCV.reloadData()
//        oneSlidePC.currentPage = 0
//    }
    
    @IBAction func leftBtnClick(_ sender: UIButton) {
        
        
        
        let eachWidth = oneSlideCV.bounds.width
        let currentOffset = oneSlideCV.contentOffset.x
        
        //*当前偏移量currentOffset除以cv宽度currentOffset 向下取整 -1 再与宽度相乘
        let forOffset = (roundf(Float(currentOffset/eachWidth)) - 1.0) * Float(eachWidth)
        if forOffset < 0 {
            return
        }
//        oneSlideCV.isUserInteractionEnabled = false
        oneSlideCV.setContentOffset(CGPoint(x: Double(forOffset),y: 0.0), animated: true)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self]  in
//            self?.oneSlideCV.isUserInteractionEnabled = true
//        }
    }
    
    //*round：如果参数是小数，则求本身的四舍五入。
    //*ceil：如果参数是小数，则求最小的整数但不小于本身.
    //*floor：如果参数是小数，则求最大的整数但不大于本身.
    
    @IBAction func rightBtnClick(_ sender: UIButton) {
        let eachWidth = oneSlideCV.bounds.width
        let currentOffset = oneSlideCV.contentOffset.x
        let forOffset = (roundf(Float(currentOffset/eachWidth)) + 1) * Float(eachWidth)
        //防止越界
        if forOffset > Float(oneSlideCV.contentSize.width - oneSlideCV.bounds.width){
            return
        }
//        oneSlideCV.isUserInteractionEnabled = false
        oneSlideCV.setContentOffset(CGPoint(x: Double(forOffset),y: 0.0), animated: true)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [weak self] in
//            self?.oneSlideCV.isUserInteractionEnabled = true
//        }
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OneLongImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneLongImageCell", for: indexPath) as! OneLongImageCell
        cell.refreshUI(item: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let sb = UIStoryboard(name: "ThreeImageSlideViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ThreeImageSlideViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
        delegate?.clickRow(sectin: self.section, row: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: oneSlideCV.bounds.size.width, height: oneSlideCV.bounds.size.height - 1)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var index =  Int(scrollView.contentOffset.x / scrollView.bounds.width)
        let dividX = CGFloat(index) * scrollView.bounds.width + scrollView.bounds.width * 0.5
        if scrollView.contentOffset.x > dividX{
            index += 1
        }
        oneSlidePC.currentPage = index
    }
    
}
   




