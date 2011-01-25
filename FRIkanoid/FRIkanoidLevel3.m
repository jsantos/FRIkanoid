//
//  FrikanoidLevel3.m
//  FRIkanoid
//
//  Created by jsantos on 1/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FrikanoidLevel3.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FRIkanoidLevel3

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
	
	for (int i = 0; i < BrickTypes-1; i++) {
		for (int x = 30; x <= self.game.window.clientBounds.width; x+=120) {
			Brick *brick = [[Brick alloc] init];
			brick.brickType = i;
			if (i == 0) {
				brick.power = 3;
			} else if (i == 1) {
				brick.power = 2;
			}
			
			brick.position.x = x;
			brick.position.y = 75 + i * 50;
			[scene addItem:brick];
		}
	}
}

- (void) skipLevel {
	[super reset];
	
	playerPad.position.x = 240;
	playerPad.position.y = 270;
	
	ball.position.x = 	playerPad.position.x = self.game.window.clientBounds.width/2;
	playerPad.position.y = self.game.window.clientBounds.height - 25;
	ball.position.y = 250;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	

	for (int i = 0; i < BrickTypes; i++) {
		for (int x = 30; x <= self.game.window.clientBounds.width; x+=60) {
			Brick *brick = [[Brick alloc] init];
			brick.brickType = i;
			if (i == 0) {
				brick.power = 2;
			}
			brick.position.x = x;
			brick.position.y = 75 + i *25;
			[scene addItem:brick];
		}
	}
}

@end
