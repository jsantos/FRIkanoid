//
//  ParticleAxisAlignedHalfPlaneCollision.h
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.Objects.h"

@interface ParticleAxisAlignedHalfPlaneCollision : NSObject {

}

+ (BOOL) collisionBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;

+ (BOOL) detectCollisionBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;

+ (void) resolveCollisionBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane;

@end
