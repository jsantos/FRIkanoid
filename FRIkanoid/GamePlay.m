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

- (id) initSinglePlayerWithGame:(Game *)theGame levelClass:(Class)levelClass {
	self = [super initWithGame:theGame];
	if (self != nil) {
		[self initWithGame:theGame LevelClass:levelClass];
		self.updateOrder = 10;
		
		//Create player
		thePlayer = [[HumanPlayer alloc] initWithPad:level.playerPad scene:level.scene game:self.game];
	}
	return self;
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass {
	//Allocate and initizalize a new level and add it to components.
	level = [[levelClass alloc] initWithGame:self.game];
	[self.game.components addComponent:level];
	
	//Create a new renderer for the new scene and add it to components.
	renderer = [[Renderer alloc] initWithGame:self.game level:level];
	[self.game.components addComponent:renderer];
	
	physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
	physics.updateOrder = 20;
	[self.game.components addComponent:physics];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[thePlayer updateWithGameTime:gameTime];
}

- (void) dealloc {
	[self.game.components removeComponent:level];
	[self.game.components removeComponent:renderer];
	[self.game.components removeComponent:physics];
	
	[level release];
	[renderer release];
	[physics release];
	[thePlayer release];
	[super dealloc];
}

@end




