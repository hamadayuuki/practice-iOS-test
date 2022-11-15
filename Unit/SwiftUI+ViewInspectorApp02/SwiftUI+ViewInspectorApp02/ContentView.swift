//
//  ContentView.swift
//  SwiftUI+ViewInspectorApp02
//
//  Created by 濵田　悠樹 on 2022/11/15.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("Hellow World!")
                .padding()
            Text("\(count)")
                .padding()
            Button( action: {
                self.count += 1
            }) {
                Text("CountAddButton")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
