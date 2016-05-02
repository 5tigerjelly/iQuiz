//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
//    @IBAction func alertBox(sender: AnyObject) {
//        let alertController: UIAlertController = UIAlertController(title: "Settings go here")
//    }
    
    var Titles = ["Mathematics", "Marvel Super Heroes", "Science"]
    var Descs = ["Test your knowledge on Mathematics", "Test your knowledge on Marvel Super Heroes", "Test your knowledge on Science"]
    var images = [UIImage(named: "math"), UIImage(named: "marvel"), UIImage(named: "science")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.photo.image = images[indexPath.row]
        cell.Title.text = Titles[indexPath.row]
        cell.Desc.text = Descs[indexPath.row]
        
        return cell;
    }
}

