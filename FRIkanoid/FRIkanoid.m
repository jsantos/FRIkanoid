//
//  FRIkanoid.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FRIkanoid.h"
#import "Chomponthis.FRIkanoid.h"
#import "GameDefaults.Control.h"
#import "MainMenu.h"

@implementation FRIkanoid

- (id) init
{
	self = [super init];
	if (self != nil) {
		graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
		
		[self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
		stateStack = [[NSMutableArray alloc] init];
		
		[SoundEngine initializeWithGame:self];
		
		mutedMusic = NO;
		
		progress = [[GameProgress alloc] init];
	}
	return self;
}

@synthesize progress, scores, mutedMusic;

- (void) initialize {
	MainMenu *menu = [[[MainMenu alloc] initWithGame:self] autorelease];
	[self pushState:menu];
	
	//[self loadLevel];
	//Initialize all components
	[super initialize]; 
}


//- (void) loadLevel{
//	//Unload the current gameplay
//	if (currentGameplay) {
//		[self.components removeComponent:currentGameplay];
//		[currentGameplay release];
//	}
//	
//	//Allocate and initialize new gameplay object and add it to components
//	currentGameplay = [[GamePlay alloc] initSinglePlayerWithGame:self currentLevel:0]; //Start at first level
//	//[self.components addComponent:currentGameplay];
//}

- (void) pushState:(GameState*)gameState {
	GameState *currentActiveState = [stateStack lastObject];
	[currentActiveState deactivate];
	[self.components removeComponent:currentActiveState];
	
	[stateStack addObject:gameState];
	[self.components addComponent:gameState];
	[gameState activate];
}

- (void) popState {
	GameState *currentActiveState = [stateStack lastObject];
	[stateStack removeLastObject];
	[currentActiveState deactivate];
	[self.components removeComponent:currentActiveState];

	currentActiveState = [stateStack lastObject];
	[self.components addComponent:currentActiveState];
	[currentActiveState activate];
}

- (Class) getLevelClass:(LevelType)type{
	//return levelClasses[type];
	return nil;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor: [Color steelBlue]];
	[super drawWithGameTime:gameTime];
}

- (void) dealloc
{
	[stateStack release];
	[progress release];
	[graphics release];
	[super dealloc];
}

@end
