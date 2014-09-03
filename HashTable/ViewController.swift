//
//  ViewController.swift
//  HashTable
//
//  Created by Dan Hoang on 9/2/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var hashTable = HashTable(size: 300)
        var redBox = UIView()
        hashTable.setObject(redBox, key: "Brad")
        var VC = UIViewController()
        hashTable.setObject(VC, key: "Leo")
        hashTable.setObject(VC, key: "oeL")
        hashTable.setObject(VC, key: "Dan")
        
        println(hashTable.hashArray.count)
        println(hashTable.size)
        for eachBucket in hashTable.hashArray {
            if eachBucket.key != nil {
                println(eachBucket.key)
                if let nextBucket = eachBucket.next {
                    println(nextBucket.key)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

