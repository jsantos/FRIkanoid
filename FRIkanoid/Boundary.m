//
//  Boundary.m
//  FRIkanoid
//
//  Created by jsantos on 11/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Boundary.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Boundary

- (id) initWithLimit:(AxisAlignedHalfPlane *)theBoundary isDeadly:(BOOL)isDeadly{
	self = [super init];
	if (self != nil) {
		boundary = [theBoundary retain];
		deadly = isDeadly;
	}
	return self;
}

@synthesize scene, deadly;

- (AxisAlignedHalfPlane *) axisAlignedHalfPlane {
	return boundary;
}

- (HalfPlane *) halfPlane {
	return boundary;
}

- (void) collidedWithItem:(id)item {
	if (deadly) {
		[scene removeItem:item];
	}
}

- (void) dealloc {
	[scene release];
	[boundary release];
	[super dealloc];
}

@end
