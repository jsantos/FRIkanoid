//
//  PowerUp.m
//  FRIkanoid
//
//  Created by jsantos on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PowerUp.h"
#import "Chomponthis.FRIkanoid.h"

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

- (id) initWithType:(PowerUpType)theType {
	return [self initWithType:theType duration:0];
}

- (id) initWithType:(PowerUpType)theType duration:(NSTimeInterval)theDuration {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		velocity = [[Vector2 alloc] init];
		width = 30.55;
		height = 12.35;
		type = theType;
		duration = theDuration;
	}
	return self;
}

@synthesize position, velocity, width, height, type, scene, lifetime;

- (BOOL) collidingWithItem:(id)item {
	return [item isKindOfClass:[Pad class]];
}

- (void) activateWithParent:(Pad *)theParent {
	active = YES;
	parent = [theParent retain];
	if (duration) {
		lifetime = [[Lifetime alloc] initWithStart:0 duration:duration];
	}
}

- (void) deactivate {
	active = NO;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	if (lifetime) {
		[lifetime updateWithGameTime:gameTime];
		if (!lifetime.isAlive) {
			[lifetime release];
			lifetime = nil;
			[self deactivate];
		}
	}
}

- (void) dealloc {
	[scene release];
	[lifetime release];
	[parent release];
	[position release];
	[velocity release];
	[super dealloc];
}

@end
