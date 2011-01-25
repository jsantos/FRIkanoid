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
	playerPad.position.y = self.game.window.clientBounds.height - 25;
	
	ball.position.x = playerPad.position.x;
	ball.position.y = playerPad.position.y - playerPad.height / 2;
	
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

- (void) skipLevel {
	[super reset];
	
	//	for (int i=0; i<32; i++) {
	//		Brick *lol = [[Brick alloc] init];
	//		[bricks addObject:lol];
	//		[lol release];
	//	}
	//	
	//	for (id<NSObject> brick in bricks){
	//		[scene addItem:brick];
	//	}
	
	//ball = [[Ball alloc] init];
	//Initialize object Positions
	playerPad.position.x = 240;
	playerPad.position.y = 270;
	
	ball.position.x = 	playerPad.position.x = self.game.window.clientBounds.width/2;
	playerPad.position.y = self.game.window.clientBounds.height - 25;
	ball.position.y = 250;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	
	//	double initX = 30, initY=72;
	//	int type = 0;
	//	for (id item in bricks) {
	//		Brick *temp = [item isKindOfClass:[Brick class]] ? item : nil;
	//		temp.position.x = initX;
	//		temp.position.y = initY;
	//		temp.brickType = type;
	//		
	//		if (initX > 410) {
	//			initX = 30;
	//			initY+=26;
	//			type++;
	//		} else {
	//			initX+=60;
	//		}
	//	}
	
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
	//		
	//		
	//	}
	
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
