//
//  ThirdCollectionView.swift
//  LoginView
//
//  Created by liutian on 2018/4/23.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

class ThirdCollectionView: UIViewController  {
    
    let courses = ["mlxg.jpg","clearlove.jpg","condi.jpg","sec.jpg"]
    @IBOutlet weak var ThirdCollectionView: UICollectionView!
    var pageView: UIPageControl!
    var timer: Timer?
    var currentIndexPath: IndexPath?
    var oldOffset: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupViews()
        
    }
    
    func setupViews() {

    
//            let flowLayout = UICollectionViewFlowLayout()
//            flowLayout.minimumLineSpacing = 0
//            flowLayout.minimumInteritemSpacing = 0
//            flowLayout.scrollDirection = .horizontal
//            flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            flowLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            ThirdCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: flowLayout)
            
            self.ThirdCollectionView.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: "ThirdCollectionViewCell")
            self.ThirdCollectionView.delegate = self
            self.ThirdCollectionView.dataSource = self
            view.addSubview(ThirdCollectionView)
            self.ThirdCollectionView.isPagingEnabled = true
            self.ThirdCollectionView.showsHorizontalScrollIndicator = false
            //从中间显示
            let indexPath = IndexPath(item: courses.count, section: 0)
            currentIndexPath = indexPath
//            ThirdCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
            pageView = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.height - 30, width: UIScreen.main.bounds.width, height: 30))
            view.addSubview(pageView)
            pageView.numberOfPages = courses.count
            pageView.currentPage = 0
            pageView.pageIndicatorTintColor = UIColor.white
            pageView.currentPageIndicatorTintColor = UIColor.lightGray

    }
    
    //添加定时器timer
    func addTimer() {
//        timer = Timer(timeInterval: 2, repeats: true, block: { [weak self] _ in
//            self?.nextImage()
//        })
//
//        guard let timer = timer else {
//            return
//        }
//        RunLoop.current.add(timer, forMode: .commonModes)
        //.defaultRunLoopMode 当我们执行其他滚动事件的时候 定时器会暂时不监听 当滚动事件结束之后 继续监听
        //.commonModes 持续监听滚动事件 即 无论我们怎么操作屏幕 轮播图都会定时循环滚动
    }
    
    func removeTimer() {
        //计时器销毁
        timer?.invalidate()
        timer = nil
    }
    
    func nextImage() {
        if pageView.currentPage == courses.count - 1 {
            pageView.currentPage = 0
        } else {
            pageView.currentPage += 1
        }
        guard let currentIndexPath = currentIndexPath else {
            return
        }
        let newIndexPath = IndexPath(item: currentIndexPath.item + 1, section: 0)
        self.currentIndexPath = newIndexPath
//        ThirdCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
//        let eachWidth = ThirdCollectionView.bounds.width
//        let currentOffset = ThirdCollectionView.contentOffset.x
//        let forOffset = (roundf(Float(currentOffset/eachWidth)) - 1.0) * Float(eachWidth)
//        ThirdCollectionView.isUserInteractionEnabled = false
//        ThirdCollectionView.setContentOffset(CGPoint(x: Double(forOffset),y: 0.0), animated: true)
        


    }
    
    
    func preImage() {
        if pageView.currentPage == 0 {
            pageView.currentPage = courses.count - 1
        } else {
            pageView.currentPage -= 1
        }
        
        guard let currentIndexPath = currentIndexPath else {
            return
        }
        let newIndexPath = IndexPath(item: currentIndexPath.item - 1, section: 0)
        self.currentIndexPath = newIndexPath
//        ThirdCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    func reloadImage() {
        guard let currentIndexPath = currentIndexPath else {
            return
        }
        if currentIndexPath.item == courses.count * 2 - 1 {  //如果是最后一个图片，回到第一部分的最后一张图片
            let newIndexPath = IndexPath(item: courses.count - 1, section: 0)
            self.currentIndexPath = newIndexPath
//            ThirdCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: false)
        } else if currentIndexPath.item == 0 {  //如果是第一个图片，就回到第二部分的第一张图片
            let newIndexPath = IndexPath(item: courses.count, section: 0)
            self.currentIndexPath = newIndexPath
//            ThirdCollectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: false)
        }
    }
    

}
extension ThirdCollectionView: UIScrollViewDelegate{
    
//    // 开始滑动的时候，停止timer，设置为niltimer才会销毁
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        removeTimer()
//
//
//    }
//
//    // 当停止滑动的时候reloadImage
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//
//        oldOffset = scrollView.contentOffset.x
//
//        reloadImage()
//
//    }
//
//    // 停止拖拽，开始timer, 并且判断是显示上一个图片还是下一个图片
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        addTimer()
//
//
//
//        if scrollView.contentOffset.x < oldOffset{
//            preImage()
//        }else{
//            nextImage()
//        }
//
//
//    }
    /// 开始滑动的时候，停止timer，设置为niltimer才会销毁
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        oldOffset = scrollView.contentOffset.x
        removeTimer()
        
        
    }
    
    /// 停止拖拽，开始timer, 并且判断是显示上一个图片还是下一个图片
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()

        if scrollView.contentOffset.x < oldOffset {
            print(oldOffset)
            print(scrollView.contentOffset.x)
            preImage()
        } else {
            print(oldOffset)
            print(scrollView.contentOffset.x)
            nextImage()
        }
    }
    
    
    /// 当停止滚动的时候重新reloadImage
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        reloadImage()
    }
    
    
    
    
}
extension ThirdCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //一个单元里放courses内数量为原来图片数量两倍的图片
        return courses.count * 2
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThirdCollectionViewCell", for: indexPath) as? ThirdCollectionViewCell
        
        if let cell = cell{
            cell.imageName = courses[indexPath.item % 4]
            return cell
        }
        return cell!
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ThirdCollectionView.bounds.size.width, height: ThirdCollectionView.bounds.size.height - 1)
    }
   
    
}

