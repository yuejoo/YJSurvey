//
//  ContentView.swift
//  YJSurvey
//
//  Created by zhaoye on 10/21/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var quiz = Quiz(
        title: "How well do you know twice?",
        details: "DEMO",
        questions: questionList,
        candidates: candidateList,
        questionHead: questionList[0]
    )
    
    var body: some View {
        VStack {
            QuestionSheetView(
                questionSheetManager: QuestionSheetManager(
                    questionContext: QuestionContext(context: self.quiz.questionHead.context),
                    candidates: ObservableArray<Candidate>(
                        array: self.quiz.questionHead.candidates
                    ),
                    questionType: self.quiz.questionHead.type,
                    selectedCandidates: ObservableArray<Candidate>(array: [])
                ),
                headQuestion: self.quiz.questionHead
            )
        }
    }
}

/**
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
