//
//  Brick.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Brick.h"


@implementation Brick

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		mass = 10;
		radius = 10;
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