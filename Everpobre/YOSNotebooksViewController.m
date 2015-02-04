//
//  YOSNotebooksViewController.m
//  Everpobre
//
//  Created by Yosnier on 04/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSNotebooksViewController.h"
#import "YOSNotebook.h"

@implementation YOSNotebooksViewController



-(void) viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Everpobre";
    
    UIBarButtonItem *btnBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                                action:@selector(addNotebook:)];
    
    self.navigationItem.rightBarButtonItem = btnBarItem;
}


-(void) didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    YOSNotebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    static NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {

        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    
    //Configure model to view
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",notebook.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)",[fmt stringFromDate:notebook.modificationDate],(unsigned long)notebook.notes.count];
    
    return cell;
}



#pragma mark - Actions


-(void) addNotebook:(id) sender {

    // Capture the context and add a new notebook
    [YOSNotebook notebookWithName:@"New Notebook"
                          context:self.fetchedResultsController.managedObjectContext];
}


-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    if (editingStyle == UITableViewCellEditingStyleDelete ) {
        
        // capture the context
        NSManagedObjectContext *context = self.fetchedResultsController.managedObjectContext;
        
        // Delete the notebook
        YOSNotebook *notebookDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [context deleteObject:notebookDelete];
    }
    
}



-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
    
    
}




@end
