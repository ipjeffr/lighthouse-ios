//
//  main.m
//  Protocols
//
//  Created by Adam Dahan on 2016-03-10.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Recruit.h"
#import "Commander.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Recruit *rookie = [[Recruit alloc] init];
        rookie.health = 100;
        rookie.name = @"Ghostman";
        
        if ([rookie fireLazerGuns]) {
            NSLog(@"Rookie has permission to fire lazer guns");
        } else {
            NSLog(@"Rookie has no permission to fire lazer guns");
        }
        
        Commander *c = [[Commander alloc] init];
        c.health = 100;
        c.name = @"Ghostman";
        c.delegate = rookie;
        
        if ([c fireLazerGuns]) {
            NSLog(@"Commander has permission to fire lazer guns");
        } else {
            NSLog(@"Commander has no permission to fire lazer guns");
        }
        
        [rookie cleanUpPortapotty];
    }
    return 0;
}
