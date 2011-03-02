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
		for (int i = 0; i < BrickTypes/2; i++) {
			for (int x = 40; x < self.game.window.clientBounds.width+25; x+=94) {
				Brick *brick = [[[Brick alloc] initWithGame:self.game gameplay:currentGameplay] autorelease];
				brick.brickType = i;
				if (i == -1) {
					brick.power = 2;
				}
				brick.position.x = x;
				brick.position.y = 125 + i *40; //20 on iPhone, 40 on iPad
				[scene addItem:brick];
			}
		}
	} else {
		for (int i = 0; i < BrickTypes/2; i++) {
			for (int x = 15; x < self.game.window.clientBounds.width+25; x+=46) {
				Brick *brick = [[[Brick alloc] initWithGame:self.game gameplay:currentGameplay] autorelease];
				brick.brickType = i;
				if (i == -1) {
					brick.power = 2;
				}
				brick.position.x = x;
				brick.position.y = 75 + i *20; //20 on iPhone, 40 on iPad
				[scene addItem:brick];
			}
		}
	}
}


@end
