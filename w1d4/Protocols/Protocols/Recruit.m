//
//  Recruit.m
//  Protocols
//
//  Created by Adam Dahan on 2016-03-10.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import "Recruit.h"

@implementation Recruit

- (BOOL)shoot {
    return YES;
}

- (BOOL)runaway {
    return YES;
}

- (BOOL)fireLazerGuns {
    return NO;
}

- (void)cleanUpPortapotty {
    NSLog(@"Yes sir the job is done, I am dirty"); 
}

@end
