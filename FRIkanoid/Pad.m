//
//  Pad.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Pad.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Pad

- (id) initWithGame:(Game*)theGame {
	self = [super init];
	if (self != nil) {
		position = [[Vector2 alloc] init];
		if (theGame.window.clientBounds.width == 1024) {
			width = 180;
			height = 32;
		}
		else {
			width = 110;
			height = 19.5;
		}

		currentGame = theGame;		
		powerUps = [[NSMutableArray alloc] init];
	}
	return self;
}

@synthesize position, width, height, scene, currentGame;

- (void) addPowerUp:(PowerUp *)powerUp {
	[SoundEngine play:SoundEffectTypePowerUpCatched];
	[powerUps addObject:powerUp];
	[powerUp activateWithParent:self];
}

- (void) removeAllPowerUps {
	for(PowerUp *powerUp in powerUps){
		[powerUp deactivate];
	}
	[powerUps removeAllObjects];
}

- (BOOL) collidingWithItem:(id)item {
	if ([item isKindOfClass:[PowerUp class]]) {
		[self addPowerUp:item];
		[scene removeItem:item];
		return NO;
	}
	return YES;
}

- (void) collidedWithItem:(id)item {
	//Calculate horizontal velocity depending on where the paddle was hit.
	Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
	if (ball) {
		float speed = [ball.velocity length] * [Constants getInstance].ballSpeedUp;
		
		//Calculate where on the paddle we were hit, from -1 to 1;
		float hitPosition = (ball.position.x - position.x) / width * 2;
		
		//Calculate Angle;
		float angle = hitPosition * [Constants getInstance].maximumBallAngle;		
		//Rebound ball in desired direction
		ball.velocity.x = sinf(angle);
		ball.velocity.y = -cosf(angle);
		[ball.velocity multiplyBy:speed];
		
		//Make sure the vertical velocity is big enough after collision.
		int minY = [Constants getInstance].minimumBallVerticalVelocity;
		if (fabsf(ball.velocity.y) < minY) {
			ball.velocity.y = ball.velocity.y < 0 ? -minY : minY;
		}
	}
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	for(PowerUp *powerUp in powerUps){
		[powerUp updateWithGameTime:gameTime];
	}
}

- (void) dealloc {
	[powerUps release];
	[position release];
	[scene release];
	[super dealloc];
}

@end
