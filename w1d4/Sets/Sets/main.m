//
//  main.m
//  Sets
//
//  Created by Adam Dahan on 2016-03-10.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /* NSSet, NSArray, and NSDictionary are the three core collection classes defined by the Foundation Framework. An NSSet object represents a static, unordered collection of distinct objects. Sets are optimized for membership checking, so if you’re asking a lot of “is this object part of this group?” kind of questions, you should be using a set—not an array. */
        
        /*Collections can only interact with Objective-C objects. As a result, primitive C types like int need to be wrapped in an NSNumber before you can store them in a set, array, or dictionary.
         
         NSSet is immutable, so you cannot add or remove elements from a set after it’s been created. You can, however, alter mutable objects that are contained in the set. For example, if you stored an NSMutableString, you’re free to call setString:, appendFormat:, and the other manipulation methods on that object. This module also covers NSMutableSet and NSCountedSet.*/
        
        /* Creating Sets
         An NSSet can be created through the setWithObjects: class method, which accepts a nil-terminated list of objects. Most of the examples in this module utilize strings, but an NSSet instance can record any kind of Objective-C object, and it does not have to be homogeneous. */
        
//        NSSet *americanMakes = [NSSet setWithObjects:@"Chrysler", @"Ford",
//                                @"General Motors", nil];
//        NSLog(@"%@", americanMakes);
//        
        
        
        
        
        
        
        
        /* NSSet also includes a setWithArray: method, which turns an NSArray into an NSSet. Remember that sets are composed of unique elements, so this serves as a convenient way to remove all duplicates in an array. For example: */
        
//        NSArray *japaneseMakes = @[@"Honda", @"Mazda",
//                                   @"Mitsubishi", @"Honda"];
//        NSSet *uniqueMakes = [NSSet setWithArray:japaneseMakes];
//        NSLog(@"%@", uniqueMakes);    // Honda, Mazda, Mitsubishi
//        
        
        /*Enumerating Sets
         Fast-enumeration is the preferred method of iterating through the contents of a set, and the count method can be used to calculate the total number of items. For example:
         
         */
        
//        NSSet *models = [NSSet setWithObjects:@"Civic", @"Accord",
//                         @"Odyssey", @"Pilot", @"Fit", nil];
//        NSLog(@"The set has %li elements", [models count]);
//        
//        for (id item in models) {
//            NSLog(@"%@", item);
//            
//            if ([item isEqualToString:@"Fit"]) {
//                // Do something with Fit.
//            }
//        }
        
        // Block based enumeration
//        [models enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
//            NSLog(@"Current item: %@", obj);
//            if ([obj isEqualToString:@"Fit"]) {
//                NSLog(@"I was looking for a Honda Fit, and I found it!");
//                *stop = YES;    // Stop enumerating items
//            }
//        }];
        
        /* Comparing Sets
         In addition to equality, two NSSet objects can be checked for subset and intersection status. All three of these comparisons are demonstrated in the following example.
         
         */
        
//        NSSet *japaneseMakes = [NSSet setWithObjects:@"Honda", @"Nissan",
//                                @"Mitsubishi", @"Toyota", nil];
//        
//        
//        NSSet *johnsFavoriteMakes = [NSSet setWithObjects:@"Honda", nil];
//        NSSet *marysFavoriteMakes = [NSSet setWithObjects:@"Toyota",
//                                     @"Alfa Romeo", nil];
//        
//        if ([johnsFavoriteMakes isEqualToSet:japaneseMakes]) {
//            NSLog(@"John likes all the Japanese auto makers and no others");
//        }
//        if ([johnsFavoriteMakes intersectsSet:japaneseMakes]) {
//            // You'll see this message
//            NSLog(@"John likes at least one Japanese auto maker");
//        }
//        if ([johnsFavoriteMakes isSubsetOfSet:japaneseMakes]) {
//            // And this one, too
//            NSLog(@"All of the auto makers that John likes are Japanese");
//        }
//        if ([marysFavoriteMakes isSubsetOfSet:japaneseMakes]) {
//            NSLog(@"All of the auto makers that Mary likes are Japanese");
//        }
        
        /* Membership Checking
         Like all Foundation Framework collections, it’s possible to check if an object is in a particular NSSet. The containsObject: method returns a BOOL indicating the membership status of the argument. As an alternative, the member: returns a reference to the object if it’s in the set, otherwise nil. This can be convenient depending on how you’re using the set.
         
         */
        
