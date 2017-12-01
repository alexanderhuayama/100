//
//  DetalleViewController.swift
//  BaseProyectFinal
//
//  Created by Giovanni on 12/1/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import UIKit
import SDWebImage

class DetalleViewController: UIViewController {

    @IBOutlet weak var lblArtista: UILabel!
    @IBOutlet weak var lblCancion: UILabel!
    @IBOutlet weak var imgCancion: UIImageView!
    static var songData: Dictionary<String,AnyObject>!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = DetalleViewController.songData["artworkUrl100"] as! String
        
        self.imgCancion.sd_setImage(with: URL(string: url))
        
        let name = DetalleViewController.songData["trackName"] as! String
        self.lblCancion.text = name
        
        let artista = DetalleViewController.songData["trackName"] as! String
        self.lblArtista.text = artista
    }

    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func agregarItem(_ sender: Any) {
        let cancion: Cancion = DataBaseManager.sharedInstance.createCancion()
        
        cancion.artistId = DetalleViewController.songData["trackId"] as! Int32
        let name = DetalleViewController.songData["artistName"] as! String
        cancion.artistName = name
        let url = DetalleViewController.songData["artworkUrl100"] as! String
        cancion.artworkUrl100 = url
        let price = DetalleViewController.songData["collectionPrice"] as! Float
        cancion.collectionPrice = String(format:"%.2f", price)
        
        DataBaseManager.sharedInstance.saveCancionDatBaseChanges()
        
        let _ = self.navigationController?.popViewController(animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
