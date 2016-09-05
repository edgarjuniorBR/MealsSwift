//
//  Items.swift
//  AluraSwift1
//
//  Created by Edgar Junior on 8/28/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import Foundation

public class Items : NSObject, NSCoding
{
    public var name:String;
    public var calories:Double;
    
    public init(name:String, calories:Double)
    {
        self.name = name;
        self.calories = calories;
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.calories = aDecoder.decodeDoubleForKey("calories")
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeDouble(calories, forKey: "calories")
    }
}
public func ==(first: Items, second: Items) -> Bool
{
    return first.name == second.name && first.calories == second.calories;
}