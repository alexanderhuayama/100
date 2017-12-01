//
//  ViewController.swift
//  BaseProyectFinal
//
//  Created by FRANCISCO JOSE SANCHEZ BAO on 13/11/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coleccionCanciones: UICollectionView!
    var songsData: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        var param = Dictionary<String, AnyObject>()
        //
        //        param ["llave"] = "" as AnyObject
        //        param ["llave"] = "" as AnyObject
        //        param ["llave"] = "" as AnyObject
        //var body = Dictionary<String, AnyObject>()
        //body["seccionid"] = 17 as AnyObject
        
        
        let url: String = "https://itunes.apple.com/search?term=serialasesino&country=pe"
        
        if(NetworkManager.isConnectedToNetwork()){
            
            NetworkManager.sharedInstance.callUrlWithCompletion(url: url, params: nil, completion: { (finished, response) in
                
                if(finished){
                    //let json = response["GetNoticiasSeccionResult"] as! Dictionary<String, AnyObject>
                    //let array = NSMutableArray(array: json["Result"] as! NSArray)
                    //self.listData = array
                    //self.coleccion.reloadData()
                    
                    let result = NSMutableArray(array: response["results"] as! NSArray)
                    
                    self.songsData = result
                    
                    self.coleccionCanciones.reloadData()
                    
                }else{
                    /// error de conexion
                }
            }, method: .get)
        }else{
            // debo indicar que no hay internet
        }
    }
    
    @IBAction func eliminarTodo(_ sender: UIButton) {
        DataBaseManager.sharedInstance.deleteCancionTable()
        DataBaseManager.sharedInstance.saveCancionDatBaseChanges()
        
    }
    
    
    
    @IBAction func listarCarro(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TablaViewController") as! TablaViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.songsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CeldaLista", for: indexPath) as! CeldaLista
        
        cell.songData = self.songsData[indexPath.row] as! Dictionary<String,AnyObject>
        
        cell.initCell()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = (collectionView.frame.width - 30) / 2
        
        let h = w * 1.5
        
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let songData = self.songsData[indexPath.row] as! Dictionary<String,AnyObject>
        
        DetalleViewController.songData = songData
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetalleViewController") as! DetalleViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}


