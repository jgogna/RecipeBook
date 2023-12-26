//
//  CompleteRecipeView.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 6/18/22.
//

import SwiftUI

struct CompleteRecipeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var recipe: Recipes

    var body: some View {
        ScrollView{
        RecipeHeaderView (recipe: recipe)
        IngredientsView (recipe: recipe)
//        InstructionsViews (recipe: recipe)
//        Spacer()
        }
    }
}

struct CompleteRecipeView_Previews: PreviewProvider {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.name, ascending: true)],
        animation: .default)
    private static var recipes: FetchedResults<Recipes>
    static var previews: some View {
        ForEach(recipes) { recipe in
            if recipe.name == "Recipe 1"{
                CompleteRecipeView(recipe: recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
        }
    }
}
