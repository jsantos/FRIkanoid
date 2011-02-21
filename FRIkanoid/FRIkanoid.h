//
//  FRIkanoid.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Chomponthis.FRIkanoid.classes.h"

@interface FRIkanoid : Game {
	GraphicsDeviceManager *graphics;
	
	//Progress
	GameProgress *progress;
	NSMutableArray *scores;
	
	//GamePlay
	GamePlay *currentGameplay;
	
	//Game State
	NSMutableArray *stateStack;
	
	// Levels
	Class levelClasses[LevelTypes];
	
	BOOL mutedMusic;
	BOOL mutedSFX;
}

@property (nonatomic, readonly) GameProgress *progress;
@property (nonatomic, retain) NSMutableArray *scores;
@property (nonatomic) BOOL mutedMusic;
@property (nonatomic) BOOL mutedSFX;
@property (nonatomic, retain) GamePlay *currentGamePlay;

//- (void) loadLevel;

- (void) pushState:(GameState*)gameState;
- (void) popState;

- (void) addPoints:(int)points;

- (Class) getLevelClass:(LevelType)type;

@end