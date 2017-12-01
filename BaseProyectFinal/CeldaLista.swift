//
//  CeldaLista.swift
//  BaseProyectFinal
//
//  Created by Giovanni on 12/1/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import UIKit

class CeldaLista: UICollectionViewCell {
    @IBOutlet weak var imgCancion: UIImageView!
    
    @IBOutlet weak var lblNombre: UILabel!
    
    var songData: Dictionary<String, AnyObject>!
    
    
    
    func initCell(){
        
        let url = self.songData["artworkUrl100"] as! String
        
        self.imgCancion.sd_setImage(with: URL(string: url))
        
        let name = self.songData["trackName"] as! String
        
        self.lblNombre.text = name
        
    }
}
