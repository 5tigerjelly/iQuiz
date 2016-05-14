//
//  QuizModel.swift
//  iQuiz
//
//  Created by iGuest on 5/11/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation



class Info {
    
    var targetURL = "http://tednewardsandbox.site44.com/questions.json"
    
    var names : [String] = []
    var descrs : [String] = []
    var questionarray : [[question]] = []
    

    
    var topics : [topic] = []
    
    
    
    func checkLocalStorage() {
        //Check if json exists
        
        //        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let tempDirURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(NSProcessInfo.processInfo().globallyUniqueString, isDirectory: true)
        let filePath = tempDirURL.URLByAppendingPathComponent("quiz.json").absoluteString
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(filePath) {
            print("FILE AVAILABLE")
        } else {
            print("FILE NOT AVAILABLE")
        }
        
    }
    
    
    func HTTPRequest(completionHandler: () -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: targetURL)!) { (data, response, error) -> Void in
            //          print(self.targetURL)

                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
                    
                    // print(json)
                    
                    guard let subject = json as? [[String : AnyObject]] else {return}
                    
                    for s in subject {
                        let name = s["title"] as? String
                            self.names.append(name!)
                        
                        let desc = s["desc"] as? String
                            self.descrs.append(desc!)
                        
                        var genquestion : [question] = []
                        let questions = s["questions"]
                        for quest in questions as! NSArray {
                            let text = quest["text"] as! String
                            let answerIntAsString = quest["answer"] as! String
                            let choices = quest["answers"] as! [String]
                            let correctAnswer = choices[(Int(answerIntAsString)! - 1)]
                            
                            let aQuestion = question(question: text, answernum: correctAnswer, answers: choices)
                            genquestion.append(aQuestion)
                        }
                        self.questionarray.append(genquestion)
                        self.topics.append(topic(title: name!, desc: desc!, questions: genquestion))

                    }
                    
                    completionHandler()
                    
                } catch {
                    print("Error Response! \n\(error)")
                }
        }
        task.resume()
    }
//    func HTTPRequest(completionHandler: () -> Void) {
//        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: targetURL)!) { (data, response, error) -> Void in
//            //          print(self.targetURL)
//            let HTTPResponse = response as! NSHTTPURLResponse
//            let statusCode = HTTPResponse.statusCode
//            
//            if (statusCode == 200) {
//                do {
//                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: [])
//                    
//                    // print(json)
//                    
//                    guard let subject = json as? [[String : AnyObject]] else {return}
//                    
//                    for s in subject {
//                        let name = s["title"] as? String
//                        self.names.append(String(name))
//                        let desc = s["desc"] as? String
//                        self.descrs.append(String(desc))
//                        let questions = s["questions"] as! NSArray
//                        
//                        var questionObjs = [question]()
//                        for q in questions {
//                            let qtext = q["text"] as? String
//                            let qanswer = q["answer"] as? String
//                            let number = Int(qanswer!)
//                            let qanswers = q["answers"] as! NSArray
//                            var answerstringarray = [String]()
//                            for individual in qanswers {
//                                answerstringarray.append(String(individual))
//                            }
//                            let inputquestion : question = question(question: String(qtext), answernum: String(qanswers[number!]), answers: answerstringarray)
//                            questionObjs.append(inputquestion)
//                        }
//                        let inputtopic: topic = topic(title: String(name), desc: String(desc), questions: questionObjs)
//                        self.topics.append(inputtopic)
//                    }
//                    
//                    completionHandler()
//                    
//                } catch {
//                    print("Error Response! \n\(error)")
//                }
//            }
//        }
//        task.resume()
//    }
}