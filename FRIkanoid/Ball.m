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
		radius = 12;
		coefficientOfRestitution = 1;
	}
	return self;
}

- (void) collidedWithItem:(id)item {
	if ([item isKindOfClass:[Pad class]]) {
		[SoundEngine play:SoundEffectTypeBallPad];
		
	} else if ([item isKindOfClass:[Boundary class]]) {
		[SoundEngine play:SoundEffectTypeBallLimit];
	} else if ([item isKindOfClass:[Brick class]]) {
		Brick *brick = (Brick*) item;
		if (brick.powerUpType != 0) {
			[SoundEngine play:SoundEffectTypeBallBrickWithBonus];
		}else {
			[SoundEngine play:SoundEffectTypeBallBrick];
		}
	} 
}


@synthesize position, velocity, mass, radius, coefficientOfRestitution;

- (void) dealloc {
	[position release];
	[velocity release];
	[super dealloc];
}

@end
