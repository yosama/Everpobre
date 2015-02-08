//
//  YOSPhotoViewController.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSPhotoViewController.h"

@interface YOSPhotoViewController ()

@end

@implementation YOSPhotoViewController


-(id) initWithModel :(YOSNote *) aModel {

    if (self = [super initWithNibName:nil bundle:nil]) {
        
        _model = aModel;
    }

    return self;
}


-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //Sincronizamos el modelo
    self.photoView.image = self.model.photo.image;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model.photo.image = self.photoView.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)takePhoto:(id)sender {
}

- (IBAction)deletePhoto:(id)sender {
}
@end
