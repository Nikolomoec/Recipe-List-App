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
    
    static func getPortion(ingridients:Ingridients, recipeServings: Int, targetServings:Int) -> String {
        
        var portion = ""
        
        var numerator = ingridients.num ?? 1
        var denominator = ingridients.denom ?? 1
        var wholePortions = 0
        
        if ingridients.num != nil {
            
            denominator *= recipeServings
            
            numerator *= targetServings
            
            func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
                    
                    // GCD(0, b) = b
                    if a == 0 { return b }
                    
                    // GCD(a, 0) = a
                    if b == 0 { return a }
                    
                    // Otherwise, GCD(a, b) = GCD(b, remainder)
                    return greatestCommonDivisor(b, a % b)
                }
            let devisor = greatestCommonDivisor(numerator, denominator)
            
            numerator /= devisor
            denominator /= devisor
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingridients.unit {
            
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    
                    unit += "es"
                    
                }
                else if unit.suffix(1) == "f" {
                    
                    unit = String(unit.dropLast())
                    
                    unit += "ves"
                    
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingridients.num == nil && ingridients.denom == nil ? "" : " "
            
            
            return portion + unit
            
        }
        
        return portion
    }
    
}
