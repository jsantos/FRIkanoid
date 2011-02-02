//
//  Brick.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Brick.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Brick

- (id) init {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		width = 50;
		height = 20;
		power = 1;
	}
	return self;
}

@synthesize position, width, height, brickType, powerUpType, scene, power;

- (BOOL) collidingWithItem:(id)item {
	if (![item isKindOfClass:[Ball class]]) {
		return NO;
	}
	
	power--;
	if (power == 0) {
		[scene removeItem:self];
		//Handle power-up creation here
		if ([Random float] < 0.2f) {
			Explosion *explosion = [[[Explosion alloc] initWithGameTime:0] autorelease];
			[explosion.position set:position];
	
			[SoundEngine play:SoundEffectTypeBallBrickWithBonus];
			PowerUp *powerUp = [PowerUpFactory createRandomPowerUp];
			[powerUp.position set:position];
			powerUp.velocity.y = 75;
			[scene addItem:explosion];
			[scene addItem:powerUp];
		}
	}
	return YES;
}

- (void) dealloc {
	[scene release];
	[position release];
	[super dealloc];
}

@end