//
//  Question.swift
//  YJSurvey
//
//  Created by zhaoye on 10/21/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Foundation
import SwiftUI

class Question {
    public let context: String
    public let id: Int
    public var candidates: [Candidate]
    public var type: QuestionType
    
    init(context: String, id: Int, candidates: [Candidate] = [], type: QuestionType) {
        self.context = context
        self.id = id
        self.candidates = candidates
        self.type = type
    }
}
