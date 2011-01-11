//
//  FasterPowerUp.m
//  FRIkanoid
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FasterPowerUp.h"
#import "GameDefaults.Scene.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FasterPowerUp

- (id) init {
	self = [super initWithType:FasterBall duration:30];
	if (self != nil) {
		
	}
	return self;
}

- (void) activateWithParent:(Pad *)theParent {
	[super activateWithParent:theParent];
	
	for(id item in scene){
		if ([item isKindOfClass:[Ball class]]) {
			Ball *ball = (Ball*)item;
			if (ball.velocity.x > 0) {
				ball.velocity.x += 100;
			} else {
				ball.velocity.x -= 100;
			}
			
			if (ball.velocity.y > 0) {
				ball.velocity.y += 100;
			} else {
				ball.velocity.y -= 100;
			}
		}
	}
}

@end
