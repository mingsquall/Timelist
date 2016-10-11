//
//  ViewController.swift
//  timeList
//
//  Created by Patientman on 16/10/11.
//  Copyright © 2016年 mingSquall. All rights reserved.
//

import UIKit

class TimelistViewController: UITableViewController {

    var items: [TimelistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [TimelistItem]()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimelistItem", forIndexPath: indexPath)
        let item = items[indexPath.row]
        configureTextForCell(cell, withTimelistItem: item)
        
        return cell
    }
    
    func configureTextForCell(cell: UITableViewCell, withTimelistItem item:TimelistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    @IBAction func addItem() {
        //新添加那一行其实就是item的总数
        let newRowIndex = items.count
        let item = TimelistItem()
        
        let now = NSDate()
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy/MM/dd HH:mm:ss"

        item.text = "Time is \(dformatter.stringFromDate(now))"
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        
        
        
    }

}

