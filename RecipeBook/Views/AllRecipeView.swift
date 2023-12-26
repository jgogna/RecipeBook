//
//  AllRecipeView.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 6/18/22.
//

import SwiftUI

struct AllRecipeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.name, ascending: true)],
        animation: .default)
    private var recipes: FetchedResults<Recipes>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
//                        Text("Receipt name = \(recipe.created_on!)")
                        CompleteRecipeView (recipe: recipe)
                    } label: {
                        Text(recipe.name!)
                    }
                }
                .onDelete(perform: deleteRecipe)
            }.navigationTitle("Recipes")
                .listStyle(.grouped)
                .navigationBarTitleDisplayMode(.inline)
                .navigationViewStyle(.stack)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addRecipe) {
                            Label("Add Recipe", systemImage: "plus")
                        }
                    }
                }
            Text("Select a Recipe")
        }.navigationViewStyle(.stack)
    }
    
    func addRecipe (){
        
        withAnimation {
            let newRecipe = Recipes(context: viewContext)
            
            initNewRecipe(recipe: newRecipe, name: "New Receipe")
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        
    }
        private func deleteRecipe(offsets: IndexSet) {
            withAnimation {
                offsets.map { recipes[$0] }.forEach(viewContext.delete)
    
                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
}


struct AllRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipeView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
