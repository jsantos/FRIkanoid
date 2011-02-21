//
//  MultiBallPowerUp.m
//  FRIkanoid
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MultiBallPowerUp.h"
#import "GameDefaults.Scene.h"
#import "Chomponthis.FRIkanoid.h"


@implementation MultiBallPowerUp

- (id) init {
	self = [super initWithType:MultiBall duration:30];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Pad *)theParent {
	[super activateWithParent:theParent];
	
	for(id item in scene){
		if ([item isKindOfClass:[Ball class]]) {
			Ball *ball = (Ball*)item;
			
			//Create one copy with flipped speed
			Ball *copy = [[[Ball alloc] initWithGame:ball.currentGame] autorelease];
			[copy.position set:ball.position];
			copy.velocity.x = -ball.position.x;
			copy.velocity.y = -ball.position.y;
			[scene addItem:copy];
		}
	}
}

@end
