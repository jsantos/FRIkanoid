//
//  FRIkanoidLevel.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoidLevel.h"
#import "Chomponthis.FRIkanoid.h"

@implementation FRIkanoidLevel

- (void) reset {
	self = [super init];
	if (self != nil) {
		//Initialize object Positions
		ball.position.x = 160;
		ball.position.y = 360;
		
		playerPad.position.x = 160;
		playerPad.position.y = 480;
		
		double initX = 20, initY=47;
		for (id<NSObject> item in bricks) {
			id<IPosition> itemWithPosition;
			if ([item conformsToProtocol:@protocol(IPosition)]) {
				itemWithPosition = (id<IPosition>)item;
				
				itemWithPosition.position.x = initX;
				itemWithPosition.position.y = initY;
			}
			if (initX > 220) {
				initX = 20;
				initY+=33;
			} else {
				initX+=80;
			}
		}
	}
}

@end
