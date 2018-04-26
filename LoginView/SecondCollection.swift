//
//  SecondCollection.swift
//  LoginView
//
//  Created by liutian on 2018/4/19.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

class SecondCollection: UIViewController{
    
    var timer:Timer!
    @IBOutlet weak var secondCollection: UICollectionView!
  
    let courses = [
        ["name":"Mlxg","pic":"mlxg.jpg"],
        ["name":"Clearlove","pic":"clearlove.jpg"],
        ["name":"Condi","pic":"condi.jpg"],
        ["name":"Iboy","pic":"iboy.jpg"],
        ["name":"Jackeylove","pic":"jackeylove.jpg"],
        ["name":"Uzi","pic":"uzi.jpg"],
        ["name":"Rookie","pic":"rookie.jpg"],
        ["name":"Xiye","pic":"xiye.jpg"],
        ["name":"Xiaohu ","pic":"xiaohu.jpg"]
    ]

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        

        //注册CollectionViewCell:
        self.secondCollection!.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        secondCollection.backgroundColor = UIColor.black
        self.view.addSubview(secondCollection)
        self.secondCollection.delegate = self
        self.secondCollection.dataSource = self
        // Do any additional setup after loading the view.
        
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.secondCollection.deselectItem(at: indexPath, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
extension SecondCollection:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let item = courses[indexPath.row]
        
        cell.CollectionImage.image = UIImage(named:item["pic"] ?? "")
        cell.CollectionLabel.text = item["name"]
        //cell内图片自适应大小
        cell.CollectionImage.frame = cell.bounds
        //cell内图片保持比例
        cell.CollectionImage.contentMode = .scaleAspectFit
        cell.CollectionLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        cell.CollectionLabel.textColor = UIColor.white
        cell.CollectionLabel.frame(forAlignmentRect: CGRect(x:0, y:0, width:cell.bounds.size.width, height:20))
        return cell
    }
}

