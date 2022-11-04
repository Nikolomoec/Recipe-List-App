//
//  DataService.swift
//  Recipe List App
//
//  Created by Nikita Kolomoec on 24.10.2022.
//

import Foundation

class DataService{
    
    static func getLocalData() -> [Recipe]{
        
        let path = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard path != nil else {
            return [Recipe]()
        }
        
            let url = URL(filePath: path!)
        do{
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode([Recipe].self, from: data)
                
                for r in decodedData{
                    r.id = UUID()
                }
                
                return decodedData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
    return [Recipe]()
        
    }
    
}
