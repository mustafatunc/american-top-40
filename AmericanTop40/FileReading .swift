//
//  File.swift
//  AmericanTop40
//
//  Created by Mustafa Tunc on 10/25/17.
//  Copyright © 2017 Mustafa Tunc. All rights reserved.
//

import Foundation

class FileReading{
    
    //private let directory:String
    
    public init(){
        
        
        /* Swift Version 4.0
         let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
         let directory = paths[0] as! String
         
         let path = directory.appending("/artists1971.plist")
         print (path)
         let s = NSArray(contentsOf: URL(string:directory)!)
         let myArray  = NSArray(contentsOfFile: path)!
         print(myArray)
         
         */
        
        /* Swift Version 3.1
         if let path = Bundle.main.path(forResource: "/files/artists1971", ofType: "plist") {
         print(path)
         //If your plist contain root as Array
         if let array = NSArray(contentsOfFile: path)  {
         print (array)
         }
         }
         */
        
    }
    
    
    public static func getList(_ fileName: String)->NSArray{
        
        var array = NSArray()
        if let path = Bundle.main.path(forResource: "/files/"+fileName, ofType: "plist") {
            array = NSArray(contentsOfFile: path)!
        }
        
        return array
    }
    
    
    
}
