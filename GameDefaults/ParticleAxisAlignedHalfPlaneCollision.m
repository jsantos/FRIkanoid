//
//  ParticleAxisAlignedHalfPlaneCollision.m
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParticleAxisAlignedHalfPlaneCollision.h"
#import "GameDefaults.Scene.Objects.h"
#import "GameDefaults.Math.h"
#import "GameDefaults.Physics.h"

@implementation ParticleAxisAlignedHalfPlaneCollision

+ (BOOL) collisionBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane {
	if ([ParticleAxisAlignedHalfPlaneCollision detectCollisionBetween:particle and:axisAlignedHalfPlane]) {
		[ParticleAxisAlignedHalfPlaneCollision resolveCollisionBetween:particle and:axisAlignedHalfPlane];
		return YES;
	}
	return NO;
}

+ (BOOL) detectCollisionBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane {
	switch (axisAlignedHalfPlane.axisAlignedHalfPlane.direction) {
		default:
		case AxisDirectionPositiveX:
			return particle.position.x - particle.radius < axisAlignedHalfPlane.axisAlignedHalfPlane.distance;
			break;
		case AxisDirectionNegativeX:
			return particle.position.x + particle.radius > -axisAlignedHalfPlane.axisAlignedHalfPlane.distance;	
			break;
		case AxisDirectionPositiveY:
			return particle.position.y - particle.radius < axisAlignedHalfPlane.axisAlignedHalfPlane.distance;	
			break;
		case AxisDirectionNegativeY:
			return particle.position.y + particle.radius > -axisAlignedHalfPlane.axisAlignedHalfPlane.distance;
			break;
	}
}

+ (void) resolveCollisionBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane {
	//RELAXATION STEP
	
	//First we relax the collision, so the two objects don't collide any more
	Vector2 *relaxDistance;
	switch (axisAlignedHalfPlane.axisAlignedHalfPlane.direction) {
		default:
		case AxisDirectionPositiveX:
			relaxDistance = [Vector2 vectorWithX:particle.position.x - particle.radius - axisAlignedHalfPlane.axisAlignedHalfPlane.distance y:0];
			break;
		case AxisDirectionNegativeX:
			relaxDistance = [Vector2 vectorWithX:particle.position.x + particle.radius + axisAlignedHalfPlane.axisAlignedHalfPlane.distance y:0];
			break;
		case AxisDirectionPositiveY:
			relaxDistance = [Vector2 vectorWithX:0 y:particle.position.y - particle.radius - axisAlignedHalfPlane.axisAlignedHalfPlane.distance];
			break;
		case AxisDirectionNegativeY:
			relaxDistance = [Vector2 vectorWithX:0 y:particle.position.y + particle.radius + axisAlignedHalfPlane.axisAlignedHalfPlane.distance];
			break;
	}
	[Collision relaxCollisionBetween:particle and:axisAlignedHalfPlane by:relaxDistance];
	
	// ENERGY EXCHANGE STEP
	
	// In a collision, energy is exchanged only along the collision normal.
	// For particles this is simply the line between both centers.
	Vector2 *collisionNormal = [[Vector2 vectorWithVector:relaxDistance] normalize];
	[Collision exchangeEnergyBetween:particle and:axisAlignedHalfPlane along:collisionNormal];
}

@end
