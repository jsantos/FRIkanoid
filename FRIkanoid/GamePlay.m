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
		
		lives = 3;
		
		//Start in first level
		
		[self initWithGame:theGame LevelClass:[levelClasses objectAtIndex:levelNumber]];
		self.updateOrder = 10;
		
		//Create player
		thePlayer = [[HumanPlayer alloc] initWithPad:level.playerPad scene:level.scene game:self.game];
	}
	[self.game.components addComponent:self];
	return self;
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass {
	//Allocate and initizalize a new level and add it to components.
	if (level) {
		[self.game.components removeComponent:level];
	}
	level = [[levelClass alloc] initWithGame:self.game];
	
	[self.game.components addComponent:level];
	
	//Create a new renderer for the new scene and add it to components.
	
	if (renderer) {
		[self.game.components removeComponent:renderer];
	}
	renderer = [[Renderer alloc] initWithGame:self.game gamePlay:self];
	[self.game.components addComponent:renderer];
	
	if (physics) {
		[self.game.components removeComponent:physics];
	}
	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
	physics.updateOrder = 20;
	[self.game.components addComponent:physics];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	NSMutableArray *ballsOut = [[NSMutableArray alloc] init];
	int index = 0;
	for(id item in level.balls){
		Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
		if (ball.position.y > self.game.window.clientBounds.height + 100) { //Delay for ball not show up immediatly
			[ballsOut addObject:item];
		}	
		index++;
	}
	
	
	
	if ([ballsOut count] == [level.balls count]) {
		lives-=1;
		if (lives < 0) {
			[level reset];
			lives = 3;
		}
		[level resetAfterMiss];
	}
	if ([level.balls count] > 1) {
		for(id item in ballsOut){
			[level.balls removeObjectIdenticalTo:item];
			[level.scene removeObjectIdenticalTo:item];
		}
	}
		
	if (level.numBricks == 0) {
		//Handle level transition here
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

- (void) dealloc {
	[self.game.components removeComponent:level];
	[self.game.components removeComponent:renderer];
	[self.game.components removeComponent:physics];
	[levelClasses release];
	[level release];
	[renderer release];
	[physics release];
	[thePlayer release];
	[super dealloc];
}

@synthesize level, lives;

@end