//        NSSet *selectedMakes = [NSSet setWithObjects:@"Maserati",
//                                @"Porsche", nil];
//        // BOOL checking
//        if ([selectedMakes containsObject:@"Maserati"]) {
//            NSLog(@"The user seems to like expensive cars");
//        }
//        // nil checking
//        NSString *result = [selectedMakes member:@"Maserati"];
//        if (result != nil) {
//            NSLog(@"%@ is one of the selected makes", result);
//        }
        
        
        /* Filtering Sets
         You can filter the contents of a set using the objectsPassingTest: method, which accepts a block that is called using each item in the set. The block should return YES if the current object should be included in the new set, and NO if it shouldn’t. The following example finds all items that begin with an uppercase letter C.
         */
        
//        NSSet *toyotaModels = [NSSet setWithObjects:@"Corolla", @"Sienna",
//                               @"Camry", @"Prius",
//                               @"Highlander", @"Sequoia", nil];
//        NSSet *cModels = [toyotaModels objectsPassingTest:^BOOL(id obj, BOOL *stop) {
//            if ([obj hasPrefix:@"C"]) {
//                return YES;
//            } else {
//                return NO;
//            }
//        }];
//        NSLog(@"%@", cModels);    // Corolla, Camry
        
        /* Combining Sets
         Sets can be combined using the setByAddingObjectsFromSet: method. Since sets are unique, duplicates will be ignored if both sets contain the same object. */
        
//        NSSet *affordableMakes = [NSSet setWithObjects:@"Ford", @"Honda",
//                                  @"Nissan", @"Toyota", nil];
//        NSSet *fancyMakes = [NSSet setWithObjects:@"Ferrari", @"Maserati",
//                             @"Porsche", nil];
//        NSSet *allMakes = [affordableMakes setByAddingObjectsFromSet:fancyMakes];
//        NSLog(@"%@", allMakes);
        
        /* NSMutableSet
         Mutable sets allow you to add or delete objects dynamically, which affords a whole lot more flexibility than the static NSSet. In addition to membership checking, mutable sets are also more efficient at inserting and removing elements than NSMutableArray.
         
         NSMutableSet can be very useful for recording the state of a system. For example, if you were writing an application to manage an auto repair shop, you might maintain a mutable set called repairedCars and add/remove cars to reflect whether or not they have been fixed yet.
         
         Creating Mutable Sets
         Mutable sets can be created with the exact same methods as NSSet. Or, you can create an empty set with the setWithCapacity: class method. The argument defines the initial amount of space allocated for the set, but it in no way limits the number of items it can hold.*/
        
//        NSMutableSet *brokenCars = [NSMutableSet setWithObjects:
//                                    @"Honda Civic", @"Nissan Versa", nil];
//        NSMutableSet *repairedCars = [NSMutableSet setWithCapacity:5];
        
        /* Adding and Removing Objects
         The big additions provided by NSMutableSet are the addObject: and removeObject: methods. Note that addObject: won’t actually do anything if the object is already a member of the collection because sets are composed of unique items.
         
         */
        
        NSMutableSet *brokenCars = [NSMutableSet setWithObjects:
                                    @"Honda Civic", @"Nissan Versa", nil];
        NSMutableSet *repairedCars = [NSMutableSet setWithCapacity:5];
        // "Fix" the Honda Civic
        [brokenCars removeObject:@"Honda Civic"];
        [repairedCars addObject:@"Honda Civic"];
        
        NSLog(@"Broken cars: %@", brokenCars);     // Nissan Versa
        NSLog(@"Repaired cars: %@", repairedCars); // Honda Civic
    }
    return 0;
}
