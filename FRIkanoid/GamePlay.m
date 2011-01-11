//
//  GamePlay.m
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GamePlay.h"
#import "Chomponthis.FRIkanoid.h"


@implementation GamePlay

- (id) initSinglePlayerWithGame:(Game *)theGame currentLevel:(NSInteger)levelNumber{
	self = [super initWithGame:theGame];
	if (self != nil) {
		currentLevel = levelNumber;
		//Add all level classes
		if (levelClasses) {
			[levelClasses removeAllObjects];
		}
		levelClasses = [[NSMutableArray alloc] init];
		[levelClasses addObject:[FRIkanoidLevel1 class]];
		[levelClasses addObject:[FRIkanoidLevel2 class]];
		
		lives = 3;
		points = 0;
		//Start in first level
		
		[self initWithGame:theGame LevelClass:[levelClasses objectAtIndex:levelNumber]];
		self.updateOrder = 4;
		
		//Create player
		//thePlayer = [[HumanPlayer alloc] initWithPad:level.playerPad scene:level.scene level:level game:self.game];
		thePlayer = [[HumanPlayer alloc] initWithGame:self.game pad:level.playerPad];
		//thePlayer = [[AIPlayer alloc] initWithGame:self.game pad:level.playerPad level:level];
	}
	[self.game.components addComponent:self];
	return self;
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass {
	//Allocate and initizalize a new level and add it to components.
	
	if (level) {
		[self.game.components removeComponent:level];
		[level release];
	}
	level = [[levelClass alloc] initWithGame:self.game];
	level.updateOrder = 2;
	
	[level setGamePlay:self];
	[self.game.components addComponent:level];
	
	//Create a new renderer for the new scene and add it to components.
	
	if (renderer) {
		[self.game.components removeComponent:renderer];
		[renderer release];
	}
	renderer = [[Renderer alloc] initWithGame:self.game gamePlay:self];
	
	if (physics) {
		[self.game.components removeComponent:physics];
		[physics release];
	}
	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
	physics.updateOrder = 1;
	self.updateOrder = 4;
	
	[self.game.components addComponent:renderer];
	[self.game.components addComponent:physics];
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
//		[level reset];
//		points = 0;
//		lives = 3;
	}
	
//	NSMutableArray *ballsOut = [[NSMutableArray alloc] init];
//	int index = 0;
//	for(id item in level.balls){
//		Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
//		if (ball.position.y > self.game.window.clientBounds.height) { //Delay for ball not show up immediatly
//			[ballsOut addObject:item];
//		}
//		index++;
//	}
//	
//	if ([ballsOut count] == [level.balls count]) {
//		[SoundEngine play:SoundEffectTypeLiveLost];
//		lives-=1;
//		if (lives < 0) {
//			[level reset];
//			lives = 3;
//		}
//		
//	}
	
	if (level.numBalls == 0) {
		[SoundEngine play:SoundEffectTypeLiveLost];
		lives-=1;
		if (lives < 0) {
			[level reset];
			points = 0;
			lives = 3;
		} else {
			[level resetAfterMiss];
		}
	}
	
//	if ([level.balls count] > 1) {
//		for(id item in ballsOut){
//			[level.balls removeObjectIdenticalTo:item];
//			[level.scene removeObjectIdenticalTo:item];
//		}
//	}
		
	if (level.numBricks == 0) {
		//Handle level transition here
		points+=500;
		lives++;
		[level skipLevel];
		//[self advanceLevel];
	}
	[thePlayer updateWithGameTime:gameTime];
}

- (void) advanceLevel {
	currentLevel += 1;
	[self initWithGame:self.game LevelClass:[levelClasses objectAtIndex:currentLevel]];
}

- (void) deactivate {
	[self.game.components removeComponent:level];
	[self.game.components removeComponent:renderer];
	[self.game.components removeComponent:physics];
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




