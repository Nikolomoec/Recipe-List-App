//
//  DetailView.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 25.10.2022.
//

import SwiftUI

struct DetailView: View {
    
    var recipe:Recipe
    @State private var selectedIndex = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                //MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                Text(recipe.name)
                    .font(.largeTitle)
                    .padding(.top, 20)
                    .padding(.leading)
                    .fontWeight(.bold)
                //MARK: Serving Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    
                    Picker("", selection: $selectedIndex) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                //MARK: Ingridients
                VStack(alignment: .leading) {
                    Text("Ingridients")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    ForEach (recipe.ingredients) { ingredient in
                        Text("- " + RecipeModel.getPortion(ingridients: ingredient, recipeServings: recipe.servings, targetServings: selectedIndex) + " " + ingredient.name.lowercased())
                            .padding(0.5)
                    }
                }
                .padding(.leading, 10)
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    ForEach (0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index + 1) + " Step: " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        DetailView(recipe: model.recipes[0])
    }
}
