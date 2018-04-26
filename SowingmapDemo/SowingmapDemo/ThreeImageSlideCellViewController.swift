//
//  ThreeImageSlideCellViewController.swift
//  SowingmapDemo
//
//  Created by liutian on 2018/4/26.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

@objc protocol ThreeImageSlideCellDelegate {
    func clickThreeImageSlideCell(sectin : Int, row :Int);
}


class ThreeImageSlideCellViewController: UIViewController {

    @IBOutlet weak var tisCV: UICollectionView!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    var items = ["mlxg.jpg","clearlove.jpg","condi.jpg","mlxg.jpg","clearlove.jpg","condi.jpg","mlxg.jpg","clearlove.jpg","condi.jpg"]
    var offer: CGFloat = 0.0
    var section : Int = 0
    weak var delegate : ThreeImageSlideCellDelegate?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tisCV.register(UINib(nibName: "ThreeImageCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThreeImageCellCollectionViewCell")
        tisCV.decelerationRate = UIScrollViewDecelerationRateFast
        tisCV.delegate = self
        tisCV.dataSource = self
        leftBtn.isExclusiveTouch = true
        rightBtn.isExclusiveTouch = true
    }

    @IBAction func leftSlideBtnClick(_ sender: Any) {
        let eachWidth = (tisCV.bounds.width/3.0)
        let currentOffset = tisCV.contentOffset.x
        let forOffset = (roundf(Float(currentOffset/eachWidth)) - 1.0) * Float(eachWidth)
        if forOffset < 0 {
            return
        }
        tisCV.isUserInteractionEnabled = false
        tisCV.setContentOffset(CGPoint(x: Double(forOffset),y: 0.0), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.tisCV.isUserInteractionEnabled = true
        }
    }
    
    
    @IBAction func rightSlideBtnClick(_ sender: Any) {
        let eachWidth = (tisCV.bounds.width/3.0)
        let currentOffset = tisCV.contentOffset.x
        let forOffset = (roundf(Float(currentOffset/eachWidth)) + 1.0) * Float(eachWidth)
        if forOffset > Float(tisCV.contentSize.width - tisCV.bounds.width) {
            return
        }
        tisCV.isUserInteractionEnabled = false
        tisCV.setContentOffset(CGPoint(x: Double(forOffset),y: 0.0), animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.tisCV.isUserInteractionEnabled = true
        }
    }
    
    func refreshUI(datas : UIImage, section: Int){
        tisCV.setContentOffset(CGPoint.zero, animated: false)
        self.section = section
        tisCV.reloadData()
    }
}
extension ThreeImageSlideCellViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ThreeImageCellCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThreeImageCellCollectionViewCell", for: indexPath) as! ThreeImageCellCollectionViewCell
        cell.refreshUI(item: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickThreeImageSlideCell(sectin: self.section, row: indexPath.row)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let labelHeight: CGFloat = 32.0
        return CGSize(width: (tisCV.frame.width)/3, height: (tisCV.frame.width)/3 + labelHeight + 2)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        let pageWidth = (tisCV.frame.width)/3
        let index = roundf(Float(x/pageWidth))
        targetContentOffset.pointee.x = pageWidth * CGFloat(index)
    }
}
