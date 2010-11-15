//
//  Collision.h
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Collision : NSObject {

}

+ (BOOL) collisionBetween:(id)item1 and:(id)item2;

+ (void) relaxCollisionBetween:(id)item1 and:(id)item2 by:(Vector2*) relaxDistance;

+ (void) exchangeEnergyBetween:(id)item1 and:(id)item2 along:(Vector2*) collisionNormal;

@end
