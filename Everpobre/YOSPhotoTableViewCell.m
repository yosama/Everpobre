//
//  YOSPhotoTableViewCell.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSPhotoTableViewCell.h"
#import "YOSNote.h"
#import "YOSPhotoContainer.h"

@implementation YOSPhotoTableViewCell


-(void) setNote:(YOSNote *)aNote {
    
    _note = aNote;
    
    if (aNote.photo.image) {
     self.photoImage.image = self.note.photo.image;
    }
    
}


+(CGFloat)height {
    return 320.0f;
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
