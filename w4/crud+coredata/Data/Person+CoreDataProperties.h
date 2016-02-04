//
//  Person+CoreDataProperties.h
//  Data
//
//  Created by Adam Dahan on 2016-02-04.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *first;
@property (nullable, nonatomic, retain) NSString *last;
@property (nullable, nonatomic, retain) NSSet<Address *> *addresses;

@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addAddressesObject:(Address *)value;
- (void)removeAddressesObject:(Address *)value;
- (void)addAddresses:(NSSet<Address *> *)values;
- (void)removeAddresses:(NSSet<Address *> *)values;

@end

NS_ASSUME_NONNULL_END
