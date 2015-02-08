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


#pragma mark - Util

-(NSArray *) observableKeys {
    
    return @[YOSNoteAttributes.name,
             YOSNoteAttributes.text,
             YOSNoteRelationships.notebook,
             YOSNoteRelationships.photo,@"photo.photoData"];
}


-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    // Solo me intesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
    
}



@end
