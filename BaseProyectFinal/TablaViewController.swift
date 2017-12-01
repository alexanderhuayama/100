//
//  TablaViewController.swift
//  BaseProyectFinal
//
//  Created by Giovanni on 12/1/17.
//  Copyright © 2017 CIBERTEC. All rights reserved.
//

import UIKit

class TablaViewController: UIViewController {

    var cancionesData: NSMutableArray = []
    
    @IBOutlet weak var tableCanciones: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let new_canciones: NSArray = DataBaseManager.sharedInstance.getCancionArray()
        
        self.cancionesData = NSMutableArray(array: new_canciones)
        
        self.tableCanciones.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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



extension TablaViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cancionesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CeldaTabla = tableView.dequeueReusableCell(withIdentifier: "CeldaTabla", for: indexPath) as!CeldaTabla
        
        cell.data = self.cancionesData[indexPath.row] as! Cancion
        cell.initCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cancion = self.cancionesData[indexPath.row] as!  Cancion
        DetalleCarro.cancion = cancion
        
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetalleCarro") as! DetalleCarro
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

