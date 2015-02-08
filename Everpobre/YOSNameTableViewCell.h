//
//  YOSNameTableViewCell.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSNote.h"

@interface YOSNameTableViewCell : UITableViewCell

+(CGFloat)height;

+(NSString *) cellId;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) YOSNote *note;

-(void) setNote:(YOSNote *) note;

@end
