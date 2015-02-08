//
//  AppDelegate.m
//  Everpobre
//
//  Created by Yosnier on 02/02/15.
//  Copyright (c) 2015 YOS. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "YOSNotebook.h"
#import "YOSNote.h"
#import "YOSEverpobreBaseClass.h"
#import "YOSNotebooksViewController.h"
#import "UIViewController+Navigation.h"

@interface AppDelegate ()

@property (nonatomic, strong) AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Create the stack
    self.stack  = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Creamos datos
    [self createDummyData];
    
    //
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[YOSNotebook entityName]];
    
    req.fetchBatchSize = 30;
    
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:YOSNotebookAttributes.name
                                                          ascending:YES selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:YOSNoteAttributes.modificationDate
                                                          ascending:NO]];
    
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                         managedObjectContext:self.stack.context
                                                                           sectionNameKeyPath:nil cacheName:nil];
    
    // Create the controller
    YOSNotebooksViewController *notebookVC = [[YOSNotebooksViewController alloc] initWithFetchedResultsController:fc
                                                                                                            style:UITableViewStylePlain];
    
    // assign root controllNer
    self.window.rootViewController = [notebookVC yosWrapperInNavigation];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void) createDummyData {
    
    // Borramos
    [self.stack zapAllData];
    
    // creamos los datos
    YOSNotebook * nb = [YOSNotebook notebookWithName:@"Ex-novias para el recuerdo"
                                             context:self.stack.context];
    
    [YOSNote noteWithName:@"Mariana"
                 notebook:nb
                  context:self.stack.context];
    
    [YOSNote noteWithName:@"Camila Davalo"
                 notebook:nb
                  context:self.stack.context];
    [YOSNote noteWithName:@"Pampita"
                 notebook:nb
                  context:self.stack.context];
    
    
    // Fisgoneamos
    
    NSLog(@"Libreta: %@",nb);
    NSLog(@"Exs: %@",nb.notes);
    
}


-(void) trastearConDatos {
    
    YOSNotebook *nb2 = [YOSNotebook notebookWithName:@"Ideas de Apps"
                                            context:self.stack.context];
    
    YOSNote *iCachete = [YOSNote noteWithName:@"iCachete"
                                     notebook:nb2
                                      context:self.stack.context];
    // Comprobar que modificationDate se actualiza
    
    NSLog(@"Antes: %@",iCachete.modificationDate);
    
    iCachete.text = @"App educativa para reforzar la coordinacion motora fina y los reflejos";
    
    NSLog(@"Despues: %@", iCachete.modificationDate);

    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[YOSNote entityName]];
    
    request.fetchBatchSize = 20;
    request.sortDescriptors = @[[
                                 NSSortDescriptor
                                 sortDescriptorWithKey:YOSNoteAttributes.name
                                 ascending:YES selector:@selector(caseInsensitiveCompare:)],
                                [NSSortDescriptor
                                 sortDescriptorWithKey:YOSNoteAttributes.modificationDate
                                 ascending:NO]];
    
    // Predicado para hacer queries
    request.predicate = [NSPredicate predicateWithFormat:@"notebook == %@",nb2];
    
    
    
    NSError *err = nil;
    NSArray *res = [self.stack.context executeFetchRequest:request error:&err];
    
    
    if (!res) {
        // la cagamos
        NSLog(@"Error al buscar: %@",err);
    }
    
    NSLog(@"Numero de libretas: %lu", (unsigned long)[res count]);
    NSLog(@"Las libretas: %@", res);
    NSLog(@"Clase: %@",[res class]);
    
    
    //borrar
    [self.stack.context deleteObject:nb2];
    request.predicate = nil;
    
    res = [self.stack.context executeFetchRequest:request
                                            error:&err];
    
    
    if (!res) {
        NSLog(@"Error al buscar de nuevo: %@", res);
    }
    
    NSLog(@"Notas existentes: %@",res);
    
    // Guardamos
    
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar, caguento. %@",error);
    }];
    
    
}









@end
