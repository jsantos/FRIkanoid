//
//  MovementPhysics.m
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MovementPhysics.h"
#import "GameDefaults.Scene.h"
#import "GameDefaults.Scene.Objects.h"


@implementation MovementPhysics

+ (void) simulateMovementOn:(id<NSObject>)item withElapsed:(NSTimeInterval)elapsed {
	id<IMovable> movable = [item conformsToProtocol:@protocol(IMovable)] ? (id<IMovable>)item : nil;
	
	if (movable) {
		[movable.position add:[Vector2 multiply:movable.velocity by:elapsed]];
	}	
}

@end