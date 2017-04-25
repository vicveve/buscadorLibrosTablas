//
//  busquedaViewController.swift
//  buscadorLibrosTablas
//
//  Created by Victor Ernesto Velasco Esquivel on 24/04/17.
//  Copyright © 2017 Victor Ernesto Velasco Esquivel. All rights reserved.
//

import UIKit

class busquedaViewController: UIViewController {

    
    @IBOutlet weak var txtISBN: UITextField!
    
    var Libros : Array<Libro> = Array<Libro>()
    var LibroItem : Libro = Libro()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBOutlet weak var buscarLibro: UIButton!
    @IBAction func BuscarNuevoLibro(_ sender: Any) {
        
        let libro = RestCliente();
        LibroItem = libro.buscarLibroFormateado(codigo: txtISBN.text!)
        
       
        
        if(LibroItem.Succes){
            
           
            var add = LibrosViewController().ActualizaLista(libro: LibroItem)
            alerta(mensaje: "Se agrego el libro correctamente", titulo: "Alerta")

        }
        else{
            alerta(mensaje: "No se encontro el libro solicitado", titulo: "Alerta")
        }
        
    }
    
    func alerta(mensaje : String, titulo: String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sigVista=segue.destination as! LibrosViewController
        var libro = RestCliente();
        LibroItem = libro.buscarLibroFormateado(codigo: txtISBN.text!)
        
        
        
        if(LibroItem.Succes){
            
            Libros.append(LibroItem)
            
            //alerta(mensaje: "Se agrego el libro correctamente", titulo: "Alerta")
            
        }
        else{
            alerta(mensaje: "No se encontro el libro solicitado", titulo: "Alerta")
            return
        }
        
        sigVista.Libros = Libros
        
    }


}
