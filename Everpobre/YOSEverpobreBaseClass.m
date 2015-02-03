//
//  YOSEverpobreBaseClass.m
//  Everpobre
//
//  Created by Yosnier on 03/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSEverpobreBaseClass.h"

@implementation YOSEverpobreBaseClass


#pragma mark - Lifecycle

-(void) awakeFromInsert {
    
    [super awakeFromInsert];
    
    //Se llama una vez en la vida
    [self setupKVO];
}

-(void) awakeFromFetch {
    
    [super awakeFromFetch];
    
    //Se llama un cojonal de veces
    [self setupKVO];
}


-(void) willTurnIntoFault {
    [super willTurnIntoFault];
    
    [self tearDownKVO];
}




#pragma mark KVO

-(void) setupKVO {
    
    // Alta en notigicaciones para las propiedades
    // que quiero observar
    
    for (id key  in [self observableKeys]) {
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld //Observa el valor nuevo y el veijo
                  context:NULL];
    }
    
}



-(NSArray *) observableKeys {
    
    return nil;
}



-(void) tearDownKVO {
    
    // baja en todas las listas spam
    
    for ( NSString *key in [self observableKeys]) {
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}


@end
