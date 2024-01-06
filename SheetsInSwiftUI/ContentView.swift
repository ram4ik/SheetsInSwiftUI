//
//  ContentView.swift
//  SheetsInSwiftUI
//
//  Created by admin on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            Button {
                showSheet.toggle()
            } label: {
                Text("Click Me")
            }
        }
//        .fullScreenCover(isPresented: $showSheet, content: {
//            Button(action: {
//                showSheet.toggle()
//            }, label: {
//                Text("Dismiss")
//            })
//        })
        .sheet(isPresented: $showSheet, content: {
            Text("Showed!")
                .presentationDetents([.height(200), .medium, .large])
//                .interactiveDismissDisabled()
//                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                
        })
    }
}

#Preview {
    ContentView()
}
