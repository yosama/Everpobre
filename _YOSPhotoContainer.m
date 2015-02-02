// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to YOSPhotoContainer.m instead.

#import "_YOSPhotoContainer.h"

const struct YOSPhotoContainerAttributes YOSPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct YOSPhotoContainerRelationships YOSPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation YOSPhotoContainerID
@end

@implementation _YOSPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (YOSPhotoContainerID*)objectID {
	return (YOSPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

