//
//  SecondTableCell.swift
//  LoginView
//
//  Created by liutian on 2018/4/20.
//  Copyright © 2018年 liutian. All rights reserved.
//

import UIKit

typealias textBlock = (String, Int) -> ()

class SecondTableCell: UITableViewCell, UITextFieldDelegate{
    
    
    @IBOutlet weak var SecondTableLabel: UILabel!
    @IBOutlet weak var SecondTableTextField: UITextField!
    var block: textBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.SecondTableTextField.delegate = self
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        block?(textField.text ?? "", self.SecondTableTextField.tag)
        
        return true
        }
    
    
    
    
    }




