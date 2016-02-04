//
//  Address+CoreDataProperties.h
//  Data
//
//  Created by Adam Dahan on 2016-02-04.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Address.h"

NS_ASSUME_NONNULL_BEGIN

@interface Address (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *country;
@property (nullable, nonatomic, retain) NSString *number;
@property (nullable, nonatomic, retain) NSString *street;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *persons;

@end

@interface Address (CoreDataGeneratedAccessors)

- (void)addPersonsObject:(NSManagedObject *)value;
- (void)removePersonsObject:(NSManagedObject *)value;
- (void)addPersons:(NSSet<NSManagedObject *> *)values;
- (void)removePersons:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
