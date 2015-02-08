//
//  YOSTextTableViewCell.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSTextTableViewCell.h"
#import "YOSNote.h"

@implementation YOSTextTableViewCell


+(CGFloat)height {
    return 320.0f;
}


+(NSString *) cellId {
    return [self description];
}


-(void) setNote:(YOSNote *) aNote {
    
    _note = aNote;
    
    self.textView.text = self.note.text;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void) prepareForReuse {
    
    [super prepareForReuse];

    // Guardo lo que ha escrito el usuario
    self.note.text = self.textView.text;
    
    
}





@end
