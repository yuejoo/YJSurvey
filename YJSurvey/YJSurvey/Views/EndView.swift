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
    
    var body: some View {
        ZStack {
            Rectangle()
                .shadow(radius: 5)
                .frame(height: 60)
                .foregroundColor(Color.white)
            Button(action: self.onComplete) {
                Text("Complete")
            }
        }
    }
    
    func onComplete() {
        exit(0)
    }
}

#if DEBUG
struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
#endif
