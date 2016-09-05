//
//  Meal.swift
//  AluraSwift1
//
//  Created by Edgar Junior on 8/28/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import Foundation
public class Meal : NSObject, NSCoding
{
    public var name:String;
    public var happiness: Int;
    public var Ingredientes = Array<Items>();
    
    public init(name:String, happiness:Int)
    {
        self.name = name;
        self.happiness = happiness;
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness = aDecoder.decodeIntegerForKey("happiness")
        self.Ingredientes = aDecoder.decodeObjectForKey("Ingredientes") as! Array<Items>
    }
    
    public func AllCalories()->Double
    {
        var total:Double = 0.0;
        for item in Ingredientes
        {
            total += item.calories;
        }
        return total;
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeInteger(happiness, forKey: "happiness")
        aCoder.encodeObject(Ingredientes, forKey: "Ingredientes")
    }
   

}