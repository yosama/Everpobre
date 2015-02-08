//
//  YOSNoteViewController.h
//  Everpobre
//
//  Created by Yosnier on 04/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "YOSNote.h"
#import "YOSNotebook.h"


@interface YOSNoteViewController : AGTCoreDataTableViewController

@property (nonatomic, strong) YOSNotebook *notebookModel;


@end
