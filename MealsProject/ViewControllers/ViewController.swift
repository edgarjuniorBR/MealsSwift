//
//  ViewController.swift
//  MealsProject
//
//  Created by Edgar Junior on 8/30/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import UIKit
protocol AddMealDelegate {
    func Add(meal:Meal);
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate
{

    @IBOutlet var nameField:UITextField?;
    @IBOutlet var happinessField:UITextField?;
    @IBOutlet var tableView:UITableView?;
    var button = UIButton(type: UIButtonType.System)
    
    var delegate:AddMealDelegate?;
    
    var items = Array<Items>()
    
    var selected = Array<Items>();
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row;
        let item = items[row];
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil);
        cell.textLabel?.text = item.name;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath)
        {
            let item = items[indexPath.row];
            if(cell.accessoryType == UITableViewCellAccessoryType.None)
            {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
                selected.append(item);
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryType.None;
                if let position = selected.indexOf(item)
                {
                    selected.removeAtIndex(position);
                }
                else
                {
                    Alert(controller: self).Show()
                }
            }
        }
        else
        {
            Alert(controller: self).Show()
        }

        
    }
    
    @IBAction func Add()
    {
        if let meal = getMealFromForm()
        {
            AddMeal(meal);
            BackToTableView();
        }
        else
        {
            Alert(controller: self).Show()
        }
    }
    
    func getMealFromForm() -> Meal?
    {
        if(nameField == nil || happinessField == nil)
        {
            return nil;
        }
        
        let name = nameField!.text;
        let happiness = Int(happinessField!.text!);
        
        if(happiness == nil)
        {
            return nil;
        }
        
        let meal = Meal(name: name!, happiness: happiness!)
        meal.Ingredientes = selected;
        
        return meal;
    }
    
    private func AddMeal(meal:Meal)
    {
        if(delegate == nil)
        {
            return;
        }
        delegate!.Add(meal);
    }
    
    private func BackToTableView()
    {
        if let navigation = self.navigationController
        {
            navigation.popViewControllerAnimated(true);
        }
        else
        {
            Alert(controller: self).Show()
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ShowNewItem));
        navigationItem.rightBarButtonItem = newItemButton;
        items = Dao().loadItems()
    }
    
    func ShowNewItem()
    {
        let newItem = NewItemViewController(delegate: self);
        if let navigation = navigationController
        {
            navigation.pushViewController(newItem, animated: true);
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func add(item: Items)
    {
        items.append(item)
        Dao().saveItems(items)
        if let table = tableView
        {
            table.reloadData();
        }
        else
        {
            Alert(controller: self).Show("Unexpected Error, but the item was added")
        }
        
    }
}

