//
//  CandidatesView.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}

struct SelectedModifier: ViewModifier {
    var isSelected : Bool
    
    func body(content: Content) -> some View {
        if isSelected {
            return content.colorInvert()
                .eraseToAnyView()
        }

        return content.eraseToAnyView()
    }
}

struct CandidatesContextView : View {
    var candidate : Candidate
    var questionType : QuestionType
    var isSelected : Bool

    var body: some View {
        return VStack {
            ZStack(alignment: .leading) {
                Rectangle()
                    .shadow(radius: 2)
                    .frame(height: 60)
                    .foregroundColor(Color.white)
                Text(candidate.context).padding()
                    .foregroundColor(.black)
            }.modifier(SelectedModifier(isSelected: isSelected))
        }
    }
}

#if DEBUG
struct CandidatesContextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CandidatesContextView(
                candidate: Candidate(context: "A", id: 1),
                questionType: QuestionType.SingleSelection,
                isSelected: false
            )
            CandidatesContextView(
                candidate: Candidate(context: "B", id: 1),
                questionType: QuestionType.SingleSelection,
                isSelected: true
            )
            CandidatesContextView(
                candidate: Candidate(context: "C", id: 1),
                questionType: QuestionType.SingleSelection,
                isSelected: false
            )
        }
    }
}
#endif
