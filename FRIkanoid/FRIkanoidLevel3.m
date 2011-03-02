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
		int lowBound = 0, highBound = self.game.window.clientBounds.width+50;
		int count = 0, type = 0;
		while(count < 6) {
			for (int x = lowBound; x <= highBound; x+=94) {
				Brick *brick = [[[Brick alloc] initWithGame:self.game gameplay:currentGameplay] autorelease];
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
				brick.position.y = 125 + count * 40; // iPhone 20 / iPad 40
				[scene addItem:brick];
			}
			lowBound+=94;
			highBound-=94;
			count++;
			type++;
		}
	} else {
		int lowBound = 10, highBound = self.game.window.clientBounds.width+25;
		int count = 0, type = 0;
		while(count < 6) {
			for (int x = lowBound; x <= highBound; x+=46) {
				Brick *brick = [[[Brick alloc] initWithGame:self.game gameplay:currentGameplay] autorelease];
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
				brick.position.y = 75 + count * 20; // iPhone 20 / iPad 40
				[scene addItem:brick];
			}
			lowBound+=46;
			highBound-=46;
			count++;
			type++;
		}
	}
}

@end
