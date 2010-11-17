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
	//Vector2 *gravity = [Vector2 vectorWithX:0 y:200 * gameTime.elapsedGameTime];
	for (id item in level.scene){
		id<IVelocity> itemWithVelocity = [item conformsToProtocol:@protocol(IVelocity)] ? item : nil;
		if (itemWithVelocity && [item isKindOfClass:[Ball class]] ) {
			//Simulate Gravity
			//[itemWithVelocity.velocity add: gravity];
			[MovementPhysics simulateMovementOn:item withElapsed:gameTime.elapsedGameTime];
		}
	}
	
	NSMutableIndexSet *discardedItems = [NSMutableIndexSet indexSet];
	NSUInteger index1 = 0, index2;
	
	for (id item1 in level.scene){
		index2 = 0;
		for (id item2 in level.scene){
			if (item1 != item2) {
				if ([Collision collisionBetween:item1 and:item2]) {
					if ([item1 isKindOfClass:[Brick class]] && [item2 isKindOfClass:[Ball class]]) {
						[discardedItems addIndex:index1];
					} else if ([item2 isKindOfClass:[Brick class]] && [item1 isKindOfClass:[Ball class]]) {
						[discardedItems addIndex:index2];
					}
				}
			}
			index2++;
		}
		index1++;
	}
	
	[level.scene removeObjectsAtIndexes:discardedItems];
	
	[super updateWithGameTime:gameTime];
	
//	//First move the pad
//	[MovementPhysics simulateMovementOn:level.playerPad withElapsed:gameTime.elapsedGameTime];
//	
//	//Now we do collision detection. We compare all pairs of items.
//	
//	for(id item1 in level.scene){
//		for(id item2 in level.scene){
//			if(item1 != item2){
//				id <IParticle> particleColider1 = [item1 conformsToProtocol:@protocol(IParticleColider)] ? item1 : nil;
//				
//				id <IParticle> particleColider2 = [item2 conformsToProtocol:@protocol(IParticleColider)] ? item2 :nil;
//				
//				if (particleColider1 && particleColider2) {
//					[ParticleParticleColision collisionBetween:particleColider1 and:particleColider2];
//				}
//			}
//		}
//	}
	
}

@end
