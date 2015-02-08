//
//  YOSNotebooksViewController.m
//  Everpobre
//
//  Created by Yosnier on 04/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSNotebooksViewController.h"
#import "YOSNotebook.h"
#import "YOSNote.h"
#import "YOSNoteViewController.h"
#import "YOSNotebookTableViewCell.h"

@implementation YOSNotebooksViewController



-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Everpobre";
    
    // Create button
    UIBarButtonItem *btnBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                                action:@selector(addNotebook:)];
    // Show button
    self.navigationItem.rightBarButtonItem = btnBarItem;
    
    
    // Registro la celda de las libretas
    UINib *nibNotebooksTVC = [UINib nibWithNibName:@"YOSNotebookTableViewCell"
                                            bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nibNotebooksTVC
         forCellReuseIdentifier:[YOSNotebookTableViewCell cellId]];
    
}


-(void) didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    YOSNotebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Create the type custom cell
    YOSNotebookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[YOSNotebookTableViewCell cellId]
                                                                     forIndexPath:indexPath];
    //Configure model to view
    cell.nameView.text = notebook.name;
    cell.notesViews.text = [NSString stringWithFormat:@"(%lu)",(unsigned long)notebook.notes.count];
    
   
    
    return cell;
}



#pragma mark - Actions


-(void) addNotebook:(id) sender {

    // Cacht the context and add a new notebook
    [YOSNotebook notebookWithName:@"New Notebook"
                          context:self.fetchedResultsController.managedObjectContext];
}


// Delete a notebook
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


//Push title to delete button
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
}



#pragma mark - Delegate


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    YOSNotebooksViewController *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
   
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[YOSNote entityName]];
    
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:YOSNotebookAttributes.name
                                                          ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:YOSNoteAttributes.modificationDate
                                                          ascending:NO]];
    
    
    req.predicate  = [NSPredicate predicateWithFormat:@"notebook == %@",notebook];
    
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.fetchedResultsController.managedObjectContext sectionNameKeyPath:nil
                                                                                    cacheName:nil];
    //Create the controller note
    YOSNoteViewController *noteVC = [[YOSNoteViewController alloc] initWithFetchedResultsController:fc
                                                                                              style:UITableViewStylePlain];
    
    noteVC.notebookModel = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Pusheo
    [self.navigationController pushViewController:noteVC
                                         animated:YES];
    

}


@end
