//
//  ParticleAxisAlignedRectangleCollisions.h
//  GameDefaults
//
//  Created by jsantos on 11/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.Objects.classes.h"

@interface ParticleAxisAlignedRectangleCollision : NSObject {

}

+ (BOOL) collisionBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;

+ (BOOL) detectCollisionBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;

+ (void) resolveCollisionBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;


@end
