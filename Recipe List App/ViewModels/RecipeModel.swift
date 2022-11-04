//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 24.10.2022.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
    
        self.recipes = DataService.getLocalData()
        
    }
}
