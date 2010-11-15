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
		ball.position.x = 240;
		ball.position.y = 200;
		
		playerPad.position.x = 240;
		playerPad.position.y = 335;
		
		double initX = 16, initY=36;
		for (id<NSObject> item in bricks) {
			id<IPosition> itemWithPosition;
			if ([item conformsToProtocol:@protocol(IPosition)]) {
				itemWithPosition = (id<IPosition>)item;
				itemWithPosition.position.x = initX;
				itemWithPosition.position.y = initY;
			}
			if (initX > 380) {
				initX = 16;
				initY+=26;
			} else {
				initX+=60;
			}
		}
	}
}

@end
