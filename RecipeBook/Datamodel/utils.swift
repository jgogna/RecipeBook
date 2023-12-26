//
//  utils.swift
//  RecipeBook
//
//  Created by Jatinder Gogna on 6/18/22.
//

import Foundation

func initNewRecipe (recipe: Recipes, name: String){
    
    recipe.name = name
    recipe.desc = "Desc"
    recipe.cook_time = ""
    recipe.prep_time = ""
    recipe.yield = ""
    recipe.cooking_method = ""
    recipe.cuisine_type = ""
    recipe.created_on = Date()
    recipe.modified_on = Date()
}
