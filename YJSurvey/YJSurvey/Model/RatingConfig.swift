//
//  RatingConfig.swift
//  YJSurvey
//
//  Created by zhaoye on 10/24/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import SwiftUI

class RatingConfig : ObservableObject {
    public let minRating : CGFloat
    public let maxRating : CGFloat
    public let step : CGFloat
    @Published public var rating : CGFloat
    
    required init(defaultRating: CGFloat, minRating: CGFloat, maxRating: CGFloat, step: CGFloat){
        self.rating = defaultRating
        self.minRating = minRating
        self.maxRating = maxRating
        self.step = step
    }
}
