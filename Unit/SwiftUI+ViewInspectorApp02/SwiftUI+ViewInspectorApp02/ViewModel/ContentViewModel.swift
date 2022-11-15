//
//  ContentViewModel.swift
//  SwiftUI+ViewInspectorApp02
//
//  Created by 濵田　悠樹 on 2022/11/15.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var count: Int
    
    init(count: Int) {
        self.count = count
    }
    
    func increment() {
        self.count += 1
    }
}
