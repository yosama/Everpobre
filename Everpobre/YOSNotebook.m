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


-(NSArray *) observableKeys {
    
    return @[YOSNotebookAttributes.name, YOSNotebookRelationships.notes];
}


-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    
    
    // Solo me intesa saber que algo ha cambiado
    
    
    self.modificationDate = [NSDate date];
    
}









@end
