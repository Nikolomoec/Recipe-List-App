//
//  DetailView.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 25.10.2022.
//

import SwiftUI

struct DetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                //MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                //MARK: Ingridients
                VStack(alignment: .leading){
                    Text("Ingridients")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    ForEach (recipe.ingredients, id: \.self){ ingredient in
                        Text("- " + ingredient)
                            .padding(0.5)
                    }
                }
                .padding(.leading, 10)
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    ForEach (0..<recipe.directions.count, id: \.self){ index in
                        
                        Text(String(index + 1) + " Step: " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        DetailView(recipe: model.recipes[0])
    }
}
