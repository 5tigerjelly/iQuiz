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
    var useranswer = 4
    var totalcorrect = 0
    
    
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
        useranswer = 0
    }
    
    @IBAction func press2(sender: AnyObject) {
        useranswer = 1
    }
    
    @IBAction func press3(sender: AnyObject) {
        useranswer = 2
    }
    
    @IBAction func press4(sender: AnyObject) {
        useranswer = 3
    }
    
    @IBAction func clickSubmit(sender: AnyObject) {
        var feedback = "You are WRONG"
        if useranswer != 4 {
            if questionarray!.questions[counting].answernum == useranswer {
                totalcorrect += 1
                feedback = "You are CORRECT"
            }
            let changeviewcontrol = self.storyboard?.instantiateViewControllerWithIdentifier("Answerpage") as! AnswerViewController
            changeviewcontrol.counting = self.counting
            changeviewcontrol.questionarray = self.questionarray
            changeviewcontrol.totalcorrect = self.totalcorrect
            changeviewcontrol.resulttext = feedback
            self.presentViewController(changeviewcontrol, animated: true, completion: nil)
        }
        
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
