//
//  Boundary.m
//  FRIkanoid
//
//  Created by jsantos on 11/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Boundary.h"


@implementation Boundary

- (id) initWithLimit:(AxisAlignedHalfPlane *)theBoundary {
	self = [super init];
	if (self != nil) {
		boundary = [theBoundary retain];
	}
	return self;
}

- (AxisAlignedHalfPlane *) axisAlignedHalfPlane {
	return boundary;
}

- (HalfPlane *) halfPlane {
	return boundary;
}

- (void) dealloc {
	[boundary release];
	[super dealloc];
}

@end
