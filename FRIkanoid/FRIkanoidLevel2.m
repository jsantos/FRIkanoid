//
//  FRIkanoidLevel2.m
//  FRIkanoid
//
//  Created by jsantos on 12/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoidLevel2.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FRIkanoidLevel2


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
	if (self.game.window.clientBounds.width == 1024) {
		playerPad.position.y = self.game.window.clientBounds.height - 50;
	} else {
		playerPad.position.y = self.game.window.clientBounds.height - 25;
	}
	
	ball.position.x = playerPad.position.x;
	ball.position.y = playerPad.position.y - playerPad.height / 2;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	
	for (int i = 0; i < BrickTypes; i++) {
		for (int x = 15; x <= self.game.window.clientBounds.width+25; x+=[Constants getInstance].distanceBetweenBricks) {
			Brick *brick = [[[Brick alloc] initWithGame:self.game] autorelease];
			brick.brickType = i;
			if (i == 0) {
				brick.power = 2;
			}
			brick.position.x = x;
			brick.position.y = 75 + i * 80; // iPhone 40 / iPad 80
			[scene addItem:brick];
		}
	}
	
	//	double initX = 30, initY=72;
	//	int type = 0;
	//	for (id item in bricks) {
	//		Brick *temp = [item isKindOfClass:[Brick class]] ? item : nil;
	//		temp.position.x = initX;
	//		temp.position.y = initY;
	//		temp.brickType = type;
	//			
	//		if (initX > self.game.window.clientBounds.width-50) {
	//			initX = 30;
	//			initY+=26;
	//			type++;
	//		} else {
	//			initX+=60;
	//		}
	//	}
	//	
	//	for (int i = 1; i < PowerUpTypes+1; i++) { // Randomize power-ups through the bricks
	//		Brick *temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];
	//		if ([bricks count] > 4) {
	//			while (temp.powerUpType > 0) {
	//				temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];	
	//			}
	//			temp.powerUpType = i;
	//		} else {
	//			temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];	
	//			temp.powerUpType = i;
	//		}
	//	}
}



@end
