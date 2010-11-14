//
//  HalfPlane.m
//  GameDefaults
//
//  Created by jsantos on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HalfPlane.h"


@implementation HalfPlane

- (id) initWithNormal:(Vector2 *)theNormal distance:(float)theDistance {
	if ([super init]) {
		self.normal = theNormal;
		self.distance = theDistance;
	}
	return self;
}

+ (HalfPlane*) halfPlaneWithNormal:(Vector2 *)theNormal distance:(float)theDistance {
	return [[[HalfPlane alloc] initWithNormal:theNormal distance:theDistance] autorelease];
}

@synthesize distance, normal;

- (void) setNormal:(Vector2 *)value {
	[normal release];
	normal = [value retain];
	if ([normal lengthSquared] != 1) {
		[normal normalize];
	}
}

- (void) dealloc {
	[normal release];
	[super dealloc];
}


@end
