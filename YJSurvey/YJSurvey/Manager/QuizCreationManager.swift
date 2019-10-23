//
//  QuizCreationManager.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Foundation

let questionList = [
    Question(context: "Who are you?", id: 0, type: QuestionType.SingleSelection),
    Question(context: "Who am I?", id: 1, type: QuestionType.SingleSelection),
    Question(context: "What are you going to do?", id: 2, type: QuestionType.SingleSelection),
    Question(context: "What should be the best practice?", id: 3, type: QuestionType.SingleSelection)
]

let candidateList = [
    // Question 0
    // 4 Answers
    Candidate(context: "A. David", id: 1)
        .registerOnQuestion(on: questionList[0])
        .registerNextQuestion(nextQuestion: questionList[1]),
    Candidate(context: "B. James", id: 2)
        .registerOnQuestion(on: questionList[0])
        .registerNextQuestion(nextQuestion: questionList[1]),
    Candidate(context: "C. Green", id: 3)
        .registerOnQuestion(on: questionList[0])
        .registerNextQuestion(nextQuestion: questionList[1]),
    Candidate(context: "D. 走走", id: 4)
        .registerOnQuestion(on: questionList[0])
        .registerNextQuestion(nextQuestion: questionList[2]),
    
    // Question 1
    // 1 Answer
    Candidate(context: "走走", id: 5)
        .registerOnQuestion(on: questionList[1])
        .registerNextQuestion(nextQuestion: questionList[2]),
    
    // Question 2
    // 1 Answer
    Candidate(context: "A. Play Java", id: 6)
        .registerOnQuestion(on: questionList[2])
        .registerNextQuestion(nextQuestion: questionList[3]),
    Candidate(context: "B. Play Swift", id: 7)
        .registerOnQuestion(on: questionList[2])
        .registerNextQuestion(nextQuestion: questionList[3]),
    
    
    // Question 3
    // 1 Answer
    Candidate(context: "A. Test oriented", id: 8)
        .registerOnQuestion(on: questionList[3]),
    Candidate(context: "B. Everything interface", id: 9)
        .registerOnQuestion(on: questionList[3])
]
