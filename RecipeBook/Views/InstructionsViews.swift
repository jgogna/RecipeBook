//
//  InstructionsViews.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 6/28/22.
//

import SwiftUI

struct InstructionsViews: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var recipe: Recipes
    var body: some View {
        VStack{
            HStack{
                Text("Instructions:").font(.headline)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}

struct InstructionsViews_Previews: PreviewProvider {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.name, ascending: true)],
        animation: .default)
    private static var recipes: FetchedResults<Recipes>
    static var previews: some View {
        ForEach(recipes) { recipe in
            if recipe.name == "Recipe 1"{
                InstructionsViews(recipe: recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
        }
    }
}
