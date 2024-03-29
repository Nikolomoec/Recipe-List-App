//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 04.11.2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            
            FeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName:"list.bullet")
                        Text("List")
                    }
                }
            
            
        }.environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
