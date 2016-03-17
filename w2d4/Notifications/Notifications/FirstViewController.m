//
//  ViewController.m
//  Notifications
//
//  Created by Adam Dahan on 2016-03-17.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

@end

@implementation FirstViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareView];
    [self prepareSubviews];
    [self prepareNotifications];
    [self prepareGestureRecognizers];
}

#pragma mark - Preparation

- (void)prepareView {
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)prepareSubviews {
    UIView *blueSquare = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    blueSquare.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueSquare];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(blueSquareTapped)];
    
    [blueSquare addGestureRecognizer:tap];
    
    
    UIView *redSquare = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 100, 0, 100, 100)];
    redSquare.backgroundColor = [UIColor redColor];
    [self.view addSubview:redSquare];
    
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(redSquareTapped)];
    tapTwo.numberOfTapsRequired = 2;
    [redSquare addGestureRecognizer:tapTwo];
}

- (void)prepareNotifications {
    
}

- (void)prepareGestureRecognizers {
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:self.panGesture];
}

#pragma mark - Gesture Recognizer handlers 

- (void)blueSquareTapped {
    NSLog(@"Blue square is being tapped");
}

- (void)redSquareTapped {
    NSLog(@"Red square is being tapped");
}

- (void)handlePan:(UIPanGestureRecognizer *)panGesture {
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"GESTURE BEGAN");
            break;
        case UIGestureRecognizerStateChanged:
            NSLog(@"GESTURE CHANGED");
            CGPoint panPoint = [panGesture locationInView:self.view];
            NSLog(@"%@", NSStringFromCGPoint(panPoint));
            break;
        case UIGestureRecognizerStateEnded:
            NSLog(@"GESTURE ENDED");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"SomeoneCalled" object:nil];
            break;
        default:
            break;
    }
}

@end
