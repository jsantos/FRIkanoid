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
	Ball *ball = [balls objectAtIndex:0];
	
	ball.position.x = 240;
	ball.position.y = 200;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
} 

- (void) reset {
	[super reset];
	numBricks = 32;
	
	for (int i=0; i<numBricks; i++) {
		Brick *lol = [[Brick alloc] init];
		[bricks addObject:lol];
		[lol release];
	}
	
	for (id<NSObject> brick in bricks){
		[scene addItem:brick];
	}
	
	Ball *ball = [balls objectAtIndex:0];
	//Initialize object Positions
	ball.position.x = 240;
	ball.position.y = 250;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	
	playerPad.position.x = 240;
	playerPad.position.y = 270;
	
	double initX = 30, initY=72;
	int type = 0;
	for (id item in bricks) {
		Brick *temp = [item isKindOfClass:[Brick class]] ? item : nil;
		temp.position.x = initX;
		temp.position.y = initY;
		temp.brickType = type;
		
		if (initX > 410) {
			initX = 30;
			initY+=26;
			type++;
		} else {
			initX+=60;
		}
	}
	
	for (int i = 1; i < PowerUpTypes+1; i++) { // Randomize power-ups through the bricks
		Brick *temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];
		if ([bricks count] > 4) {
			while (temp.powerUpType > 0) {
				temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];	
			}
			temp.powerUpType = i;
		} else {
			temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];	
			temp.powerUpType = i;
		}
		
		
	}
	
}

@end
