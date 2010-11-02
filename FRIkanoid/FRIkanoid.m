//
//  FRIkanoid.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoid.h"
#import <AudioToolbox/AudioServices.h>


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
	// Create all levels
	levels = [[NSMutableArray alloc] init];
	[levels addObject:[[[FRIkanoidLevel alloc] init] autorelease]];
	
	//Start in first level
	[self loadLevel:[levels objectAtIndex:0]];
	
	//Initialize all components
	[super initialize];
}


- (void) loadLevel:(Level *)level {
	if (renderer) {
		[self.components removeComponent:renderer];
		[renderer release];
	}
	
	//Create a new renderer for the scene
	renderer = [[Renderer alloc] initWithGame:self level:level];
	[self.components addComponent:renderer];
}

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
	[graphics release];
	[super dealloc];
}

@end
