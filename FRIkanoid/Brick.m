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

- (id) initWithGame:(Game*)theGame {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		currentGame = theGame;
		if (theGame.window.clientBounds.width == 1024) {
			width = 100; // iPhone 50 / iPad 100
			height = 40; // iPhone 20 / iPad 40
		} else {
			width = 50; // iPhone 50 / iPad 100
			height = 20; // iPhone 20 / iPad 40
		}
		power = 1;
	}
	return self;
}

@synthesize position, width, height, brickType, powerUpType, scene, power, currentGame;

- (BOOL) collidingWithItem:(id)item {
	if (![item isKindOfClass:[Ball class]]) {
		return NO;
	}
	
	power--;
	if (power == 0) {
		[scene removeItem:self];
		//Handle power-up creation here
		if ([Random float] < [Constants getInstance].powerUpChance) {
			Explosion *explosion = [[[Explosion alloc] initWithGameTime:0] autorelease];
			[explosion.position set:position];
			PowerUp *powerUp = [PowerUpFactory createRandomPowerUp];
			[powerUp.position set:position];
			powerUp.velocity.y = [Constants getInstance].powerUpSpeed;
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