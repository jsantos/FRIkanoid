//
//  RectangleAAHalfPlaneCollision.m
//  GameDefaults
//
//  Created by jsantos on 11/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RectangleAAHalfPlaneCollision.h"
#import "GameDefaults.Math.h"
#import "GameDefaults.Physics.h"
#import "GameDefaults.Scene.Objects.h";

@implementation RectangleAAHalfPlaneCollision

+ (BOOL) collisionBetween:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle and:(id <IAxisAlignedHalfPlaneCollider>)axisAlignedHalfPlane {
	if ([RectangleAAHalfPlaneCollision detectCollisionBetween:axisAlignedRectangle and:axisAlignedHalfPlane]) {
		if ([Collision shouldResolveCollisionBetween:axisAlignedRectangle and:axisAlignedHalfPlane]) {
				[RectangleAAHalfPlaneCollision resolveCollisionBetween:axisAlignedRectangle and:axisAlignedHalfPlane];
			[Collision reportCollisionBetween:axisAlignedRectangle and:axisAlignedHalfPlane];
			return YES;
		}
	}
	return NO;
}

+ (BOOL) detectCollisionBetween:(id <IAxisAlignedRectangleCollider>)aaRectangle and:(id <IAxisAlignedHalfPlaneCollider>)aaHalfPlane {
	switch (aaHalfPlane.axisAlignedHalfPlane.direction) {
		default:
		case AxisDirectionPositiveX:
			return aaRectangle.position.x - aaRectangle.width/2 < aaHalfPlane.axisAlignedHalfPlane.distance;
		case AxisDirectionNegativeX:
			return aaRectangle.position.x + aaRectangle.width/2 > -aaHalfPlane.axisAlignedHalfPlane.distance;
		case AxisDirectionPositiveY:
			return aaRectangle.position.y - aaRectangle.height/2 < aaHalfPlane.axisAlignedHalfPlane.distance;
		case AxisDirectionNegativeY:
			return aaRectangle.position.y + aaRectangle.height/2 > aaHalfPlane.axisAlignedHalfPlane.distance;
	}
}

+ (void) resolveCollisionBetween:(id <IAxisAlignedRectangleCollider>)aaRectangle and:(id <IAxisAlignedHalfPlaneCollider>)aaHalfPlane {
	// RELAXATION STEP
	
	// First we relax the collision, so the two objects don't collide any more.

	Vector2 *relaxDistance = nil;
	switch (aaHalfPlane.axisAlignedHalfPlane.direction) {
		case AxisDirectionPositiveX:
			relaxDistance = [Vector2 vectorWithX:aaRectangle.position.x - aaRectangle.width/2 - aaHalfPlane.axisAlignedHalfPlane.distance y:0];
			break;
		case AxisDirectionNegativeX:
			relaxDistance = [Vector2 vectorWithX:aaRectangle.position.x + aaRectangle.width/2 + aaHalfPlane.axisAlignedHalfPlane.distance y:0];
			break;
		case AxisDirectionPositiveY:
			relaxDistance = [Vector2 vectorWithX:0 y:aaRectangle.position.y - aaRectangle.height/2 - aaHalfPlane.axisAlignedHalfPlane.distance];
			break;
		case AxisDirectionNegativeY:
			relaxDistance = [Vector2 vectorWithX:0 y:aaRectangle.position.y + aaRectangle.height/2 + aaHalfPlane.axisAlignedHalfPlane.distance];
			break;
	}
	
	[Collision relaxCollisionBetween:aaRectangle and:aaHalfPlane by:relaxDistance];

	// ENERGY EXCHANGE STEP
	
	// In a collision, energy is exchanged only along the collision normal.
	// For particles this is simply the line between both centers.
	Vector2 *collisionNormal = [[Vector2 vectorWithVector:relaxDistance] normalize];
	[Collision exchangeEnergyBetween:aaRectangle and:aaHalfPlane along:collisionNormal];
	
}

@end