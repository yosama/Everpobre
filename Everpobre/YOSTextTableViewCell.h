//
//  YOSTextTableViewCell.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YOSNote;

@interface YOSTextTableViewCell : UITableViewCell

+(CGFloat)height;

+(NSString *) cellId;


@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong,nonatomic) YOSNote *note;

-(void) setNote:(YOSNote *) aNote;

@end
