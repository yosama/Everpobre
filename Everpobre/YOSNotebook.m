#import "YOSNotebook.h"

@interface YOSNotebook ()

// Private interface goes here.

@end

@implementation YOSNotebook

// Custom logic goes here.

+(instancetype) notebookWithName: (NSString *) aName context: (NSManagedObjectContext *) aContext{
    
    YOSNotebook *nb = [self insertInManagedObjectContext:aContext];
    
    nb.name = aName;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    
    return nb;
    
}


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
    
    return @[YOSNotebookAttributes.name, YOSNotebookRelationships.notes];
}


-(void) tearDownKVO {
    
    
    // baja en todas las listas spam
    
    for ( NSString *key in [self observableKeys]) {
        
        [self removeObserver:self
                  forKeyPath:key];
    }
}


-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    
    
    // Solo me intesa saber que algo ha cambiado
    
    
    self.modificationDate = [NSDate date];
    
}









@end
