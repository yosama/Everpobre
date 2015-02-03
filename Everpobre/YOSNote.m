#import "YOSNote.h"
#import "YOSPhotoContainer.h"


@interface YOSNote ()

// Private interface goes here.

@end

@implementation YOSNote

// Custom logic goes here.

+(instancetype) noteWithName: (NSString *) aName
                    notebook: (YOSNotebook *) aNotebook
                     context: (NSManagedObjectContext *) aContext {
    
    YOSNote *note = [self insertInManagedObjectContext:aContext];
   
    note.notebook = aNotebook;
    note.creationDate = [NSDate date];
    note.name = aName;
    note.modificationDate = [NSDate date];
    note.photo = [YOSPhotoContainer insertInManagedObjectContext:aContext];
    
    
    return note;
    
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


#pragma mark - Util

-(NSArray *) observableKeys {
    
    return @[YOSNoteAttributes.name,
             YOSNoteAttributes.text,
             YOSNoteRelationships.notebook,
             YOSNoteRelationships.photo,@"photo.photoData"];
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
