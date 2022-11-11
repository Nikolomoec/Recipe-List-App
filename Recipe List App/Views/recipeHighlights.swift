//
//  recipeHighlights.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 10.11.2022.
//

import SwiftUI

struct recipeHighlights: View {
    
    var allHighLights = ""
    
    init(highlights:[String]) {
        
        for index in 0..<highlights.count {
            
            
            if index == highlights.count - 1 {
                allHighLights += highlights[index]
            }
            else {
                allHighLights += highlights[index] + ", "
            }
        }
        
    }
    var body: some View {
        Text(allHighLights)
    }
}

struct recipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        recipeHighlights(highlights: ["test", "test2"])
    }
}
