//
//  Commander.h
//  Protocols
//
//  Created by Adam Dahan on 2016-03-10.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import "Player.h"
#import "BattleCapabilities.h"

@class Recruit; 

@protocol CommanderDelegate <NSObject>

- (void)cleanUpPortapotty;

@end

@interface Commander : Player <BattleCapabilities>

@property (nonatomic, weak) id <CommanderDelegate> delegate;

@property (nonatomic, strong) Recruit *recruit;

@end
