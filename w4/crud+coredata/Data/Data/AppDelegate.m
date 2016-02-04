//
//  AppDelegate.m
//  Data
//
//  Created by Adam Dahan on 2016-02-03.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
# pragma mark - CREATE
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Person"
                                                         inManagedObjectContext:self.managedObjectContext];
    
    NSManagedObject *newPerson = [[NSManagedObject alloc] initWithEntity:entityDescription
                                     insertIntoManagedObjectContext:self.managedObjectContext];
    
    
    [newPerson setValue:@"Adam" forKey:@"first"];
    [newPerson setValue:@"Dahan" forKey:@"last"];
    [newPerson setValue:@44 forKey:@"age"];
    
    NSError *error = nil;
    
    if (![newPerson.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }

    
#pragma mark - READ
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:entity];
//    
//    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
//    
//    if (error) {
//        NSLog(@"Unable to execute fetch request.");
//        NSLog(@"%@, %@", error, error.localizedDescription);
//    }
//    
//    if (result.count > 0) {
//        NSManagedObject *person = (NSManagedObject *)[result objectAtIndex:0];
//        NSLog(@"1 - %@", person);
//        
//        NSLog(@"%@ %@", [person valueForKey:@"first"], [person valueForKey:@"last"]);
//        
//        NSLog(@"2 - %@", person);
//    }

#pragma mark - UPDATE
    
//    NSManagedObject *person = (NSManagedObject *)[result objectAtIndex:0];
//    
//    [person setValue:@30 forKey:@"age"];
//    
//    NSError *saveError = nil;
//    
//    if (![person.managedObjectContext save:&saveError]) {
//        NSLog(@"Unable to save managed object context.");
//        NSLog(@"%@, %@", saveError, saveError.localizedDescription);
//    }
    
    
#pragma mark - DELETE

//    [self.managedObjectContext deleteObject:person];
//    
//    NSError *deleteError = nil;
//    
//    if (![person.managedObjectContext save:&deleteError]) {
//        NSLog(@"Unable to save managed object context.");
//        NSLog(@"%@, %@", deleteError, deleteError.localizedDescription);
//    }

    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - CRUD STACK 

#pragma mark - CREATE

- (void)createEntityForName:(NSString *)name info:(NSDictionary *)info {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:name
                                                         inManagedObjectContext:self.managedObjectContext];
    
    NSManagedObject *mObj = [[NSManagedObject alloc] initWithEntity:entityDescription
                                          insertIntoManagedObjectContext:self.managedObjectContext];
    
    
    [info enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mObj setValue:obj forKey:key];
    }];
 
    NSError *error = nil;
    
    if (![mObj.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.adamdahan.Data" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Data" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Data.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
