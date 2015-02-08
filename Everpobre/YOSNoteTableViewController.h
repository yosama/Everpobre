//
//  YOSNoteTableViewController.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//


#define NUMBER_OF_SECTIONS 4
#define NAME_SECTION_HEADER @"Name"
#define DATES_SECTION_HEADER @"Created and last modified"
#define TEXT_SECTION_HEADER @"Text"
#define PHOTO_SECTION_HEADER @"Photo"

#define NAME_SECTION 0
#define DATES_SECTION 1
#define TEXT_SECTION 2
#define PHOTO_SECTION 3

#import <UIKit/UIKit.h>
#import "YOSNote.h"


@interface YOSNoteTableViewController : UITableViewController

@property (strong, nonatomic) YOSNote* model;


-(id) initWithModel : (YOSNote *) model;



@end
