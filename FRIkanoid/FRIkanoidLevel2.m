//
//  FrikanoidLevel2.m
//  FRIkanoid
//
//  Created by jsantos on 11/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FrikanoidLevel2.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FRIkanoidLevel2
- (void) resetAfterMiss {
	// To render the level after the ball goes out of the screen, without major changes
	//Initialize object Positions
	ball.position.x = 240;
	ball.position.y = 200;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = 70;
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
	
	//Initialize object Positions
	ball.position.x = 240;
	ball.position.y = 280;
	
	ball.velocity.y = -200; //Ball Initial Velocity
	ball.velocity.x = ([Random float] - 0.5f) * 10;
	
	playerPad.position.x = 240;
	playerPad.position.y = 335;
	
	double initX = 16, initY=72;
	int type = 0;
	for (id item in bricks) {
		Brick *temp = [item isKindOfClass:[Brick class]] ? item : nil;
		temp.position.x = initX;
		temp.position.y = initY;
		temp.brickType = type;
		
		if (initX > 380) {
			initX = 16;
			initY+=26;
			type++;
		} else {
			initX+=60;
		}
	}
	
	for (int i = 1; i < PowerUpTypes+1; i++) {
		Brick *temp = [bricks objectAtIndex:[Random intLessThan:[bricks count]]];
		temp.powerUpType = i;
	}
}

@end
