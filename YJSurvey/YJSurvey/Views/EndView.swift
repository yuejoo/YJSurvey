//
//  CompletionView.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import SwiftUI


struct EndView : View {
    @Environment(\.presentationMode)
    var presentation
    var answer : Answer?
    @State var modalDisplayed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .shadow(radius: 5)
                .frame(height: 60)
                .foregroundColor(Color.white)
            Button(action: self.onComplete) {
                Text("Results")
            }.sheet(isPresented: $modalDisplayed) {
                DetailView(
                    onDismiss: {
                        self.modalDisplayed = false
                    },
                    answers: self.extractAnswers(answer: self.answer)
                )
            }
        }
    }
    
    func extractAnswers(answer: Answer?) -> [Answer] {
        var output : [Answer] = []
        
        var head : Answer? = answer
        while head?.prev != nil {
            head = head!.prev
        }
        
        while head?.next != nil {
            output.append(head!)
            head = head!.next
        }
        
        return output
    }
    
    // Might be able to add any possible post-process as you want
    func onComplete() {
        self.modalDisplayed = true
    }
}

struct DetailView: View {
    var onDismiss: () -> ()
    var answers: [Answer]
    
    var body: some View {
        VStack {
            List {
                ForEach(self.answers, id:\.self) { answer in
                    VStack(alignment: .leading) {
                        Text("Q: \(answer.question.context)")
                        ForEach(answer.selectedCandidates, id:\.self) { candidate in
                            Text(candidate.context)
                        }
                    }
                }
            }
            
            Button(action: { self.onDismiss() }) {
                Text("Return")
            }
        }
    }
}

#if DEBUG
struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
#endif
