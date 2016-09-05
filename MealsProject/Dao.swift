//
//  Dao.swift
//  MealsProject
//
//  Created by Edgar Junior on 9/3/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import Foundation
public class Dao
{
    private let _mealsArquive: String
    private let _itemsArquive: String
    
    public init()
    {
        let userDirs = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let dir = userDirs[0] as String
        _mealsArquive = "\(dir)/eggplant-brownie-meals"
        _itemsArquive = "\(dir)/eggplant-brownie-items"
    }
    
    public func saveMeals(meals:Array<Meal>) -> Void
    {
        NSKeyedArchiver.archiveRootObject(meals, toFile: _mealsArquive)
    }
    
    public func loadMeals() -> Array<Meal>
    {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(_mealsArquive)
        {
            return loaded as! Array<Meal>
        }
        return Array<Meal>()
    }
    public func saveItems(meals:Array<Items>) -> Void
    {
        NSKeyedArchiver.archiveRootObject(meals, toFile: _itemsArquive)
    }
    
    public func loadItems() -> Array<Items>
    {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(_itemsArquive)
        {
            return loaded as! Array<Items>
        }
        return Array<Items>()
    }
}