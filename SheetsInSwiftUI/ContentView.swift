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

enum SheetConfig: Int, Identifiable {
    case sheet1
    case sheet2
    case sheet3
    
    var id: Int { return self.rawValue }
}

struct ContentView: View {
    @State private var showSheet = false
    @State private var showSheet2 = false
    @State private var selectedContact: Contacts?
    @State private var sheetConfig: SheetConfig?
    
    let contacts: [Contacts] = [
        .init(name: "Tom"),
        .init(name: "John"),
        .init(name: "Mark")
    ]
    
    var body: some View {
        VStack {
            Button {
                sheetConfig = .sheet1
            } label: {
                Text("Click Me 1")
            }
            Button {
                sheetConfig = .sheet2
            } label: {
                Text("Click Me 2")
            }
            Button {
                sheetConfig = .sheet3
            } label: {
                Text("Click Me 3")
            }
            
//            List {
//                ForEach(contacts) { contact in
//                    Text(contact.name)
//                        .onTapGesture {
////                            showSheet.toggle()
//                            selectedContact = contact
//                        }
//                }
//            }
        }
//        .sheet(item: $selectedContact, content: { contact in
//            Text("Selected contact is \(contact.name)")
//        })
//        .fullScreenCover(isPresented: $showSheet, content: {
//            Button(action: {
//                showSheet.toggle()
//            }, label: {
//                Text("Dismiss")
//            })
//        })
        .sheet(item: $sheetConfig, content: { config in
            switch config {
            case .sheet1:
                Text("Sheet 1")
                    .presentationDetents([.height(200)])
            case .sheet2:
                Text("Sheet 2")
                    .presentationDetents([.medium,])
            case .sheet3:
                Text("Sheet 3")
                    .presentationDetents([.large])
            }
            
//            Text("Showed 1!")
//                .presentationDetents([.height(200), .medium, .large])
//                .interactiveDismissDisabled()
//                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                
        })
//        .sheet(isPresented: $showSheet2, content: {
//            Text("Showed 2!")
//                .presentationDetents([.large])
//        })
    }
}

#Preview {
    ContentView()
}
