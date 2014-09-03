//
//  HashBucket.swift
//  HashTable
//
//  Created by Dan Hoang on 9/2/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation

class HashBucket {
    
    //so bucket will have a pointer to next bucket:
    var next : HashBucket?
    var value : AnyObject?
    //what key was used here:
    var key : String?
    //keep track of its hash index.
    var index : Int!
    
    init() {
        
    }
}