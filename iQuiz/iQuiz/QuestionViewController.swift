//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var questionarray : topic!
    var counting : Int = 0
    
    var questiontitle = ""
    
    @IBOutlet weak var questi: UILabel!
    
    @IBOutlet weak var qa1: UIButton!
    @IBOutlet weak var qa2: UIButton!
    @IBOutlet weak var qa3: UIButton!
    @IBOutlet weak var qa4: UIButton!
    @IBOutlet weak var submiting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questi.text = questionarray.questions[counting].question
        qa1.setTitle(questionarray.questions[counting].answers[0], forState: UIControlState.Normal)
        qa2.setTitle(questionarray.questions[counting].answers[1], forState: UIControlState.Normal)
        qa3.setTitle(questionarray.questions[counting].answers[2], forState: UIControlState.Normal)
        qa4.setTitle(questionarray.questions[counting].answers[3], forState: UIControlState.Normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func press1(sender: AnyObject) {
    }
    
    @IBAction func press2(sender: AnyObject) {
    }
    
    @IBAction func press3(sender: AnyObject) {
    }
    
    @IBAction func press4(sender: AnyObject) {
    }
    
    @IBAction func clickSubmit(sender: AnyObject) {
        let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("Answerpage") as! AnswerViewController
        //qVC.questionarray = topics[indexPath.row]
        self.presentViewController(qVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
