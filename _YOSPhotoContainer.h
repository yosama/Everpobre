// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to YOSPhotoContainer.h instead.

@import CoreData;

extern const struct YOSPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} YOSPhotoContainerAttributes;

extern const struct YOSPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} YOSPhotoContainerRelationships;

@class YOSNote;

@interface YOSPhotoContainerID : NSManagedObjectID {}
@end

@interface _YOSPhotoContainer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) YOSPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _YOSPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(YOSNote*)value_;
- (void)removeNotesObject:(YOSNote*)value_;

@end

@interface _YOSPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
