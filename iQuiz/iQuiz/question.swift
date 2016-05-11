//
//  question.swift
//  iQuiz
//
//  Created by iGuest on 5/10/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import Foundation

public class question{

    public var question : String
    public var answernum : Int
    public var answers : [String]
    
    init (question:String, answernum:Int, answers:[String]){
        self.question = question
        self.answernum = answernum
        self.answers = answers
    }
}