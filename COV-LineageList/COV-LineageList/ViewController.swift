//
//  ViewController.swift
//  COV-LineageList
//
//  Created by Alumno on 21/01/22.
//  Copyright © 2022 El ruben. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tvView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return views.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaViewController") as! CeldaViewController
        celda.lblNombre.text = views[indexPath.row].lineage
        celda.lblFecha.text = views[indexPath.row].earliest_date
        celda.lblNumeroDesig.text = views[indexPath.row].designated_number
        celda.lblNumeroAsig.text = views[indexPath.row].assigned_number
        celda.lblWho.text = views[indexPath.row].who_name
        
        return celda
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! DetallesVarianteController
        destino.vieww = views[tvView.indexPathForSelectedRow!.row]
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inicializarVariantes()
    }
    
    var views : [View] = []
    func inicializarVariantes(){
        
        
        let url = URL(string: "http://172.31.13.19:8000/api/variantes")!
        var solicitud = URLRequest(url: url)
        solicitud.httpMethod = "GET"
        solicitud.allHTTPHeaderFields = [
            "Accept" : "application/json"
        ]
        let task = URLSession.shared.dataTask(with: solicitud){
            data, request, error in
            if let data = data {
                if let variantes_data = try? JSONDecoder().decode([View].self, from: data){
                    DispatchQueue.main.async {
                        self.views = variantes_data
                        self.tvView.reloadData()
                    }
                    
                } else{print("No se pudo interpretar respuesta")}
            } else if let error = error{
                print(error.localizedDescription)
            }
        
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

