//
//  AppDelegate.m
//  Notifications
//
//  Created by Adam Dahan on 2016-03-17.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSNotificationCenter *ns = [NSNotificationCenter defaultCenter];
    [ns addObserver:self
           selector:@selector(someoneCalledMe)
               name:@"SomeoneCalled"
             object:nil];
    
    
    FirstViewController *fvc = [[FirstViewController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = fvc;
    [self.window makeKeyAndVisible];

    
    return YES;
}

- (void)someoneCalledMe {
    NSLog(@"Hey I am receiving a phone call"); 
}

@end
