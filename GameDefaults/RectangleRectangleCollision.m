//
//  RectangleRectangleCollision.m
//  GameDefaults
//
//  Created by jsantos on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RectangleRectangleCollision.h"
#import "GameDefaults.Physics.h"
#import "GameDefaults.Scene.Objects.h"

@implementation RectangleRectangleCollision

+ (BOOL) collisionBetween:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle2 {
	if ([RectangleRectangleCollision detectCollisionBetween:axisAlignedRectangle1 and:axisAlignedRectangle2]) {
		if ([Collision shouldResolveCollisionBetween:axisAlignedRectangle1 and:axisAlignedRectangle2]) {
			[RectangleRectangleCollision resolveCollisionBetween:axisAlignedRectangle1 and:axisAlignedRectangle2];
			[Collision reportCollisionBetween:axisAlignedRectangle1 and:axisAlignedRectangle2];
			return YES;
		}
	}
	return NO;
}

+ (BOOL) detectCollisionBetween:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle2 {
	float horizontalDistance = fabsf(axisAlignedRectangle1.position.x - axisAlignedRectangle2.position.x);
	float verticalDistance = fabsf(axisAlignedRectangle1.position.y - axisAlignedRectangle2.position.y);
	
	return horizontalDistance < axisAlignedRectangle1.width/2 + axisAlignedRectangle2.width/2 && verticalDistance < axisAlignedRectangle1.height/2 + axisAlignedRectangle2.height/2;	
}

+ (void) resolveCollisionBetween:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id <IAxisAlignedRectangleCollider>)axisAlignedRectangle2 {
	// RELAXATION STEP
	
	// First we relax the collision, so the two objects don't collide any more.
	// We need to calculate by how much to move them apart. We will move them in the shortest direction
	// possible which could be either horizontal or vertical.
	float horizontalDifference = axisAlignedRectangle1.position.x-axisAlignedRectangle2.position.x;
	float horizontalCollidedDistance = fabsf(horizontalDifference);
	float horizontalMinimumDistance = axisAlignedRectangle1.width/2 + axisAlignedRectangle2.width/2;
	float horizontalRelaxDistance = horizontalMinimumDistance - horizontalCollidedDistance;
	
	float verticalDifference = axisAlignedRectangle1.position.y-axisAlignedRectangle2.position.y;
	float verticalCollidedDistance = fabsf(verticalDifference);
	float verticalMinimumDistance = axisAlignedRectangle1.height/2 + axisAlignedRectangle2.height/2;
	float verticalRelaxDistance = verticalMinimumDistance - verticalCollidedDistance;
	
	Vector2 *collisionNormal;
	float relaxDistance;
	
	if (horizontalRelaxDistance < verticalRelaxDistance) {
		relaxDistance = horizontalRelaxDistance;
		collisionNormal = [Vector2 vectorWithX:horizontalDifference < 0 ? 1 : -1 y:0];
	} else {
		relaxDistance = verticalRelaxDistance;
		collisionNormal = [Vector2 vectorWithX:0 y:verticalDifference < 0 ? 1 : -1];
	}
	
	Vector2 *relaxDistanceVector = [Vector2 multiply:collisionNormal by:relaxDistance];
	
	[Collision relaxCollisionBetween:axisAlignedRectangle1 and:axisAlignedRectangle2 by:relaxDistanceVector];
	
	// ENERGY EXCHANGE STEP
	
	// In a collision, energy is exchanged only along the collision normal.
	// For particles this is simply the line between both centers.
	[Collision exchangeEnergyBetween:axisAlignedRectangle1 and:axisAlignedRectangle2 along:collisionNormal];
}


//+ (BOOL) collisionBetween:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle2{
//	float halfWidth1 = axisAlignedRectangle1.width / 2;
//	float halfHeight1 = axisAlignedRectangle1.height / 2;
//	
//	float halfWidth2 = axisAlignedRectangle2.width / 2;
//	float halfHeight2 = axisAlignedRectangle2.height / 2;
//	
//	float top1 = axisAlignedRectangle1.position.y + halfHeight1;
//	float bottom1 = axisAlignedRectangle1.position.y - halfHeight1;
//	float left1 = axisAlignedRectangle1.position.x - halfWidth1;
//	float right1 = axisAlignedRectangle1.position.x + halfWidth1;
//	
//	
//	float top2 = axisAlignedRectangle2.position.y + halfHeight2;
//	float bottom2 = axisAlignedRectangle2.position.y - halfHeight2;
//	float left2 = axisAlignedRectangle2.position.x - halfWidth2;
//	float right2 = axisAlignedRectangle2.position.x + halfWidth2;
//	
//	if(bottom1 > top2) return NO;
//	if(top1 < bottom2) return NO;
//	if(left1 > right2) return NO;
//	if(right1 < left2) return NO;
//	return YES;
//}

@end
