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

- (id) initSinglePlayerWithGame:(Game *)theGame LevelClass:(Class)levelClass andScore:(NSInteger)score andLives:(NSInteger)theLives  andLevelNum:(NSInteger)levelNum{
	self = [super initWithGame:theGame];
	if (self != nil) {
		if (levelNum == 0) {
			lives = [Constants getInstance].startLives;
		} else {
			lives = theLives;
		}
		points = score;
		currentLevel = levelNum;
		[self startInitWithLevelClass:levelClass];
		
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
	
	renderer = [[Renderer alloc] initWithGame:self.game gameplay:self];

	thePlayer.updateOrder = 0;
	physics.updateOrder = 1;
	level.updateOrder = 2;
	level.scene.updateOrder = 3;
	self.updateOrder = 4;
	[level setGamePlay:self];
}

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
		[frikanoid popState];
	}
	
	
	if (level.numBalls == 0) {
		lives-=1;
		if (lives < 0) {
			//Record score
			NSMutableArray *highScores = [[frikanoid.progress loadProgress] retain];
			[highScores addObject:[NSNumber numberWithInt:points]];
			[frikanoid.progress saveProgress:highScores];
			
			[frikanoid popState]; 
		} else {
			[SoundEngine play:SoundEffectTypeLiveLost];
			[level addBallWithSpeed:[Constants getInstance].initialBallSpeed];
			
		}
	}
	
	if (level.numBricks == 0) {
		//Handle level transition here
		[SoundEngine play:SoundEffectTypeLevelUp];
		points+=5000;
		lives++;
		currentLevel ++;
		if ([frikanoid getLevelClass:currentLevel] != nil) {
			GameState *newState = [[[GamePlay alloc] initSinglePlayerWithGame:self.game LevelClass:[frikanoid getLevelClass:currentLevel] andScore:points andLives:lives  andLevelNum:currentLevel] autorelease];
			GamePlay *nextLevel = (GamePlay*)newState;
			[frikanoid popState];
			[frikanoid pushState:nextLevel];
		} else {
			NSMutableArray *highScores = [[frikanoid.progress loadProgress] retain];
			[highScores addObject:[NSNumber numberWithInt:points]];
			[frikanoid.progress saveProgress:highScores];
			[frikanoid popState];
		}
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




