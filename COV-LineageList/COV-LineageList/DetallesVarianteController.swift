//
//  DetallesVarianteController.swift
//  COV-LineageList
//
//  Created by Alumno on 21/01/22.
//  Copyright © 2022 El ruben. All rights reserved.
//

import Foundation
import UIKit

class DetallesVarianteController : UIViewController {
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblNumeroDesig: UILabel!
    @IBOutlet weak var lblNumeroAsig: UILabel!
    @IBOutlet weak var lblWho: UILabel!
    
    var vieww : View?
    override func viewDidLoad() {
        lblDescripcion.text = vieww!.who_name
        lblNombre.text = vieww!.lineage
        lblFecha.text = vieww!.earliest_date
        lblNumeroDesig.text = vieww!.designated_number
        lblNumeroAsig.text = vieww!.assigned_number
        lblWho.text = vieww!.who_name
    }
    @IBAction func doTapBack(_ sender: Any) {self.dismiss(animated: true, completion: nil)
    }
}
