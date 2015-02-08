//
//  YOSPhotoViewController.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

@import UIKit;

#import "YOSNote.h"
#import "YOSPhotoContainer.h"

@class YOSNote;


@interface YOSPhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) YOSNote *model;

-(id) initWithModel :(YOSNote *) aModel;

- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;



@end
