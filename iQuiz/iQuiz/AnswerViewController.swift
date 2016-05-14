//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var Ansertextbox: UILabel!
    var counting = 0
    var topics : [topic] = []
    var questionarray : topic!
    var totalcorrect = 0
    var totalquestion = 0
    var resulttext = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Ansertextbox.text = "\(questionarray.questions[counting].question) \n \(questionarray.questions[counting].answers[questionarray!.questions[counting].answernum]) \n \(resulttext)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answernext(sender: AnyObject) {
        if counting + 1 == questionarray.questions.count{
            let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("resultpage") as! ResultsViewController
            qVC.totalcorrect = self.totalcorrect
            counting += 1
            qVC.counting = self.counting
            self.presentViewController(qVC, animated: true, completion: nil)
        }else{
            let qVC2 = self.storyboard?.instantiateViewControllerWithIdentifier("Questionstory") as! QuestionViewController
            counting += 1
            qVC2.counting = self.counting
            qVC2.totalcorrect = self.totalcorrect
            qVC2.questionarray = self.questionarray
            self.presentViewController(qVC2, animated: true, completion: nil)
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
