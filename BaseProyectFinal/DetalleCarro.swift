//
//  DetalleCarro.swift
//  BaseProyectFinal
//
//  Created by Giovanni on 12/1/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import UIKit

class DetalleCarro: UIViewController {
    static var cancion: Cancion!
    var url : String!
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var imgCancion: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nombre = String(DetalleCarro.cancion.artistId)
        url = DetalleCarro.cancion.artworkUrl100
        
        self.lblNombre.text = nombre
        self.imgCancion.sd_setImage(with: URL(string: url))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func eliminarCancion(_ sender: UIButton) {
    
        
        DataBaseManager.sharedInstance.deleteCancion(a: DetalleCarro.cancion)
        DataBaseManager.sharedInstance.saveCancionDatBaseChanges()
        
        
        let _ = self.navigationController?.popToRootViewController(animated: true)
        
         //let _ = self.navigationController?.popViewController(animated: true)
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
