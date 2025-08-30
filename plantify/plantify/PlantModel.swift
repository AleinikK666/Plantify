//
//  PlantModel.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import UIKit

 var myPlants = Set <String>()


struct PlantModel{
    var mainImage : UIImage
    var plantName: String
    static func fetchPlants() -> [PlantModel]{
        let path = Bundle.main.path(forResource: "plantsData", ofType: "plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        let data = dictionary?.object(forKey: "plants") as? [NSDictionary]
        let n : Int = data?.count ?? 0
        var arr = [PlantModel]()
        var i : Int = 0
        while(i < n){
            let imgName = data?[i].object(forKey: "image") as! String
            let name = data?[i].object(forKey: "name") as! String
            if (myPlants.contains(name)){
                i += 1
                
            }
            else{
                guard let img = UIImage(named: imgName as! String) else { return [] }
                let p1 = PlantModel(mainImage: img, plantName: name as! String)
                arr.append(p1)
                i += 1
            }

        }
           return arr.sorted(by: {$0.plantName < $1.plantName})
       
       
    }
    static func unfetchPlants() -> [PlantModel]{
        let path = Bundle.main.path(forResource: "plantsData", ofType: "plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        let data = dictionary?.object(forKey: "plants") as? [NSDictionary]
        let n : Int = data?.count ?? 0
        var arr = [PlantModel]()
        var i : Int = 0
        while(i < n){
            let imgName = data?[i].object(forKey: "image") as! String
            let name = data?[i].object(forKey: "name") as! String
            if (myPlants.contains(name)){
                guard let img = UIImage(named: imgName as! String) else { return [] }
                let p1 = PlantModel(mainImage: img, plantName: name as! String)
                arr.append(p1)
            }
            i += 1

        }
       
        return arr.sorted(by: {$0.plantName < $1.plantName})
       
       
    }
}


