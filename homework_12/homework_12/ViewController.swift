//
//  ViewController.swift
//  homework_12
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 2016110457. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Phone: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let re = SQLiteDB.shared.open(dbPath: "", copyFile: true)
        print("result:\(re)")
        
        // Do any additional setup after loading the view, typically from a nib.
        let result = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("result:\(result)")
        
    }
    
    
    @IBAction func add(_ sender: Any) {
        let result = db.execute(sql: "insert into person(name,phone) values('\(Name.text!)','\(Phone.text!)')")
        print("result:\(result)")
    }
    @IBAction func update(_ sender: Any) {
        let result = db.execute(sql: "update person set phone ='\(Phone.text!)' where name = '\(Name.text!)'")
        print("result:\(result)")
    }
    @IBAction func del(_ sender: Any) {
        let result = db.execute(sql: "delete from person where name = '\(Name.text!)'")
        print("result:\(result)")
    }
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(Name.text!)'")
        if let person = persons.first {
            Phone.text = person["phone"] as? String
        }
    }
}

