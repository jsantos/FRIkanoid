//
//  FRIkanoid.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoid.h"
#import "Chomponthis.FRIkanoid.h"


@implementation FRIkanoid

- (id) init
{
	self = [super init];
	if (self != nil) {
		graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
	}
	return self;
}

- (void) initialize {
	[self loadLevel];
	
	//Initialize all components
	[super initialize]; 
}


- (void) loadLevel{
	//Unload the current gameplay
	if (currentGameplay) {
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	
	//Allocate and initialize new gameplay object and add it to components
	currentGameplay = [[GamePlay alloc] initSinglePlayerWithGame:self currentLevel:0]; //Start at first level
	//[self.components addComponent:currentGameplay];
}

- (void) dealloc
{
	[graphics release];
	[super dealloc];
}

@end
