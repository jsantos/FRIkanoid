//
//  GamePlay.m
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GamePlay.h"
#import "Chomponthis.FRIkanoid.h"

@interface GamePlay ()

- (void) startInitWithLevelClass:(Class)levelClass;
- (void) finishInit;

@end


@implementation GamePlay

- (id) initSinglePlayerWithGame:(Game *)theGame LevelClass:(Class)levelClass {
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self startInitWithLevelClass:levelClass];
		
		lives = 3;
		points = 0;
		
		//Create the player
		thePlayer = [[HumanPlayer alloc] initWithGame:self.game pad:level.playerPad];
		
		[self finishInit];
	}
	return self;
}

- (void) startInitWithLevelClass:(Class)levelClass {
	level = [[levelClass alloc] initWithGame:self.game];
}

- (void) finishInit {
	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
	physics.updateOrder = 20;
	
	renderer = [[Renderer alloc] initWithGame:self.game level:level];
	
	thePlayer.updateOrder = 0;
	physics.updateOrder = 1;
	level.updateOrder = 2;
	level.updateOrder = 3;
	level.scene.updateOrder = 4;
	self.updateOrder = 5;
}

//- (id) initSinglePlayerWithGame:(Game *)theGame currentLevel:(NSInteger)levelNumber{
//	self = [super initWithGame:theGame];
//	if (self != nil) {
//		currentLevel = levelNumber;
//		//Add all level classes
//		if (levelClasses) {
//			[levelClasses removeAllObjects];
//		}
//		levelClasses = [[NSMutableArray alloc] init];
//		[levelClasses addObject:[FRIkanoidLevel1 class]];
//		[levelClasses addObject:[FRIkanoidLevel2 class]];
//		
//		lives = 3;
//		points = 0;
//		//Start in first level
//		
//		[self initWithGame:theGame LevelClass:[levelClasses objectAtIndex:levelNumber]];
//		self.updateOrder = 5;
//		
//		//Create player
//		//thePlayer = [[HumanPlayer alloc] initWithPad:level.playerPad scene:level.scene level:level game:self.game];
//		thePlayer = [[HumanPlayer alloc] initWithGame:self.game pad:level.playerPad];
//		//thePlayer = [[AIPlayer alloc] initWithGame:self.game pad:level.playerPad level:level];
//	}
//	[self.game.components addComponent:self];
//	return self;
//}
//
//- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass {
//	//Allocate and initizalize a new level and add it to components.
//	
//	if (level) {
//		[self.game.components removeComponent:level];
//		[level release];
//	}
//	level = [[levelClass alloc] initWithGame:self.game];
//	level.updateOrder = 2;
//	level.scene.updateOrder = 3;
//	
//	[level setGamePlay:self];
//	[self.game.components addComponent:level];
//	
//	//Create a new renderer for the new scene and add it to components.
//	
//	if (renderer) {
//		[self.game.components removeComponent:renderer];
//		[renderer release];
//	}
//	renderer = [[Renderer alloc] initWithGame:self.game gamePlay:self];
//	
//	if (physics) {
//		[self.game.components removeComponent:physics];
//		[physics release];
//	}
//	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
//	physics.updateOrder = 1;
//	self.updateOrder = 4;
//	
//	[self.game.components addComponent:renderer];
//	[self.game.components addComponent:physics];
//}

- (void) activate {
	[self.game.components addComponent:level];
	[self.game.components addComponent:renderer];
	[self.game.components addComponent:physics];
	[self.game.components addComponent:thePlayer];
}

- (void) deactivate {
	[self.game.components removeComponent:level];
	[self.game.components removeComponent:renderer];
	[self.game.components removeComponent:physics];
}

- (void) initialize {
	[super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	level.scoreLabel.text = [NSString stringWithFormat:@"%i", points];
	
	// Update all buttons.
	for (id item in level.scene) {
		Button *button = [item isKindOfClass:[Button class]] ? item : nil;
		
		if (button) {
			[button update];
		}
	}
	
	if (level.restartButton.wasReleased) {
//		[frikanoid popState];
		[level reset];
		points = 0;
		lives = 3;
	}
	
	
	if (level.numBalls == 0) {
		printf("Here!\n");
		[SoundEngine play:SoundEffectTypeLiveLost];
		lives-=1;
		if (lives < 0) {
			[level resetLevelWithBallSpeed:200];
			lives = 3;
		} else {
			[level addBallWithSpeed:200];
			//[level resetAfterMiss];
		}
	}
	

	if (level.numBricks == 0) {

		//[frikanoid.progress saveProgress:frikanoid.scores];
		//Handle level transition here
		points+=5000;
		lives++;
		[level skipLevel];
	}
	[thePlayer updateWithGameTime:gameTime];
}

- (void) dealloc {
	[levelClasses release];
	[level release];
	[renderer release];
	[physics release];
	[thePlayer release];
	[super dealloc];
}

@synthesize level, lives, points;

@end




