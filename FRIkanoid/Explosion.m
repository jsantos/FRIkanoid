//
//  Explosion.m
//  FRIkanoid
//
//  Created by jsantos on 11/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Explosion.h"
#import "GameDefaults.Scene.Objects.h"
#import "Chomponthis.FRIkanoid.classes.h"
#import "Random.h"

@implementation Explosion

- (id) initWithGameTime:(GameTime *)gameTime {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		lifetime = [[Lifetime alloc] initWithStart:gameTime.totalGameTime duration:0.5];
		random = [Random int];
	}
	return self;
}

@synthesize position, lifetime, random;

- (void) dealloc
{
	[lifetime release];
	[position release];
	[super dealloc];
}

@end
