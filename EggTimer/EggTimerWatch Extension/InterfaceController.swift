//
//  InterfaceController.swift
//  EggTimerWatch Extension
//
//  Created by n0rf3n on 30/07/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    
    @IBOutlet var cuentaRegresiva : WKInterfaceTimer!
    
    @IBOutlet var btnSuave : WKInterfaceButton!
    @IBOutlet var btnMedio: WKInterfaceButton!
    @IBOutlet var btnRapido : WKInterfaceButton!
    @IBOutlet var btnReiniciar : WKInterfaceButton!
    
    var reloj : NSTimer!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        //super.willActivate()
        NSLog("%@ willActivate", self)
        cuentaRegresiva.stop()
        btnReiniciar.setHidden(true)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        NSLog("%@ didDeactivate", self)
    }
    
    
    @IBAction func btnSuavePressed(){
        
        NSLog("boton Suave")
        StartTimer(120)
        
    }
    
    
    @IBAction func btnMedioPressed(){

        NSLog("boton Medio")
        StartTimer(210)
    }
    
    
    @IBAction func btnRapidoPressed(){
        
        NSLog("boton Rapido")
        StartTimer(540)
        
    }
    
    
    @IBAction func btnReiniciarPressed(){
        
        NSLog("boton Reiniciar!")
        
        detenerReloj()
        cuentaRegresiva.stop()
        cuentaRegresiva.setHidden(true)
        
    }
    
    func StartTimer(tiempo: Float){
        
        cuentaRegresiva.setDate(NSDate(timeInterval: NSTimeInterval(tiempo), sinceDate: NSDate() ))
        cuentaRegresiva.start()
        
        btnSuave.setHidden(true)
        btnMedio.setHidden(true)
        btnRapido.setHidden(true)
        btnReiniciar.setHidden(false)
        cuentaRegresiva.setHidden(false)
        
        reloj = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(tiempo), target: self, selector:Selector("detenerReloj"), userInfo: nil, repeats: false)
        
    }
    
    
    
    func detenerReloj (){
        reloj.invalidate()
        
        btnSuave.setHidden(false)
        btnMedio.setHidden(false)
        btnRapido.setHidden(false)
        btnReiniciar.setHidden(true)

        
    }
    
    

}
