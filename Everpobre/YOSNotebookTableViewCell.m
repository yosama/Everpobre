//
//  YOSNotebookTableViewCell.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSNotebookTableViewCell.h"

@implementation YOSNotebookTableViewCell


+(CGFloat)height {
    return 60.0f;
}

+(NSString *) cellId {
    return [self description];
}


- (void)awakeFromNib {
    // Initialization code
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
