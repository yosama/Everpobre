//
//  YOSPhotoTableViewCell.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YOSNote;

@interface YOSPhotoTableViewCell : UITableViewCell

+(CGFloat)height;

+(UIImage *) cellId;

@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) YOSNote *note;

-(void) setNote:(YOSNote *)note;



@end
