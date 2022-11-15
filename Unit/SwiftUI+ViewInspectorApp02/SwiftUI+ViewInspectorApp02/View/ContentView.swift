//
//  ContentView.swift
//  SwiftUI+ViewInspectorApp02
//
//  Created by 濵田　悠樹 on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text("Hellow World!")
                .padding()
            Text("\(self.viewModel.count)")
                .padding()
            Button( action: {
                viewModel.increment()
            }) {
                Text("CountAddButton")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(count: 0))
    }
}
