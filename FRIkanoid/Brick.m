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
	}
	return self;
}

@synthesize position;

- (void) dealloc {
	[position release];
	[super dealloc];
}

@end