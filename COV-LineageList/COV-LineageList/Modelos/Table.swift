//
//  Table.swift
//  COV-LineageList
//
//  Created by Alumno on 21/01/22.
//  Copyright © 2022 El ruben. All rights reserved.
//

import Foundation

class Table : Decodable{
    
    var lineage: String?
    var earliest_date: String?
    var designated_number: String?
    var assigned_number: String?
    var who_name : String?
    var description : String?
    
    /*init(nombre: String, fecha: String, numeroDesig: String, numeroAsig: String, descripcion: String,who: String){
        self.lineage = nombre
        self.earliest_date = fecha
        self.designated_number = numeroDesig
        self.assigned_number = numeroAsig
        self.description = descripcion
        self.who_name = who
    }*/
}
