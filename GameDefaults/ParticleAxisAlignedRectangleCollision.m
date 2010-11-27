//
//  ParticleAxisAlignedRectangleCollisions.m
//  GameDefaults
//
//  Created by jsantos on 11/18/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParticleAxisAlignedRectangleCollision.h"
#import "GameDefaults.Physics.h"
#import "GameDefaults.Scene.Objects.h"

@interface ParticleAxisAlignedRectangleCollision ()

+ (Vector2*) calculateRelaxDistanceBetween:(id<IParticleColider>)particle and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle;

@end

@implementation ParticleAxisAlignedRectangleCollision

+ (BOOL) collisionBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle {
	if ([ParticleAxisAlignedRectangleCollision detectCollisionBetween:particle and:axisAlignedRectangle]) {
		if ([Collision shouldResolveCollisionBetween:particle and:axisAlignedRectangle]) {
			[ParticleAxisAlignedRectangleCollision resolveCollisionBetween:particle and:axisAlignedRectangle];
			[Collision reportCollisionBetween:particle and:axisAlignedRectangle];
		}
		return YES;
	}
	return NO;
}

+ (BOOL) detectCollisionBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle {
	Vector2 *relaxDistance = [ParticleAxisAlignedRectangleCollision calculateRelaxDistanceBetween:particle and:axisAlignedRectangle];
	return [relaxDistance lengthSquared] > 0;
}

+ (void)  resolveCollisionBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle {
	Vector2 *relaxDistance = [ParticleAxisAlignedRectangleCollision calculateRelaxDistanceBetween:particle and:axisAlignedRectangle];
	[Collision relaxCollisionBetween:particle and:axisAlignedRectangle by:relaxDistance];
	
	Vector2 *collisionNormal = [[Vector2 vectorWithVector: relaxDistance] normalize];
	[Collision exchangeEnergyBetween:particle and:axisAlignedRectangle along:collisionNormal];
}

+ (Vector2*) calculateRelaxDistanceBetween:(id <IParticleColider>)particle and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle {
	Vector2 *relaxDistance = [Vector2 zero];
	Vector2 * nearestVertex = [Vector2 vectorWithVector:axisAlignedRectangle.position];
	
	float halfWidth = axisAlignedRectangle.width / 2;
	float halfHeight = axisAlignedRectangle.height / 2;
	
	//Calculate overlap with all sides.
	float leftDifference = (axisAlignedRectangle.position.x - halfWidth) - (particle.position.x + particle.radius);
	if (leftDifference > 0) {
		return relaxDistance;
	}
	
	float rightDifference = (particle.position.x - particle.radius) - (axisAlignedRectangle.position.x + halfWidth);
	if (rightDifference > 0) {
		return relaxDistance;
	}
	
	float topDifference = (axisAlignedRectangle.position.y - halfHeight) - (particle.position.y + particle.radius);
	if (topDifference > 0) {
		return relaxDistance;
	}
	
	float bottomDifference = (particle.position.y - particle.radius) - (axisAlignedRectangle.position.y + halfHeight);
	if (bottomDifference > 0) {
		return relaxDistance;
	}
	
	//Particle is under all sieges.
	//Find the nearest vertex.
	
	BOOL horizontalyInside = NO;
	BOOL verticalyInside = NO;
	
	if (particle.position.x < axisAlignedRectangle.position.x - halfWidth) {
		nearestVertex.x -= halfWidth;
	} else if (particle.position.x > axisAlignedRectangle.position.x + halfWidth) {
		nearestVertex.x += halfWidth;
	} else {
		horizontalyInside = YES;
	}
	
	if (particle.position.y < axisAlignedRectangle.position.y - halfHeight) {
		nearestVertex.y -= halfHeight;
	} else if (particle.position.y > axisAlignedRectangle.position.y + halfHeight) {
		nearestVertex.y += halfHeight;
	} else {
		verticalyInside = YES;
	}
	
	if (!horizontalyInside && !verticalyInside) {
		//We have a possible collision with an edge vertex.
		Vector2 *particleVertex = [Vector2 subtract:nearestVertex by:particle.position];
		float vertexDistance = [particleVertex length];
		
		if (vertexDistance > particle.radius) {
			return relaxDistance;
		} else {
			return [[particleVertex normalize] multiplyBy:particle.radius - vertexDistance]; 
		}
	}
	
	//Find the smallest difference per axis.
	if (leftDifference > rightDifference) {
		relaxDistance.x = -leftDifference;
	} else {
		relaxDistance.x = rightDifference;
	}
	
	if (topDifference > bottomDifference) {
		relaxDistance.y = -topDifference;
	} else {
		relaxDistance.y = bottomDifference;
	}
	
	//Find the smallest difference between axises:
	if (fabs(relaxDistance.x) < fabs(relaxDistance.y)) {
		relaxDistance.y = 0;
	} else {
		relaxDistance.x = 0;
	}
	
	return relaxDistance;
}	


@end
