//
//  Brick.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Brick.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Brick

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		width = 60;
		height = 25;
	}
	return self;
}

@synthesize position, width, height, brickType, powerUpType, scene;

- (BOOL) collidingWithItem:(id)item {
	return YES;
}

- (void) collidedWithItem:(id)item {
	//Make sure the vertical velocity is big enough after collision,
	//so we don't have to endlessly wait for the ball to come down.
	if ([item isKindOfClass:[Ball class]]) {
		Ball * ball = (Ball*) item;
		float minY = 100;
		if (fabsf(ball.velocity.y) < minY) {
			ball.velocity.y = ball.velocity.y < 0 ? -minY : minY;
		}
	}
}

- (void) dealloc {
	[position release];
	[super dealloc];
}

@end