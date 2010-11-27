//
//  PowerUp.m
//  FRIkanoid
//
//  Created by jsantos on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PowerUp.h"


@implementation PowerUp

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		width = 30.55;
		height = 12.35;
	}
	return self;
}

@synthesize position, velocity, width, height, type;

- (void) dealloc {
	[position release];
	[velocity release];
	[super dealloc];
}

@end
