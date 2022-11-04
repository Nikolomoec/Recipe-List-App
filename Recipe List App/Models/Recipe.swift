//
//  File.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 24.10.2022.
//

import Foundation

class Recipe: Identifiable, Decodable{
    
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    var id:UUID?
    
}
