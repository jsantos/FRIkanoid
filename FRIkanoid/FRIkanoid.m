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

//- (void) initialize {
//	// Create all levels
//	levels = [[NSMutableArray alloc] init];
//	[levels addObject:[[[FRIkanoidLevel alloc] init] autorelease]];
//	
//	//Start in first level
//	[self loadLevel:[levels objectAtIndex:0]];
//	
//	//Initialize all components
//	[super initialize];
//}

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

//- (void) loadLevel:(Level *)level {
//	if (renderer) {
//		[self.components removeComponent:renderer];
//		[renderer release];
//	}
//	
//	//Create a new renderer for the scene
//	renderer = [[Renderer alloc] initWithGame:self level:level];
//	[self.components addComponent:renderer];
//}

//- (void) loadContent {
//
//}
//
//- (void) updateWithGameTime:(GameTime *)gameTime {
//	
//	[super updateWithGameTime:gameTime];
//}
//
//- (void) drawWithGameTime:(GameTime *)gameTime {
//	[self.graphicsDevice clearWithColor:[Color skyBlue]];
//	
//	[super drawWithGameTime:gameTime];
//}

- (void) dealloc
{
	[levelClasses release];
	[graphics release];
	[super dealloc];
}

@end
