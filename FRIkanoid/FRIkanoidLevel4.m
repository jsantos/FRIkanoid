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

- (void) reset {
	[super reset];
	
	//Initialize object Positions
	playerPad.position.x = self.game.window.clientBounds.width/2;
	
	if (self.game.window.clientBounds.width == 1024) {
		playerPad.position.y = self.game.window.clientBounds.height - 100;
	} else {
		playerPad.position.y = self.game.window.clientBounds.height - 25;
	}
	
	if (self.game.window.clientBounds.width == 1024) {
		[self addBallWithSpeed:500];
	} else {
		[self addBallWithSpeed:200];
	}
	
	if (self.game.window.clientBounds.width == 1024) {
		for (int i = BrickTypes-1; i >= 0; i--) {
			for (int x = 15; x <= self.game.window.clientBounds.width+25; x+=160) {
				Brick *brick = [[[Brick alloc] initWithGame:self.game gameplay:currentGameplay] autorelease];
				brick.brickType = i;
				if ((BrickTypes-i) == 0) {
					brick.power = 4;
				} else if ((BrickTypes-i) == 1) {
					brick.power = 3;
				} else if ((BrickTypes-i) == 2) {
					brick.power = 2;
				}
				
				brick.position.x = x;
				brick.position.y = 125 + (BrickTypes-i) * 40; //iPhone 20 / iPad 40
				[scene addItem:brick];
			}
		}
	} else {
		for (int i = BrickTypes-1; i >= 0; i--) {
			for (int x = 35; x <= self.game.window.clientBounds.width+15; x+=80) {
				Brick *brick = [[[Brick alloc] initWithGame:self.game gameplay:currentGameplay] autorelease];
				brick.brickType = i;
				if ((BrickTypes-i) == 0) {
					brick.power = 4;
				} else if ((BrickTypes-i) == 1) {
					brick.power = 3;
				} else if ((BrickTypes-i) == 2) {
					brick.power = 2;
				}
				
				brick.position.x = x;
				brick.position.y = 75 + (BrickTypes-i) * 20; //iPhone 20 / iPad 40
				[scene addItem:brick];
			}
		}
	}

}
@end
