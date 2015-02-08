//
//  YOSNameTableViewCell.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSNameTableViewCell.h"

@implementation YOSNameTableViewCell


#pragma mark - Method class


+(CGFloat)height {
    return 44.0f;
}



+(NSString *) cellId {
    return [self description];
}



#pragma mark - Properties

-(void) setNote :(YOSNote *) aNote {
    
    self.nameField.text = aNote.name;
    
    _note = aNote;
    
}



- (void)awakeFromNib {
    // Initialization code
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark - KVO


-(void) prepareForReuse {
    
    [super prepareForReuse];
    
    // Cuando desaparezco me envian este mensaje pa que me resetee y me prepare para ser reutilizado
    // Algo asi como un viewWillDisappear
    
    self.note.name = self.nameField.text;
    
}





@end
