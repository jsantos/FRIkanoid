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
	//Add all level classes
	levelClasses = [[NSMutableArray alloc] init];
	[levelClasses addObject:[FRIkanoidLevel class]];
	
	//Start in first level
	[self loadLevel:[levelClasses objectAtIndex:0]];
	
	//Initialize all components
	[super initialize]; 
}


- (void) loadLevel:(Class)levelClass {
	//Unload the current gameplay
	if (currentGameplay) {
		[self.components removeComponent:currentGameplay];
		[currentGameplay release];
	}
	
	//Allocate and initialize new gameplay object and add it to components
	currentGameplay = [[GamePlay alloc] initSinglePlayerWithGame:self levelClass:levelClass];
	[self.components addComponent:currentGameplay];
}

- (void) dealloc
{
	[levelClasses release];
	[graphics release];
	[super dealloc];
}

@end
