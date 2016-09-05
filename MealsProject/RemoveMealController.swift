//
//  RemoveMealController.swift
//  MealsProject
//
//  Created by Edgar Junior on 9/3/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import Foundation
import UIKit

public class RemoveMealController
{
    let _controller:UIViewController
    init(controller: UIViewController)
    {
        self._controller = controller;
    }
    public func Show(meal:Meal, handler: (UIAlertAction!)-> Void) -> Void
    {
        var message = "Happiness: \(meal.happiness)"
        for item in meal.Ingredientes {
            message += "\n * \(item.name) - \(item.calories)"
        }
        
        let details = UIAlertController(title: meal.name, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let remove = UIAlertAction(title: "Remove", style: .Destructive, handler: handler)
        details.addAction(remove)
        let cancel = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        details.addAction(cancel)
        _controller.presentViewController(details, animated: true, completion: nil)
    }
}