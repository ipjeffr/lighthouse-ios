//
//  Recruit.h
//  Protocols
//
//  Created by Adam Dahan on 2016-03-10.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import "Player.h"
#import "BattleCapabilities.h"
#import "Commander.h"

@interface Recruit : Player <BattleCapabilities, CommanderDelegate>

@end
