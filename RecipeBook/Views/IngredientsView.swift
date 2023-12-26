//
//  IngredientsView.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 6/28/22.
//

import SwiftUI

struct IngredientsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var recipe: Recipes
    var body: some View {
        VStack{
            Text("Ingredients:").font(.headline)
            HStack{
                Text ("o ")
                Text ("Chicken kljdfg lkjdfg lkjdfg lkdf gjkjdfg lkjdfg lkjdfg lkj")
                Spacer()
            }
            HStack{
                Text ("o ")
                Text ("Salt")
                Spacer()
            }
            HStack{
                Text ("o ")
                Text ("Onions")
                Spacer()
            }
        }.padding()
            .listStyle(.insetGrouped)
    }
}

struct IngredientsView_Previews: PreviewProvider {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.name, ascending: true)],
        animation: .default)
    private static var recipes: FetchedResults<Recipes>
    static var previews: some View {
        ForEach(recipes) { recipe in
            if recipe.name == "Recipe 1"{
                IngredientsView(recipe: recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
        }
    }
}
