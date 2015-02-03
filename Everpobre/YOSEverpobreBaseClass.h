//
//  YOSEverpobreBaseClass.h
//  Everpobre
//
//  Created by Yosnier on 03/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

@import CoreData;


@interface YOSEverpobreBaseClass : NSManagedObject


-(NSArray *) observableKeys;
-(void) setupKVO;
-(void) tearDownKVO;



@end
