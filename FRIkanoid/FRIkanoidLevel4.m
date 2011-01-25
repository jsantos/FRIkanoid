//
//  FRIkanoidLevel4.m
//  FRIkanoid
//
//  Created by jsantos on 1/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoidLevel4.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FRIkanoidLevel4

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
	
	for (int i = BrickTypes-1; i >= 0; i--) {
		for (int x = 30; x <= self.game.window.clientBounds.width; x+=90) {
			Brick *brick = [[Brick alloc] init];
			brick.brickType = i;
			if ((BrickTypes-i) == 0) {
				brick.power = 4;
			} else if ((BrickTypes-i) == 1) {
				brick.power = 3;
			} else if ((BrickTypes-i) == 2) {
				brick.power = 2;
			}
			
			brick.position.x = x;
			brick.position.y = 75 + (BrickTypes-i) * 25;
			[scene addItem:brick];
		}
	}
}
@end
