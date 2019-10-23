//
//  QuestionContextView.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import SwiftUI

struct QuestionContextView : View {
    var questionContext: QuestionContext
    
    var body: some View {
        ZStack {
            Rectangle()
                .shadow(radius: 5)
                .frame(height: 60)
                .foregroundColor(Color.white)
            Text(questionContext.context)
        }
    }
}

#if DEBUG
struct QuestionContextView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionContextView(
            questionContext: QuestionContext(context: "Who are you?"
        ))
    }
}
#endif
