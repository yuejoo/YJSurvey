//
//  ObservableArray.swift
//  YJSurvey
//
//  Created by zhaoye on 10/23/19.
//  Copyright © 2019 zhaoye. All rights reserved.
//

import Combine

class ObservableArray<T>: ObservableObject {
    @Published var array:[T] = []

    var cancellables = [AnyCancellable]()

    init(array: [T]) {
        self.array = array
    }

    func observeChildrenChanges<K>(_ type:K.Type) throws ->ObservableArray<T> where K : ObservableObject{
        let array2 = array as! [K]
        array2.forEach({
            let c = $0.objectWillChange.sink(receiveValue: { _ in self.objectWillChange.send() })
                // Important: You have to keep the returned value allocated,
                // otherwise the sink subscription gets cancelled
            self.cancellables.append(c)
        })
        return self
    }
}
