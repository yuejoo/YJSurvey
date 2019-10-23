//
//  Candidate.swift
//  YJSurvey
//
//  Created by zhaoye on 10/21/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Foundation
import Combine

class Candidate : ObservableObject {
    @Published public var context: String
    @Published public var date: Date = Date()
    public let id: Int
    public var nextQuestion: Question?
  
    public func registerOnQuestion(on: Question) -> Candidate {
        on.candidates.append(self)
        return self
    }
    
    public func registerNextQuestion(nextQuestion: Question) -> Candidate {
        self.nextQuestion = nextQuestion
        return self
    }
    
    init(context: String, id: Int) {
        self.context = context
        self.id = id
    }
}

extension Candidate: Hashable {
    public func hash(into hasher: inout Hasher) {
         hasher.combine(ObjectIdentifier(self).hashValue)
    }
}

extension Candidate: Equatable {
    public static func ==(lhs: Candidate, rhs: Candidate) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
