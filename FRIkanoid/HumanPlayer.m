//
//  HumanPlayer.m
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HumanPlayer.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Chomponthis.FRIkanoid.h"
#import "GameDefaults.Physics.h"

@implementation HumanPlayer

- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene level:(Level*)theLevel game:(Game*)game {
	self = [super initWithPad:thePad scene:theScene];
	if (self != nil) {
		inputArea = [[Rectangle alloc] initWithRectangle:game.window.clientBounds];
		inputArea.height = 100; //Correspond to Pad's height, plus a little bit for usability questions
		inputArea.y = game.window.clientBounds.height - inputArea.height;
		touchOffset = [[Vector2 alloc] initWithX:0 y:-40];
		level = theLevel;
	}
	return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	TouchCollection *touches = [TouchPanel getState];
	
	BOOL touchesInInputArea = NO;
	for(TouchLocation *touch in touches){
		if([inputArea containsVector:touch.position]){
			touchesInInputArea = YES;
			if (!grabbed) {
				float distanceToPad = [[[Vector2 subtract:touch.position by:playerPad.position] subtract:touchOffset] length];
				if (distanceToPad < 50 && !playerPad.big) {
					grabbed = YES;
				} else if (distanceToPad < 100 && playerPad.big) {
					grabbed = YES;
				}
			}
			
			if (grabbed) {
//				if ([Collision collisionBetween:level.playerPad and:level.leftWall]) {
//					playerPad.position.x += 1;
//				} else if ([Collision collisionBetween:level.playerPad and:level.rightWall]) {
//					playerPad.position.x -= 1;
//				} else {
					playerPad.position.x = touch.position.x;
//				}
			}
		}
	}
	
	if (!touchesInInputArea) {
		grabbed = NO;
	}
}

- (void) dealloc {
	[inputArea release];
	[super dealloc];
}

@end
