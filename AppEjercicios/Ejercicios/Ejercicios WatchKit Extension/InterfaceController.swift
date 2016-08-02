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
    @IBOutlet var btnAtras : WKInterfaceButton!
    @IBOutlet var btnPausa : WKInterfaceButton!
    
    @IBOutlet weak var WKTimer: WKInterfaceTimer!
    
    //Variables
    var myTimer : NSTimer?                  //Temporizador interno para realizar un seguimiento
    var tiempoAtras : NSTimeInterval = 32.0 //Segundos a ejecutar.
    var isPaused = false                    //Flag o bandera para determinar si está o no en pausa
    var startTime = NSDate()
    var elapsedTime : NSTimeInterval = 0.0  //Tiempo que ha pasado entre pausa / reanudar

    
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
    
    
    
    @IBAction func atras(){
        
        NSLog("Boton Atras")
        print("Devolviendo el tiempo....")
        contador.stop()//Detiene el conteo.

        myTimer = NSTimer.scheduledTimerWithTimeInterval(tiempoAtras,
                                                         target: self,
                                                         selector: Selector("timerDone"),
                                                         userInfo: nil,
                                                         repeats: false)
        
        WKTimer.setDate(NSDate(timeIntervalSinceNow: tiempoAtras ))
        WKTimer.start()
        
        
    }
    
    
    func timerDone(){
        print("Ejecutando TimerDone....")
        atras()
    }
    
    @IBAction func pauseResumePressed() {
        //Si, el temporizador está en pausa. quitar la pausa y reanudar la cuenta regresiva
        if isPaused{
            
             print("isPaused....")
            
            isPaused = false
            myTimer = NSTimer.scheduledTimerWithTimeInterval(tiempoAtras - elapsedTime,
                                                             target: self,
                                                             selector: Selector("timerDone"),
                                                             userInfo: nil,
                                                             repeats: false)
            
            WKTimer.setDate(NSDate(timeIntervalSinceNow: tiempoAtras - elapsedTime))
            
            WKTimer.start()
            startTime = NSDate()
            btnPausa.setTitle("Pause")
            
            
        }else{ //Pausar el temporizador.
            
            print("NO isPaused....")
            
            isPaused = true
            
            //obtener la cantidad de tiempo transcurrido antes de que se detuvieron
            let paused = NSDate()
            elapsedTime += paused.timeIntervalSinceDate(startTime)
            
            //detener el temporizador watchkit en la pantalla
            WKTimer.stop()
            
            //detener el tic-tac del reloj interno
            myTimer!.invalidate()
            
            btnPausa.setTitle("Resumen")
            
        }
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
        
        
        //myTimer = NSTimer.scheduledTimerWithTimeInterval(tiempoAtras, target: self, selector: Selector("timerDone"), userInfo: nil, repeats: false)
        //WKTimer.setDate(NSDate(timeIntervalSinceNow: tiempoAtras ))
        //WKTimer.start()
        
        
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
         print("Deteniendo....")
        
        print("La pantalla esta ha desactivado....")

        
    }


}
