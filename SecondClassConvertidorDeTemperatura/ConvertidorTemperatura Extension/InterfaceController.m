//
//  InterfaceController.m
//  ConvertidorTemperatura Extension
//
//  Created by n0rf3n on 30/07/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()


@property(nonatomic, retain) IBOutlet WKInterfaceSlider * temperaturaSlider;
@property(nonatomic, retain) IBOutlet WKInterfaceLabel * lblTemperatura;


@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self.temperaturaSlider setValue:32];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


-(IBAction) cambioTemperatura:(float)valor{
    NSLog(@"cambioTemperatura => valor => %.1f",valor);
    // F -32 *5/9 = C
    float resultado = (valor -32)*5/9;
    self.lblTemperatura.text = [NSString stringWithFormat:@"%.0f ºF = %.0f ºC", valor, resultado ];
}

@end



