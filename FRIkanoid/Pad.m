//
//  Pad.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pad.h"

@implementation Pad

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		mass = 20;
		radius = 30;
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
