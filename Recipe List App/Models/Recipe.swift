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
    var highlights:[String]
    var ingredients:[Ingridients]
    var directions:[String]
    var id:UUID?
    
}

class Ingridients: Identifiable, Decodable{
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
