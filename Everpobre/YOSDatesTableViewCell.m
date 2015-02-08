//
//  YOSDatesTableViewCell.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSDatesTableViewCell.h"

@implementation YOSDatesTableViewCell


+(CGFloat)height {
    return 320.0f;
}


+(NSString *) cellId {
    return [self description];
}


-(void) setNote:(YOSNote *) aNote {

    _note = aNote;
    
    //Darse alta a las notificaciones de KVO
    [self.note addObserver:self
                forKeyPath:YOSNotebookAttributes.modificationDate
                   options:0
                   context:NULL];

    [self syncNoteToView];
    
}


- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
   
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void) prepareForReuse {
    [super prepareForReuse];
    
    // Darse de baja de las notificaciones de KVO
    [self.note removeObserver:self
                   forKeyPath:YOSNoteAttributes.modificationDate];
    
}


-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    // Sincronizamos el nuevo valor de modificationDate
    [self syncNoteToView];
    
    
    
}


-(void) syncNoteToView {
    
    NSDateFormatter *fmt  = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    self.dateCreated.text = [fmt stringFromDate:self.note.creationDate];
    
    fmt.dateStyle = NSDateIntervalFormatterFullStyle;
    self.dateModificate.text = [fmt stringFromDate:self.note.modificationDate];
    
    
}






@end
