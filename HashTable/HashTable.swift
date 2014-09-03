//
//  HashTable.swift
//  HashTable
//
//  Created by Dan Hoang on 9/2/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation

class HashTable {
    
    //Keep track of how big our hash table is gonna be
    var size : Int
    var hashArray = [HashBucket]()
    
    //for the removeObjectForKey function, keep count:
    var count = 0
    
    init(size : Int) {
        self.size = size
        //we’ll take the size, create a bucket, and add it to our array
        
        for i in 0..<size {
            var bucket = HashBucket()
            self.hashArray.append(bucket)
        }
    }
    
    func hash(key : String) -> Int{
        var total = 0
        //we need the length of our string.
        for character in key.unicodeScalars {
            //We need our ascii value:
            var asc = Int(character.value)
            //takes each character's ascii, adds the values up.
            total += asc
            //so if two words have same characters, collision happens.
        }
        //mod total by entire table's size.
        return total % self.size
    }
    
    func setObject(objectToStore : AnyObject, key : String) {
        var bucket = HashBucket()
        //recall that bucket has: next,value,key.
        var index = self.hash(key)
        //now, configure our bucket (activate its properties):
        bucket.value = objectToStore
        bucket.key = key
        bucket.index = index
        //in a dictionary, if we set object to a
        //key, then we override it if one's already there.
        self.removeObjectForKey(key)
        //is this pushing over the previous object?
        bucket.next = self.hashArray[index]
        self.hashArray[index] = bucket //as the top of the linkedlist
        //so that means we re-hash the objects.
        
        self.count++
        
        if (Double(self.count) / Double(self.size)  >= 0.70) {
            println("Double-up: \(self.count) / \(self.size))")
            //this means time to double-up.
            self.doubleSizeUp()
        }
        else {
            println()
        }
    }
    
    func doubleSizeUp() {
        println()
        for i in size..<(size * 2) {
            var bucket = HashBucket()
            self.hashArray.append(bucket)
        }
        self.size *= 2
    }
    
    //function to delete an item.
    func removeObjectForKey(key : String) {
        //grab our index:
        var index = self.hash(key)
        //but this could be a linked list. (i.e. 10 buckets for each list)
        var previousBucket : HashBucket?
        //will return us either an empty bucket, or a bucket with a //value
        var bucket : HashBucket? = self.hashArray[index]
        
        //will stop once no bucket. won't run if there was none initially.
        while bucket != nil {
            if bucket!.key == key {
                //found it. func will return at end of if.
                if previousBucket == nil {
                    //making sure we dont lose the linked list
                    var nextBucket = bucket?.next
                    self.hashArray[index] ?? bucket?.next!
                    //ensure the list is maintained:
                    //we want to override it, remove it.
                }
                else {
                    previousBucket!.next = bucket?.next
                }
                //keep track of count as self property.
                self.count--
                return
            }
            previousBucket = bucket
            //check if there is a next bucket:
            if let nextBucket = bucket?.next {
                bucket = nextBucket
            }
            else {
                //once bucket.next becomes nil, then it exits out, because bucket != nil:
                bucket = nil
            }
        }
    }
    
    //last thing we need is how to look up an object for a key:
    func objectForKey(key : String) -> AnyObject? {
        //given a key, we need to return an object if it exists.
        //first, get the index:
        var index = self.hash(key)
        //grab bucket from that index:
        var bucket : HashBucket!
        bucket = self.hashArray[index]
        while bucket != nil {
            if bucket.key == key {
                //we found our object for the key they were searching for
                return bucket.value
            } else {
                //we are going down the chain:
                bucket = bucket.next!
            }
        }
        //because by now, we didn’t find a bucket with the right key:
        return nil
    }
    
    
    
    
}