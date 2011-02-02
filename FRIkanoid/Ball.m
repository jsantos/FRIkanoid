//
//  Ball.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Ball

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		mass = 1;
		radius = 8;
		coefficientOfRestitution = 1;
	}
	return self;
}

- (BOOL) collidingWithItem:(id)item {
	// Don't collide with balls.
	if ([item isKindOfClass:[Ball class]]) {
		return NO;
	}
	return YES;
}

- (void) collidedWithItem:(id)item {
	float minY = 100;
	if (fabsf(velocity.y) < minY) {
		float speed = [velocity length];
		float x = sqrtf(speed * speed - minY * minY);
		velocity.y = velocity.y < 0 ? -minY : minY;
		velocity.x = velocity.x < 0 ? -x : x;
	}
	
	if ([item isKindOfClass:[Pad class]]) {
		[SoundEngine play:SoundEffectTypeBallPad];
		
	} else if ([item isKindOfClass:[Boundary class]]) {
		Boundary *tmp = (Boundary*)item;
		if (!tmp.deadly) {
			[SoundEngine play:SoundEffectTypeBallLimit];
		}
	} else if ([item isKindOfClass:[Brick class]]) {
		[SoundEngine play:SoundEffectTypeBallBrick];
	} 
}


@synthesize position, velocity, mass, radius, coefficientOfRestitution;

- (void) dealloc {
	[position release];
	[velocity release];
	[super dealloc];
}

@end
