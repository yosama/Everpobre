//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Yosnier on 04/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

@import UIKit;
#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) yosWrapperInNavigation {

    UINavigationController *navC = [UINavigationController new];
    
    [navC pushViewController:self animated:NO];
    
    return navC;
}

@end
