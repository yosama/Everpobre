//
//  YOSPhotoViewController.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSPhotoViewController.h"
#import "UIImage+Resize.h"

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
    
    // Crean un picker
    UIImagePickerController *picker = [UIImagePickerController new];
    
    //Configurar
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        //tenemos camara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        //no tenemos camara
        
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    
    picker.delegate = self;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //Presentar
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         NSLog(@"!Termine!");
                     }];
    
    
}


- (IBAction)deletePhoto:(id)sender {
    
    CGRect oldRect = self.photoView.bounds;
    
    [UIView animateWithDuration:0.8
                          delay:0
                        options:0
                     animations:^{
                         
                         //Estado final
                         self.photoView.bounds = CGRectZero;
                         self.photoView.alpha = 0;
                     }completion:^(BOOL finished) {
                         //Quitar la foto del modelo
                         self.model.photo.image = nil;
                         //Quitar la foto de la vista
                         self.photoView.image = nil;
                         //Dejamos la vista como estaba
                         self.photoView.bounds = oldRect;
                         self.photoView.alpha = 1.0;
                     }];
    // Elminar la foto del modelo
    self.model.photo.image = nil;
    
    //Eliminar la foto de la vista
    self.photoView.image = nil;
    
    [UIView animateWithDuration:0.8
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:1.0
                        options:0
                     animations:^{
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                     }
                     completion:^(BOOL finished) {
                         self.photoView.transform = CGAffineTransformIdentity;
                     }];                     
    
}



- (IBAction)btnVintage:(id)sender {
    
    //ccreamos un contexto
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //Obtenemos la imagen original
    CIImage *original = [CIImage imageWithCGImage:self.model.photo.image.CGImage];
    
    //Creamos y configuramos filtro
    CIFilter *falseColor = [CIFilter filterWithName:@"CIFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:original
                  forKey:@"InputImage"];
    
    //Obtenemos la imagen de salida
    CIImage *output = falseColor.outputImage;
    
    
    //Creamos filtro vineta configuramos filtro
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignette"];
    [vignette setDefaults];
    [vignette setValue:@12
                  forKey:@"InputIntensity"];
    
    //Los encadenamos
    [vignette setValue:output
                forKey:@"InputImage"];

    output = vignette.outputImage;
    
    //Aplicamos el filtro
    CGImageRef final = [context createCGImage:output
                                        fromRect:[output extent]];
    
    //Obtengo la imagen en la forma de UIImage
    UIImage *finalImg = [UIImage imageWithCGImage:final];
    
    //Liberamos recursos
    CGImageRelease(final);
    
    //Encasquetamos en UIImageView
    self.photoView.image = finalImg;
    self.model.photo.image = finalImg;
    
}



#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //OJO PICO DE MEMORIA
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //Reducimos la imagen
    CGSize newSize = CGSizeMake(img.size.width * 0.5, img.size.height *0.5);
    
    img = [img resizedImage:newSize interpolationQuality:kCGInterpolationHigh];
    
    
    self.model.photo.image = img;
    
    
    //ocultar el picker
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}






@end
