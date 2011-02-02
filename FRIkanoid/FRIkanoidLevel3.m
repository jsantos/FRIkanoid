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
	
	
	int lowBound = 15, highBound = self.game.window.clientBounds.width+25;
	int count = 0, type = 0;
	while(count < 6) {
		for (int x = lowBound; x <= highBound; x+=46) {
			Brick *brick = [[Brick alloc] init];
			brick.brickType = type;
			
			if (count == 0) {
				brick.power = 6;
			} else if (count == 1) {
				brick.power = 5;
			} else if (count == 2) {
				brick.power = 4;
			} else if (count == 3) {
				brick.power = 3;
			} else if (count == 4) {
				brick.power = 2;
			}
						
			brick.position.x = x;
			brick.position.y = 75 + count * 20;
			[scene addItem:brick];
		}
		lowBound+=46;
		highBound-=46;
		count++;
		type++;
	}
}

@end
