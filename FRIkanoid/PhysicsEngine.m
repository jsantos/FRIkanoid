//
//  PhysicsEngine.m
//  FRIkanoid
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PhysicsEngine.h"
#import "GameDefaults.Physics.h"
#import "Chomponthis.FRIkanoid.h"
#import "GameDefaults.Scene.Objects.h"

@implementation PhysicsEngine

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime{
	NSMutableArray *deadItems = [[[NSMutableArray alloc] init] autorelease];
	NSUInteger index = 0;
	
	for(id item in level.scene){
		[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
	}
	
	for (id item in level.scene){
		
		id<ILifetime> lifetime = ([item conformsToProtocol:@protocol(ILifetime)] && [item isKindOfClass:[Explosion class]]) ? (id<ILifetime>)item : nil;		
		
		// Update lifetimes
		if (lifetime) {
			if ([lifetime.lifetime isAlive]) {
				[lifetime.lifetime updateWithGameTime:gameTime];	
			} else {
				[deadItems addObject:lifetime];
			}
		}
		
		if (![item isKindOfClass:[PowerUp class]]) { //Avoid collisions between ball and power-up
				for(id lol in level.scene){
					if ([lol isKindOfClass:[Ball class]]) {
						Ball *pex = (Ball*)lol;
						if ([Collision collisionBetween:pex and:item] && [item isKindOfClass:[Brick class]]) {
						
						}
					}
				}
			} else if ([Collision collisionBetween:level.playerPad and:item] && [item isKindOfClass:[PowerUp class]]) {
			
			}
		index++;
	}
	
	for (id item in deadItems){
		[level.scene removeObjectIdenticalTo: item];
	}
}

@end
