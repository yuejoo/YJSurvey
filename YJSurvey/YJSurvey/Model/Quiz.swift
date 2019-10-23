//
//  Quiz.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Foundation

class Quiz {
    public var title: String
    public var details: String
    public var questions: [Question]
    public var candidates: [Candidate]
    public var questionHead: Question
    
    required init(
        title: String,
        details: String,
        questions: [Question],
        candidates: [Candidate],
        questionHead: Question
    ){
        self.title = title
        self.details = details
        self.questions = questions
        self.candidates = candidates
        self.questionHead = questionHead
    }
}
