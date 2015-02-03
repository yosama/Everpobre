#import "_YOSNote.h"
#import "YOSNotebook.h"

@interface YOSNote : _YOSNote {}
// Custom logic goes here.


+(instancetype) noteWithName: (NSString *) aName notebook: (YOSNotebook *) aNotebook context: (NSManagedObjectContext *) aContext;


@end
