//
//  FRIkanoidLevel.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoidLevel1.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FRIkanoidLevel1

- (void) resetAfterMiss {
	// To render the level after the ball goes out of the screen, without major changes
	//Initialize object Positions
//	ball = [[Ball alloc] init];
//	
//	ball.position.x = 240;
//	ball.position.y = 200;
//	
//	ball.velocity.y = -200; //Ball Initial Velocity
//	ball.velocity.x = ([Random float] - 0.5f) * 10;
	[self addBallWithSpeed:[Constants getInstance].initialBallSpeed];
	
	[self resetPad];
//	[scene addItem:ball];
}

- (void) reset {
	[super reset];

	//Initialize object Positions
	playerPad.position.x = self.game.window.clientBounds.width/2;
	if (self.game.window.clientBounds.width == 1024) {
		playerPad.position.y = self.game.window.clientBounds.height - 50;
	} else {
		playerPad.position.y = self.game.window.clientBounds.height - 25;
	}

	

	[self addBallWithSpeed:[Constants getInstance].initialBallSpeed];
	
	for (int i = 0; i < BrickTypes/2; i++) {
		for (int x = 15; x < self.game.window.clientBounds.width+25; x+=[Constants getInstance].distanceBetweenBricks) {
			Brick *brick = [[[Brick alloc] initWithGame:self.game] autorelease];
			brick.brickType = i;
			if (i == -1) {
				brick.power = 2;
			}
			brick.position.x = x;
			brick.position.y = 75 + i *40; //20 on iPhone, 40 on iPad
			[scene addItem:brick];
		}
	}
}

@end
