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
		radius = 20;
	}
	return self;
}

@synthesize position, velocity, mass, radius;

- (void) dealloc {
	[position release];
	[velocity release];
	[super dealloc];
}

@end
