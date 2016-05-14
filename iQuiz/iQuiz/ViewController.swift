//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

struct JSONlink {
    static var site = "http://tednewardsandbox.site44.com/questions.json"
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, UITextFieldDelegate {

    @IBOutlet var tableView: UITableView!
    
    var images = [UIImage(named: "science"), UIImage(named: "marvel"), UIImage(named: "math")]
    var topicname : [String] = []
    var Desc : [String] = []
    
    let info = Info()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.info.HTTPRequest {
            
            self.topicname = self.info.names
            self.Desc = self.info.descrs
            
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicname.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.photo.image = images[indexPath.row]
        cell.Title.text = topicname[indexPath.row]
        cell.Desc.text = Desc[indexPath.row]
        return cell;
    }
    
    @IBAction func settings(sender: AnyObject) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

