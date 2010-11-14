//
//  AxisAlignedHalfPlane.m
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AxisAlignedHalfPlane.h"


@implementation AxisAlignedHalfPlane

- (id) initWithDirection:(AxisDirection)theDirection distance:(float)theDistance {
	Vector2 *theNormal;
	switch (theDirection) {
		default:	
		case AxisDirectionPositiveX:
			theNormal = [Vector2 unitX];
			break;
		case AxisDirectionNegativeX:
			theNormal = [[Vector2 unitX] negate];
			break;
		case AxisDirectionPositiveY:
			theNormal = [Vector2 unitY];
			break;
		case AxisDirectionNegativeY:
			theNormal = [[Vector2 unitY] negate];
			break;
	}
	
	self = [super initWithNormal:theNormal distance:theDistance];
	if (self != nil) {
		direction = theDirection;
	}
	return self;
}

+ (AxisAlignedHalfPlane*) axisAlignedHalfPlaneWithDirection:(AxisDirection)theDirection distance:(float)theDistance {
	return [[[AxisAlignedHalfPlane alloc] initWithDirection:theDirection distance:theDistance] autorelease];
}

@synthesize direction;

- (void) setDirection:(AxisDirection)value {
	switch (value) {
		default:	
		case AxisDirectionPositiveX:
			normal = [Vector2 unitX];
			break;
		case AxisDirectionNegativeX:
			normal = [[Vector2 unitX] negate];
			break;
		case AxisDirectionPositiveY:
			normal = [Vector2 unitY];
			break;
		case AxisDirectionNegativeY:
			normal = [[Vector2 unitY] negate];
			break;
	}
}

- (void) setNormal:(Vector2 *)value {
	if (value.x == 0 && value.y == 0 ||
		value.x != 0 && value.y != 0)  {
		[NSException raise:@"InvalidArgumentException" format:@"Axis Aligned Half Plane requires an axis aligned normal"];
	}
	
	[super setNormal:value];
	
	if (value.x > 0) {
		direction = AxisDirectionPositiveX;
	} else if (value.x < 0) {
		direction = AxisDirectionNegativeX;
	} else if (value.y > 0) {
		direction = AxisDirectionPositiveY;
	} else if (value.y < 0) {
		direction = AxisDirectionNegativeY;
	}
}

@end
