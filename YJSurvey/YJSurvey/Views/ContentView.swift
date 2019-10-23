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
        title: "Profile",
        details: "Test",
        questions: questionList,
        candidates: candidateList,
        questionHead: questionList[0]
    )
    
    var body: some View {
        VStack {
            QuestionSheetView(
                questionSheetManager: QuestionSheetManager(
                    questionContext: QuestionContext(context: questionList[0].context
                    ),
                    candidates: ObservableArray<Candidate>(
                        array: questionList[0].candidates
                    ),
                    questionType: questionList[0].type,
                    selectedCandidates: ObservableArray<Candidate>(
                        array: []
                    )
                ),
                headQuestion: questionList[0]
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
