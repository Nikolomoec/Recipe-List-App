//
//  ContentView.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 24.10.2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes){ r in
                            
                            NavigationLink {
                                DetailView(recipe: r)
                            } label: {
                                HStack(spacing: 20){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    VStack(alignment: .leading) {
                                        Text(r.name)
                                            .bold()
                                        recipeHighlights(highlights: r.highlights)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
