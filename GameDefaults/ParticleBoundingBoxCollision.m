//
//  ParticleBoundingBoxCollision.m
//  GameDefaults
//
//  Created by jsantos on 11/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParticleBoundingBoxCollision.h"
#import "GameDefaults.Scene.Objects.h"
#import "GameDefaults.Physics.h"


@implementation ParticleBoundingBoxCollision

+ (BOOL) collisionBetween:(id <IParticleColider>)particle and:(id <IBoundingBoxCollider>)boundingBox {
	if ([ParticleBoundingBoxCollision detectCollisionBetween:particle and:boundingBox]) {
		[ParticleBoundingBoxCollision resolveCollisionBetween:particle and:boundingBox];
		return YES;
	}
	return NO;
}

+ (BOOL) detectCollisionBetween:(id <IParticleColider>)particle and:(id <IBoundingBoxCollider>)boundingBox {
	float tempX = particle.position.x, tempY = particle.position.y;
	if (tempX < boundingBox.position.x - boundingBox.width / 2) {
		tempX = boundingBox.position.x - boundingBox.width / 2;
	}
	if (tempX > boundingBox.position.x + boundingBox.width / 2) {
		tempX = boundingBox.position.x + boundingBox.width / 2;
	}
	if (tempY < boundingBox.position.y - boundingBox.height / 2) {
		tempY = boundingBox.position.y - boundingBox.height / 2;
	}
	if (tempY > boundingBox.position.y + boundingBox.height / 2) {
		tempY = boundingBox.position.y + boundingBox.height / 2;
	}
	
	float distance = sqrt(
						  (tempX-particle.position.x)*(tempX-particle.position.x) + 
						  (tempY-particle.position.y)*(tempY-particle.position.y)
						  );
	
	if (distance < particle.radius) {
		return YES;
	}
	return NO;
}

+ (void) resolveCollisionBetween:(id <IParticleColider>)particle and:(id <IBoundingBoxCollider>)boundingBox {
	
}

@end
