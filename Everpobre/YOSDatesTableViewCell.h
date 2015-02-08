//
//  YOSDatesTableViewCell.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSNote.h"

@interface YOSDatesTableViewCell : UITableViewCell


+(CGFloat)height;

+(NSString *) cellId;



@property (weak, nonatomic) IBOutlet UILabel *dateCreated;
@property (weak, nonatomic) IBOutlet UILabel *dateModificate;

@property (strong,nonatomic) YOSNote *note;


-(void) setNote:(YOSNote *) aNote;


@end
