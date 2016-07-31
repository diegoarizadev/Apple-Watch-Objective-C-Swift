//
//  InterfaceController.swift
//  Ejercicios WatchKit Extension
//
//  Created by n0rf3n on 31/07/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    //Referencias.
    @IBOutlet var contador : WKInterfaceTimer!
    @IBOutlet var lblCalorias : WKInterfaceLabel!
    @IBOutlet var lblPasos : WKInterfaceLabel!
    @IBOutlet var btnIniciar : WKInterfaceButton!
    @IBOutlet var btnDetener : WKInterfaceButton!
    
    
    //Acciones para los botones.Acciones
    @IBAction func iniciar(){
        
        NSLog("Boton Iniciar")
        print("Iniciado....")
        
        contador.setDate(NSDate())
        //Progresiva, El objeto debe contener la fecha actual
        //REgresiva, El objeto NSDATE debe ser futuro.
        contador.start() //Inicia el conteo
        
    }
    
    @IBAction func detener(){
        
        NSLog("Boton Detener")
        print("Deteniendo....")
        contador.stop()//Detiene el conteo.
        
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    
    
    //LOS METODOS WILLACTIVATE Y DIDACTIVATE SON PARA LAS PANTALLAS Y SU CICLO DE VIDA. EL CICLO DE VIDA DE LA APLICACION SE MANEJA 
    //CON LA CLASE INTERFACE CONTROLLER.
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
         print("La pantalla esta activa....")
        
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
         print("Deteniendo....")
        
        print("La pantalla esta ha desactivado....")

        
    }

}
