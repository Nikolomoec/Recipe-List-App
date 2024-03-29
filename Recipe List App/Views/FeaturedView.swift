//
//  FeaturedView.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 06.11.2022.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            
            Text("Featured Recipe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 40)
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    
                    ForEach(0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            
                            Button {
                                self.isDetailViewShowing = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                DetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Preparation Time")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("HighLights")
                    .font(.headline)
                recipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                
            }
            .padding([.leading, .bottom])
        }
        .onAppear {
            getFeaturedIndex()
        }
    }
    func getFeaturedIndex() {
        
        let index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}
struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView().environmentObject(RecipeModel())
    }
}
