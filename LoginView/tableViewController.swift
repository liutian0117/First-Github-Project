//
//  tableViewController.swift
//  LoginView
//
//  Created by liutian on 2018/4/11.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit



class tableViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
   
    
    
    var tableData = [["title":"火车🚄","content":"林\n则\n徐","image":"img1.png"],
                     ["title":"巴士🚌","content":"吟诗一首","image":"img2.png"],
                     ["title":"飞机✈️","content":"力微任重久神疲，\n再竭衰庸定不支。\n苟利国家生死以，\n岂因祸福避趋之？\n谪居正是君恩厚，\n养拙刚于戍卒宜。\n戏与山妻谈故事，\n试吟断送老头皮。","image":"img3.png"]]
        
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        //创建一个复用的单元格
        
        //注册xib
        self.tableView!.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        //设置estimatedRowHeight属性默认值
        // self.tableView.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        //  self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //表格在编辑状态下允许多选
        //        tableView.allowsSelectionDuringEditing = true
        //获取所有选中的行
        //tableView.indexPathsForSelectedRows
        self.view.addSubview(self.tableView!)
    }
    
    //编辑模式按钮改变
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
        if self.isEditing{
            self.editButtonItem.title = "完成"
            
        }else{
            self.editButtonItem.title = "编辑"
        }
    }
    //返回编辑样式
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ImageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
        let item = tableData[indexPath.row]
       cell.normalLabel.text = item["title"]
        cell.contentLabel.text = item["content"]
       cell.normalIamge.image =
            UIImage(named:item["image"]!)
        
//      1  cell.refleshUI(image: UIImage(named:item["image"] ?? "" )!, titleLabel: item["title"] ?? "", contentLabel: item["content"] ?? "")

        

        return cell
    }
    
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 100
//        }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //移动 cell 时触发
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let content = self.tableData[sourceIndexPath.row]
        self.tableData.remove(at: sourceIndexPath.row)
        self.tableData.insert(content, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle(rawValue: UITableViewCellEditingStyle.insert.rawValue | UITableViewCellEditingStyle.delete.rawValue)!
    }
    
    //排序方法代理
    //- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    //}
    
    //点击 cell 时触发
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let ctID = UIStoryboard(name: "ThirdCollectionView", bundle: nil)
        let ctvc = ctID.instantiateViewController(withIdentifier: "ThirdCollectionView") as! ThirdCollectionView
//        let item = tableData[indexPath.row]
//        detailvc.jj = UIImage(named: item ["image"] ?? "" )
        
        
        
      self.navigationController?.pushViewController(ctvc, animated: true)
//        self.present(ctvc, animated: true, completion: nil)
        //self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
   
    
    
    
    
    
    
    
    
    //    //右滑按钮title
    //    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    //        return "删除"
    //    }
    //    //执行删除操作
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == UITableViewCellEditingStyle.delete
    //        {
    //            self.tableData.remove(at: indexPath.row)
    //            self.tableView!.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    //        }
    //    }
    
    
    //设置 cell 是否允许移动
    
    
}






