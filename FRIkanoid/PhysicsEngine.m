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
	//First move the pad
	[MovementPhysics simulateMovementOn:level.playerPad withElapsed:gameTime.elapsedGameTime];
	
	//Now we do collision detection. We compare all pairs of items.
	
	for(id item1 in level.scene){
		for(id item2 in level.scene){
			if(item1 != item2){
				id <IParticle> particleColider1 = [item1 conformsToProtocol:@protocol(IParticleColider)] ? item1 : nil;
				
				id <IParticle> particleColider2 = [item2 conformsToProtocol:@protocol(IParticleColider)] ? item2 :nil;
				
				if (particleColider1 && particleColider2) {
					[ParticleParticleColision collisionBetween:particleColider1 and:particleColider2];
				}
			}
		}
	}
	
}

@end
