//
//  QuizCreationManager.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Foundation

let questionList = [
    Question(context: "In which date did TWICE debut?", id: 0, type: QuestionType.DatePicker),
    Question(context: "Who is the Leader of TWICE?", id: 1, type: QuestionType.SingleSelection),
    Question(context: "How many memebers are there in TWICE?", id: 2, type: QuestionType.RatingScale),
    Question(context: "Which member are not Korean? (Multiple Choices)", id: 3, type: QuestionType.MultipleSelection),
    Question(context: "Complete", id: 4, type: QuestionType.End)
]

let candidateList = [
    // Question 0
    // 1 Answer ()
    Candidate(context: "Empty Date", id: 1)
        .registerOnQuestion(on: questionList[0])
        .registerNextQuestion(nextQuestion: questionList[1]),
    
    // Question 1
    // 4 Answers
    Candidate(context: "Nayeon", id: 1)
        .registerOnQuestion(on: questionList[1])
        .registerNextQuestion(nextQuestion: questionList[2]),
    Candidate(context: "Jeongyeon", id: 2)
        .registerOnQuestion(on: questionList[1])
        .registerNextQuestion(nextQuestion: questionList[2]),
    Candidate(context: "Jihyo", id: 3)
        .registerOnQuestion(on: questionList[1])
        .registerNextQuestion(nextQuestion: questionList[2]),
    Candidate(context: "Dahyun", id: 4)
        .registerOnQuestion(on: questionList[1])
        .registerNextQuestion(nextQuestion: questionList[2]),
    Candidate(context: "Chaeyoung", id: 5)
        .registerOnQuestion(on: questionList[1])
        .registerNextQuestion(nextQuestion: questionList[2]),
    
    // Question 2
    // 1 Answer
    Candidate(context: "Rating", id: 1, ratingConfig: RatingConfig(defaultRating: 1, minRating: 1, maxRating: 11, step: 1))
        .registerOnQuestion(on: questionList[2])
        .registerNextQuestion(nextQuestion: questionList[3]),
    
    // Question 3
    // 4 Answers
    Candidate(context: "Momo", id: 1)
        .registerOnQuestion(on: questionList[3])
        .registerNextQuestion(nextQuestion: questionList[4]),
    Candidate(context: "Dahyun", id: 2)
        .registerOnQuestion(on: questionList[3])
        .registerNextQuestion(nextQuestion: questionList[4]),
    Candidate(context: "Mina", id: 3)
        .registerOnQuestion(on: questionList[3])
        .registerNextQuestion(nextQuestion: questionList[4]),
    Candidate(context: "Sana", id: 4)
        .registerOnQuestion(on: questionList[3])
        .registerNextQuestion(nextQuestion: questionList[4]),
    
    
    // Question 4
    // 2 Answers
    Candidate(context: "Results", id: 8)
        .registerOnQuestion(on: questionList[4])
]
