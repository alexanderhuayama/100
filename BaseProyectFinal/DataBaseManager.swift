//
//  DataBaseManager.swift
//  BaseProyectFinal
//
//  Created by Giovanni on 12/1/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import Foundation
import MagicalRecord

class DataBaseManager {
    
    static let sharedInstance = DataBaseManager()
   
    
    func createCancion() -> Cancion{
        
        let a = Cancion.mr_createEntity()
        
        a?.artistId = -1
        a?.artistName = ""
        a?.artworkUrl100 = ""
        a?.collectionPrice = ""
        
        self.saveCancionDatBaseChanges()
        
        return a!
        
    }
    
    func getCancionArray() -> NSArray {
        let arr: NSArray = Cancion.mr_findAll()! as NSArray
        return arr
    }
    
    func getCancionByKey(attribute: String, value: AnyObject) -> Cancion {
        let a = Cancion.mr_find(byAttribute: attribute, withValue: value)
        
        return a![0] as! Cancion
    }
    
    func getGroupOfCancionsByKey(attribute: String, value: AnyObject) -> [AnyObject] {
        let p = Cancion.mr_find(byAttribute: attribute, withValue: value)
        
        return p!
    }
    
    
    func saveCancionDatBaseChanges(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    func deleteCancion(a:Cancion){
        a.mr_deleteEntity()
        self.saveCancionDatBaseChanges();
    }
    
    func deleteCancionTable(){
        Cancion.mr_truncateAll()
        self.saveCancionDatBaseChanges();
    }
}

