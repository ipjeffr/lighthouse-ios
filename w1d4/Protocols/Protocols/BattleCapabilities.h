//
//  BattleCapabilities.h
//  Protocols
//
//  Created by Adam Dahan on 2016-03-10.
//  Copyright © 2016 Adam Dahan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BattleCapabilities <NSObject>

- (BOOL)shoot;
- (BOOL)runaway;
- (BOOL)fireLazerGuns;

@end
