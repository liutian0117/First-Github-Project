//
//  oneCell.swift
//  LoginView
//
//  Created by liutian on 2018/4/11.
//  Copyright © 2018年 liutian. All rights reserved.
//

import Foundation
enum Gender: Int{
    case male
    case female
    case unknow
    
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}


class Person:CustomStringConvertible {
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
    
    var firstName: String
    var lastName: String
    var age: Int
    var gender:Gender
    
    var fullName: String{
        get{
            return firstName + lastName
        }
    }
    init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, age: 0, gender: Gender.unknow)
    }
    
    required convenience init() {
        self.init(firstName: "")
}
}
