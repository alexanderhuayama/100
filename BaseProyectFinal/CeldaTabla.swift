//
//  CeldaTabla.swift
//  BaseProyectFinal
//
//  Created by Giovanni on 12/1/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import UIKit

class CeldaTabla: UITableViewCell {

    var data : Cancion!
    var url : String!
    
    @IBOutlet weak var lblIdArtista: UILabel!
    @IBOutlet weak var lblNombreArtista: UILabel!
    @IBOutlet weak var imgCancion: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(){
        self.lblNombreArtista.text = self.data.artistName
        self.lblIdArtista.text = String(self.data.artistId);
        url =  self.data.artworkUrl100
        
        self.imgCancion.sd_setImage(with: URL(string: url))
        
        
    }
}
