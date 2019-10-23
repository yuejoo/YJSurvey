//
//  QuestionSheetView.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import SwiftUI


struct BottomBarView: View {
    @ObservedObject var questionSheetManager: QuestionSheetManager
    
    var body: some View {
        HStack {
            if self.hasPrevious(){
                Button(action: {
                    self.previousQuestion()
                }) {
                    Image(systemName: "arrow.left")
                }.padding()
            }
            Spacer()
            if self.hasNext() {
                Button(action: {
                    self.nextQuestion()
                }) {
                    Image(systemName: "arrow.right")
                }.padding()
            }
        }
    }
    
    func previousQuestion() {
        if let previousAnswer = self.questionSheetManager.answer?.prev {
            let previousQuestion = previousAnswer.question
            self.questionSheetManager.questionContext = QuestionContext(context: previousQuestion.context)
            self.questionSheetManager.questionType = previousQuestion.type
            self.questionSheetManager.candidates = ObservableArray<Candidate>(array: previousQuestion.candidates)
            self.questionSheetManager.selectedCandidates = ObservableArray<Candidate>(array: previousAnswer.selectedCandidates)
            
            //Moving to the previous question
            self.questionSheetManager.answer = previousAnswer
        }
    }
    
    func nextQuestion() {
        if let nextQuestion = self.questionSheetManager.answer?.selectedCandidates[0].nextQuestion {
            self.questionSheetManager.questionContext = QuestionContext(context: nextQuestion.context)
            self.questionSheetManager.questionType = nextQuestion.type
            self.questionSheetManager.candidates = ObservableArray<Candidate>(array: nextQuestion.candidates)
            self.questionSheetManager.selectedCandidates = ObservableArray<Candidate>(array: self.questionSheetManager.answer!.selectedCandidates)

            // Create Answer for the next question
            if self.questionSheetManager.answer?.next != nil {
                self.questionSheetManager.answer = self.questionSheetManager.answer!.next
            }
            else {
                self.questionSheetManager.selectedCandidates = ObservableArray<Candidate>(array: [])
                let emptyAnswer = Answer(question: nextQuestion, selectedCandidates: [])
                self.questionSheetManager.answer!.next = emptyAnswer
                emptyAnswer.prev = self.questionSheetManager.answer!
                self.questionSheetManager.answer = emptyAnswer
            }
        }
    }
    
    func hasPrevious() -> Bool {
        return self.questionSheetManager.answer != nil
            &&
            self.questionSheetManager.answer?.prev != nil
    }
    
    func hasNext() -> Bool {
        return
            self.questionSheetManager.answer != nil
            &&
            (self.questionSheetManager.answer?.next != nil
            ||
            self.questionSheetManager.answer!.selectedCandidates.count > 0)
    }
}

struct QuestionSheetView: View {
    @ObservedObject var questionSheetManager: QuestionSheetManager
    var headQuestion : Question

    var body: some View {
        VStack {
            Spacer()
            QuestionContextView(
                questionContext: self.questionSheetManager.questionContext
            )
            ForEach(self.questionSheetManager.candidates.array, id:\.self){
                candidate in CandidatesContextView(
                    candidate: candidate,
                    questionType: self.questionSheetManager.questionType,
                    isSelected: self.isSelected(candidate)
                ).padding(.leading).padding(.trailing)
                .onTapGesture {
                    self.selectionTapped(candidate)
                }
            }
            Spacer()
            BottomBarView(questionSheetManager: self.questionSheetManager)
        }
    }
    
    func isSelected(_ candidate: Candidate) -> Bool {
        for slectedCandidate in self.questionSheetManager.selectedCandidates.array {
            if slectedCandidate.id == candidate.id {
                return true
            }
        }
        return false
    }
    
    func selectionTapped(_ candidate: Candidate) {
        if !isSelected(candidate) {
            if self.questionSheetManager.questionType == QuestionType.SingleSelection {
                
                self.questionSheetManager.selectedCandidates = ObservableArray<Candidate>(
                    array: [candidate]
                )
                
                updateAnswer()
            }
        }
    }
    
    func updateAnswer() {
        if self.questionSheetManager.answer == nil {
            self.questionSheetManager.answer = Answer(
                question: self.headQuestion,
                selectedCandidates: self.questionSheetManager.selectedCandidates.array
            )
        }
        else {
            self.questionSheetManager.answer!.selectedCandidates =
                self.questionSheetManager.selectedCandidates.array
        }
    }
}

#if DEBUG
struct QuestionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSheetView(
            questionSheetManager: QuestionSheetManager(
                questionContext: QuestionContext(context: "Who are you?"
                ),
                candidates: ObservableArray<Candidate>(
                    array: [
                        Candidate(context: "A", id: 1),
                        Candidate(context: "B", id: 2),
                        Candidate(context: "C", id: 3),
                        Candidate(context: "C", id: 4),
                        Candidate(context: "C", id: 5),
                        Candidate(context: "C", id: 6),
                        Candidate(context: "C", id: 7)
                    ]
                ),
                questionType: QuestionType.SingleSelection,
                selectedCandidates: ObservableArray<Candidate>(
                    array: [
                        Candidate(context: "A", id: 1)
                    ]
                )
            ),
            headQuestion: Question(
                context: "Who are you?",
                id: 1,
                candidates: [
                    Candidate(context: "A", id: 1),
                    Candidate(context: "B", id: 2),
                    Candidate(context: "C", id: 3),
                    Candidate(context: "C", id: 4),
                    Candidate(context: "C", id: 5),
                    Candidate(context: "C", id: 6),
                    Candidate(context: "C", id: 7)
                ],
                type: QuestionType.SingleSelection
            )
        )
    }
}
#endif
