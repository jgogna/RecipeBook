//
//  ContentView.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 5/10/22.
//

import SwiftUI
import CoreData

struct TempView: View {
    //    @Environment(\.managedObjectContext) private var viewContext
    //
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    
    @State private var test  : String = "1111"
    @State private var test1 : String = "2222"
    @State private var test2 : String = "3333"
    @State var text = "\u{2022} "

    var body: some View {
//        NavigationView{
            VStack{
                ZStack{
                    Text (test)
                    TextEditor (text: $test)
                }
                .font(.body)
//                .navigationTitle("Test")
                .shadow(radius: 1)
                TextEditor (text: $test1)
                    .shadow(radius: 1)
                TextEditor (text: $test2)
                    .shadow(radius: 1)
                TextEditor(text: $text)
                    .frame(height: 400)
                    .border(Color.black)
                    .onChange(of: text) { [text] newText in
                        if newText.suffix(1) == "\n" && newText > text {
                            self.text.append("\u{2022} ")
                        }
                    }

                Spacer()
            }.frame(width: .infinity)
//        }
    }
    
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
        //        TempView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
