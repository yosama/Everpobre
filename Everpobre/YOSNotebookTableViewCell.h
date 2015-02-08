//
//  YOSNotebookTableViewCell.h
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YOSNotebookTableViewCell : UITableViewCell



+(CGFloat)height;
+(NSString *) cellId;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *notesViews;



@end
