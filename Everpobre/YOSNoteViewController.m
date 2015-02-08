//
//  YOSNoteViewController.m
//  Everpobre
//
//  Created by Yosnier on 04/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "YOSNoteViewController.h"
#import "YOSNotebooksViewController.h"
#import "YOSNote.h"
#import "YOSPhotoContainer.h"
#import "YOSNoteTableViewController.h"


@implementation YOSNoteViewController

-(void) viewDidLoad {
    
    [super viewDidLoad];
    
    //
    UIBarButtonItem *btnBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                target:self
                                                                                action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem = btnBarItem;

    
    self.title = self.notebookModel.name;
}




-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YOSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    static NSString *cellId = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
        
    }
    
    //Configure model to view
    cell.imageView.image = note.photo.image;
    cell.textLabel.text = note.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterMediumStyle;
    
    cell.detailTextLabel.text = [fmt stringFromDate:note.modificationDate];
    
    return cell;

}



#pragma mark - Actions

// Add new note
-(void) addNote:(id) sender {
    
    [YOSNote noteWithName:@"New note"
                 notebook:self.notebookModel
                  context:self.notebookModel.managedObjectContext];
    
    
}


// delete note
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (editingStyle == UITableViewCellEditingStyleDelete ) {
        
        YOSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        NSManagedObjectContext *contx = self.notebookModel.managedObjectContext;
        
        [contx deleteObject:note];
        
    }
    
}


// Push title
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"Remove";
    
    
}



#pragma mark - Delegate

//Catch note and push
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Buscar la nota
    YOSNote *note = [self.fetchedResultsController objectAtIndexPath:indexPath];

    //Crear formulario de nota
    YOSNoteTableViewController *noteVC = [[YOSNoteTableViewController alloc] initWithModel:note];
    
    // Hacer el push
    [self.navigationController pushViewController:noteVC
                                         animated:YES];
    
    
    
}

@end
