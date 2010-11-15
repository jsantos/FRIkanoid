//
//  ParticleParticleColision.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.Objects.classes.h"


@interface ParticleParticleColision : NSObject {

}

+ (BOOL) collisionBetween:(id<IParticleColider>)particle1 and:(id<IParticleColider>)particle2;
+ (BOOL) detectCollisionBetween:(id<IParticleColider>)particle1 and:(id<IParticleColider>)particle2;
+ (void) resolveCollisionBetween:(id<IParticleColider>)particle1 and:(id<IParticleColider>)particle2;

@end
