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

+ (BOOL) collisionBetween:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle1 and:(id<IAxisAlignedRectangleCollider>)axisAlignedRectangle2{
	float halfWidth1 = axisAlignedRectangle1.width / 2;
	float halfHeight1 = axisAlignedRectangle1.height / 2;
	
	float halfWidth2 = axisAlignedRectangle2.width / 2;
	float halfHeight2 = axisAlignedRectangle2.height / 2;
	
	float top1 = axisAlignedRectangle1.position.y + halfHeight1;
	float bottom1 = axisAlignedRectangle1.position.y - halfHeight1;
	float left1 = axisAlignedRectangle1.position.x - halfWidth1;
	float right1 = axisAlignedRectangle1.position.x + halfWidth1;
	
	
	float top2 = axisAlignedRectangle2.position.y + halfHeight2;
	float bottom2 = axisAlignedRectangle2.position.y - halfHeight2;
	float left2 = axisAlignedRectangle2.position.x - halfWidth2;
	float right2 = axisAlignedRectangle2.position.x + halfWidth2;
	
	if(bottom1 > top2) return NO;
	if(top1 < bottom2) return NO;
	if(left1 > right2) return NO;
	if(right1 < left2) return NO;
	return YES;
}

@end
