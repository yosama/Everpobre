// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to YOSNote.h instead.

@import CoreData;

extern const struct YOSNoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *text;
} YOSNoteAttributes;

extern const struct YOSNoteRelationships {
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photo;
} YOSNoteRelationships;

@class YOSNotebook;
@class YOSPhotoContainer;

@interface YOSNoteID : NSManagedObjectID {}
@end

@interface _YOSNote : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) YOSNoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) YOSNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) YOSPhotoContainer *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _YOSNote (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (YOSNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(YOSNotebook*)value;

- (YOSPhotoContainer*)primitivePhoto;
- (void)setPrimitivePhoto:(YOSPhotoContainer*)value;

@end
