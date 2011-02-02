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
	ball = [[Ball alloc] init];
	
	ball.position.x = 240;
	ball.position.y = 200;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	
	[self resetPad];
	[scene addItem:ball];
}

- (void) reset {
	[super reset];

	//Initialize object Positions
	playerPad.position.x = self.game.window.clientBounds.width/2;
	playerPad.position.y = self.game.window.clientBounds.height - 25;
	
	ball.position.x = playerPad.position.x;
	ball.position.y = playerPad.position.y - playerPad.height / 2;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	
	for (int i = 0; i < BrickTypes/2; i++) {
		for (int x = 15; x < self.game.window.clientBounds.width+25; x+=46) {
			Brick *brick = [[Brick alloc] init];
			brick.brickType = i;
			if (i == -1) {
				brick.power = 2;
			}
			brick.position.x = x;
			brick.position.y = 75 + i *20;
			[scene addItem:brick];
		}
	}
}

@end
