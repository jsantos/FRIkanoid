//
//  ParticleBoundingBoxCollision.h
//  GameDefaults
//
//  Created by jsantos on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.Objects.h"

@interface ParticleBoundingBoxCollision : NSObject {

}

+ (BOOL) collisionBetween:(id<IParticleColider>)particle and:(id<IBoundingBoxCollider>)boundingBox;

+ (BOOL) detectCollisionBetween:(id<IParticleColider>)particle and:(id<IBoundingBoxCollider>)boundingBox;

+ (void) resolveCollisionBetween:(id<IParticleColider>)particle and:(id<IBoundingBoxCollider>)boundingBox;


@end
