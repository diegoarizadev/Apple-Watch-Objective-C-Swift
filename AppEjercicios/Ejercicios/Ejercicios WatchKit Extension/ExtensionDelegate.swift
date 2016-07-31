//
//  ExtensionDelegate.swift
//  Ejercicios WatchKit Extension
//
//  Created by n0rf3n on 31/07/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//
//  ESTADO ACTUAL DE LA APLICACION.
//

import WatchKit
import HealthKit


class ExtensionDelegate: NSObject, WKExtensionDelegate {
    
    
    let healthStore:HKHealthStore = HKHealthStore() //Variable de Healthkit y se define para ser accesible desde cualquier parte de la aplicacion.
    
    
    func solicitarPermisos(){
        print("Solicitar Permisos Fx para la asignacion de permisos den HealthKit")
        
        if HKHealthStore.isHealthDataAvailable(){ //SI hay datos se verifican los permisos.
            
            let escritura = Set([
                HKObjectType.workoutType(),
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!,
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!]) //Caloria quemadas
            
            let lectura = Set([ //
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!, //Pasos realizados
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!,    //Altura
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryEnergyConsumed)!, //energia consumida a base de la dieta.
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierActiveEnergyBurned)!, //Calorias quemadas
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!, //Masa corporal o peso del user
                HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!, //Fecha de nacimiento
                HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType)!    //Grupo Sanguineo.
                ])
            
            healthStore.requestAuthorizationToShareTypes(escritura, readTypes: lectura, completion: { (habilitado:Bool, error:NSError?) in
                
                if error != nil { //Se verifica si existe algun error.!
                    print("Error al solicitar permisos \(error)")
                } else {
                    print("Permisos obtenidos")
                }
                
            })
        }
    }
    

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
        
        //Este metodo se invoca automatica-mente desde el SO el cual indica si la aplicacion ha sido invocada, iniciada o lanzada.
        //en este metodo se inicia la logica general de la aplicacion antes de ser mostrada.
        print("La aplicacion ha sido Lanzada")
        solicitarPermisos()
        
        
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        //Se invoca cuando el sistema le da el foco o cualquier toque de pantalla va a ser capturado y cualqueir compontente interactivo respondera.
        
        print("La aplicacion Se encuentra en primer plano")
        
        
        
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
        
        
        //Se invoca cuando la aplicacion a perdido el foco ya sea por que el user ha salido de la app o se ha presentado una notificacion de sistema.
        
        print("La aplicacion ha perdido el foco y esta en segundo plano.")
        
        
        
    }

}
