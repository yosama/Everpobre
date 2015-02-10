//
//  YOSNoteTableViewController.m
//  Everpobre
//
//  Created by Yosnier on 05/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//


#import "YOSNoteTableViewController.h"
#import "YOSNameTableViewCell.h"
#import "YOSDatesTableViewCell.h"
#import "YOSPhotoTableViewCell.h"
#import "YOSTextTableViewCell.h"
#import "YOSPhotoViewController.h"
#import "YOSPhotoContainer.h"

@interface YOSNoteTableViewController ()

@end

@implementation YOSNoteTableViewController


-(id) initWithModel : (YOSNote *) model{
    
    if (self = [super initWithNibName:nil bundle:nil ]) {
        
        _model = model;
        
    }
    
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
            
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
            
        case DATES_SECTION:
            return DATES_SECTION_HEADER;
            break;
            
        case TEXT_SECTION:
            return TEXT_SECTION_HEADER;
            break;
            
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
            break;
            
        default:[NSException raise:@"Section no existe"
                            format:nil];
            return @"No existe";
            break;
            
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self registerNibs];
    switch (indexPath.section) {
            
        case NAME_SECTION: {
            YOSNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[YOSNameTableViewCell cellId]
                                                                         forIndexPath:indexPath];
            [cell setNote:self.model];
            return cell;
            break;
        }
            
        case DATES_SECTION: {
            
            YOSDatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[YOSDatesTableViewCell cellId]
                                                                          forIndexPath:indexPath];
            [cell setNote:self.model];
            return cell;
            break;
        }
            
        case TEXT_SECTION:{
            
            YOSTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[YOSTextTableViewCell cellId]
                                                                         forIndexPath:indexPath];
            [cell setNote:self.model];
            return cell;
            break;
            
        }
            
        case PHOTO_SECTION:{
            
            YOSPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[YOSPhotoTableViewCell cellId]
                                                                          forIndexPath:indexPath];
            [cell setNote:self.model];
            return cell;
            break;
        }
            
        default:
            [NSException raise:@"Unknow Section"
                        format:@"Unknow section %ld",(long)indexPath.section];
            return nil;
            break;
    }
    
}


// cell Height
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
            
        case NAME_SECTION:
            return [YOSNameTableViewCell height];
            break;
            
        case DATES_SECTION:
            return [YOSDatesTableViewCell height];
            break;
            
        case TEXT_SECTION:
            return [YOSTextTableViewCell height];
            break;
            
        case PHOTO_SECTION:
            return [YOSPhotoTableViewCell height];
            break;
            
        default:
            return 0;
            break;
            
    }
}


//Register the cells in the bundle
- (void) registerNibs {
    
    NSBundle *main = [NSBundle mainBundle];
    
    // Register custom name  cell
    UINib *nameNib = [UINib nibWithNibName:@"YOSNameTableViewCell"
                                    bundle:main];
    [self.tableView registerNib:nameNib
         forCellReuseIdentifier:[YOSNameTableViewCell cellId]];
    
    //Register cutom dates  cell
    UINib *datesNib = [UINib nibWithNibName:@"YOSDatesTableViewCell"
                                     bundle:main];
    [self.tableView registerNib:datesNib
         forCellReuseIdentifier:[YOSDatesTableViewCell cellId]];
    
    // Register custom text cell
    UINib *textNib = [UINib nibWithNibName:@"YOSTextTableViewCell"
                                    bundle:main];
    [self.tableView registerNib:textNib
         forCellReuseIdentifier:[YOSTextTableViewCell cellId]];
    
    //Register custom photo cell
    UINib *photoNib = [UINib nibWithNibName:@"YOSPhotoTableViewCell"
                                     bundle:main];
    [self.tableView registerNib:photoNib
         forCellReuseIdentifier:[YOSPhotoTableViewCell cellId]];
    
    
}


//
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == PHOTO_SECTION) {
        
        YOSPhotoViewController *photoVC = [[YOSPhotoViewController alloc] initWithModel:self.model];
        
        [self.navigationController pushViewController:photoVC
                                             animated:YES];
        
    }
}






@end
