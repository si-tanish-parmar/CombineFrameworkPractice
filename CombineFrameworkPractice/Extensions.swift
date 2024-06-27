//
//  Extensions.swift
//  CombineFrameworkPractice
//
//  Created by Tanish Parmar on 27/06/24.
//

import Foundation
import Combine

extension Published.Publisher {
    var didSet: AnyPublisher<Value, Never> {
        // Any better ideas on how to get the didSet semantics?
        // This works, but I'm not sure if it's ideal.
        self.receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}


