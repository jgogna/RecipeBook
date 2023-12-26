//
//  RecipeHeaderView().swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 6/18/22.
//

import SwiftUI

struct RecipeHeaderView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var recipe: Recipes
    
    @State var textEditorHeight : CGFloat = 20
    
    @State var recipeName = ""
    @State var recipeDesc = ""
    @State var recipeYield = ""
    @State var recipePrepTime = ""
    @State var recipeCookTime = ""
    @State var recipeCookingMethod = ""
    @State var recipeCuisineType = ""

    var body: some View {
        VStack{
            TextField(recipeName, text: $recipeName).font(.headline)
            ZStack(alignment: .leading) {
                Text(recipeDesc)
//                    .font(.system(.body))
                    .foregroundColor(.clear)
                    .padding(14)
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewHeightKey.self,
                                    value: $0.frame(in: .local).size.height)
                                    })
                TextEditor(text: $recipeDesc)
//                    .font(.system(.body))
                    .frame(height: max(40,textEditorHeight))
//                    .cornerRadius(10.0)
//                    .shadow(radius: 1.0)
            }.onPreferenceChange(ViewHeightKey.self) { textEditorHeight = $0 }
            HStack{
                Text ("Prep Time: ")
                TextField(recipePrepTime, text: $recipePrepTime)
            }
            HStack{
                Text ("Cooking Time: ")
                TextField(recipeCookTime, text: $recipeCookTime)
            }
            HStack{
                Text ("Yield: ")
                TextField(recipeYield, text: $recipeYield)
            }
            HStack{
                Text ("Cooking Method: ")
                TextField(recipeCookingMethod, text: $recipeCookingMethod)
            }
            HStack{
                Text ("Cuisine Type: ")
                TextField(recipeCuisineType, text: $recipeCuisineType)
            }
            Spacer()
        }
        .padding()
        .font(.subheadline)
        .navigationTitle(recipeName)
        .onAppear(perform: getRecipeHeader)
        .onDisappear(perform: saveData)
    }
    
    func getRecipeHeader (){
        recipeName = recipe.name!
        recipeDesc = recipe.desc!
        recipeYield = recipe.yield!
        recipePrepTime = recipe.prep_time!
        recipeCookTime = recipe.cook_time!
        recipeCookingMethod = recipe.cooking_method!
        recipeCuisineType = recipe.cuisine_type!
    }
    func putRecipeHeader (){
        recipe.name = recipeName
        recipe.desc = recipeDesc
        recipe.yield = recipeYield
        recipe.prep_time = recipePrepTime
        recipe.cook_time = recipeCookTime
        recipe.cooking_method = recipeCookingMethod
        recipe.cuisine_type = recipeCuisineType
    }
    
    func saveData (){
        
        withAnimation {
            
            putRecipeHeader( )
            
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

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

struct RecipeHeaderView_Previews: PreviewProvider {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Recipes.name, ascending: true)],
        animation: .default)
    private static var recipes: FetchedResults<Recipes>
    
    static var previews: some View {
        //        let viewContext = PersistenceController.preview.container.viewContext
        //        let previewRecipe = Recipes(context: viewContext)
        //        previewRecipe.name = "Test Receipe"
        
        ForEach(recipes) { recipe in
            if recipe.name == "Recipe 1"{
                RecipeHeaderView(recipe: recipe).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
        }
    }
}
