//
//  File.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Foundation

public class Answer {
    var question: Question
    var selectedCandidates: [Candidate]
    var next: Answer?
    var prev: Answer?

    required init(question: Question, selectedCandidates: [Candidate]) {
        self.question = question
        self.selectedCandidates = selectedCandidates
    }
}
