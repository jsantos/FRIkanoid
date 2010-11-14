//
//  Collision.m
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Collision.h"
#import "GameDefaults.Scene.Objects.h"


@implementation Collision

+ (void) collisionBetween:(id)item1 and:(id)item2 {
	id<IParticleColider> item1Particle = [item1 conformsToProtocol:@protocol(IParticleColider)] ? item1 : nil;
	id<IParticleColider> item2Particle = [item2 conformsToProtocol:@protocol(IParticleColider)] ? item2 : nil;
	
	id<IAxisAlignedHalfPlaneCollider> item1AAHalfPlaneCollider = [item1 conformsToProtocol:@protocol(IAxisAlignedHalfPlaneCollider)] ? item1 : nil;
	id<IAxisAlignedHalfPlaneCollider> item2AAHalfPlaneCollider = [item2 conformsToProtocol:@protocol(IAxisAlignedHalfPlaneCollider)] ? item2 : nil;
	
	
}

@end
