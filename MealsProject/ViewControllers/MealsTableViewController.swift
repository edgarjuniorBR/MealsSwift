//
//  MealsTableViewController.swift
//  MealsProject
//
//  Created by Edgar Junior on 8/30/16.
//  Copyright © 2016 Edgar Junior. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate
{
    var meals = Array<Meal>()
   
    func Add(meal:Meal)
    {
        meals.append(meal);
        Dao().saveMeals(meals);
        self.tableView.reloadData();
    }
    
    override func viewDidLoad() {
        meals = Dao().loadMeals();
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "AddMeal")
        {
            let view = segue.destinationViewController as! ViewController;
            view.delegate = self;
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let row = indexPath.row;
        let meal = meals[row];
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil);
        
        cell.textLabel?.text = meal.name;
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails(_:)));
        cell.addGestureRecognizer(longPress);
        
        return cell;
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer)
    {
        if recognizer.state == UIGestureRecognizerState.Began
        {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell);
            if indexPath == nil
            {
                return
            }
            let row = indexPath!.row;
            let meal = meals[row];

            RemoveMealController(controller: self).Show(meal, handler: {
                action in
                self.meals.removeAtIndex(row)
                self.tableView.reloadData()
            })
            
            
        }
    }
}
