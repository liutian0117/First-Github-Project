//
//  ViewController.swift
//  LoginView
//
//  Created by liutian on 2018/4/10.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var userTest: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var passwordTest: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet var loginview: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        userTest.placeholder = "手机号或邮箱"
        userTest.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        passwordTest.placeholder = "请输入登录密码"
        passwordTest.isSecureTextEntry = true
        passwordTest.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        userTest.delegate = self
        passwordTest.delegate = self
        button.layer.cornerRadius = 10
    
        
    }
    
    @IBAction func loginButtonClick(_ sender: Any) {
        let tableViewID =   UIStoryboard(name: "tableViewController", bundle: nil)
        let tableViewvc = tableViewID.instantiateViewController(withIdentifier: "tableViewController")
        //self.navigationController?.present(tableViewvc, animated: true, completion: nil)
        self.navigationController?.pushViewController(tableViewvc, animated: true)
    }
    // Do any additional setup after loading the view, typically from a nib.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        guard let text = userTest.text else{
            return true
        }
        guard let text2 = passwordTest.text else{
            return true
        }
        let textLength = ((text.lengthOfBytes(using: String.Encoding.utf8)) - (range.length) + string.lengthOfBytes(using: String.Encoding.utf8))
        let passwordLength = ((text2.lengthOfBytes(using: String.Encoding.utf8)) - (range.length) + string.lengthOfBytes(using: String.Encoding.utf8))
        if textLength <= 10 && textLength >= 6{
            if passwordLength <= 10 && passwordLength >= 6
            {
                button.isEnabled = true
                self.button.alpha = 1
                button.backgroundColor = UIColor.orange
            }else{
                button.isEnabled = false
                self.button.alpha = 0.4
                button.backgroundColor = UIColor.gray
            }
            
        }else {
            button.isEnabled = false
            self.button.alpha = 0.4
            button.backgroundColor = UIColor.gray
        }
        return true
        
    }
    
    
    
}

