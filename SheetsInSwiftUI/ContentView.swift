//
//  ContentView.swift
//  SheetsInSwiftUI
//
//  Created by admin on 1/6/24.
//

import SwiftUI

struct Contacts: Identifiable {
    var id = NSUUID().uuidString
    let name: String
}

struct ContentView: View {
    @State private var showSheet = false
    @State private var selectedContact: Contacts?
    
    let contacts: [Contacts] = [
        .init(name: "Tom"),
        .init(name: "John"),
        .init(name: "Mark")
    ]
    
    var body: some View {
        VStack {
            Button {
                showSheet.toggle()
            } label: {
                Text("Click Me")
            }
            
            List {
                ForEach(contacts) { contact in
                    Text(contact.name)
                        .onTapGesture {
//                            showSheet.toggle()
                            selectedContact = contact
                        }
                }
            }
        }
        .sheet(item: $selectedContact, content: { contact in
            Text("Selected contact is \(contact.name)")
        })
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
