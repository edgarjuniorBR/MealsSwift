//
//  NewItemViewController.swift
//  MealsProject
//
//  Created by Edgar Junior on 9/2/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate
{
    func add(item:Items);
}
class NewItemViewController: UIViewController {

    @IBOutlet var name: UITextField?;
    @IBOutlet var calories: UITextField?;
    var delegate: AddAnItemDelegate?;

    init(delegate: AddAnItemDelegate)
    {
        self.delegate = delegate;
        super.init(nibName: "NewItemViewController", bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    @IBAction func addNewItem()
    {
        if name == nil || calories == nil
        {
            return;
        }
        
        let varname = name!.text!;
        let varcalories = NSString(string: calories!.text!).doubleValue;
        
        let item = Items(name: varname, calories: varcalories);
        
        
        if delegate == nil
        {
            return;
        }
        
        delegate!.add(item);
        
        if let navigation = navigationController
        {
            navigation.popViewControllerAnimated(true);
        }
    }
}
