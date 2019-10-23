//
//  QuestionSheetManager.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Combine

class QuestionSheetManager : ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    init(
        questionContext: QuestionContext,
        candidates: ObservableArray<Candidate>,
        questionType: QuestionType,
        selectedCandidates: ObservableArray<Candidate>
    ){
        self.questionContext = questionContext
        self.candidates = candidates
        self.questionType = questionType
        self.selectedCandidates = selectedCandidates
    }
    
    var questionContext : QuestionContext {
        didSet {
            objectWillChange.send()
        }
    }
    
    var questionType : QuestionType {
        didSet {
            objectWillChange.send()
        }
    }
    
    var candidates : ObservableArray<Candidate> {
        didSet {
            objectWillChange.send()
        }
    }
    
    var selectedCandidates : ObservableArray<Candidate> {
        didSet {
            objectWillChange.send()
        }
    }
    
    var answer : Answer? {
        didSet {
            objectWillChange.send()
        }
    }
}
