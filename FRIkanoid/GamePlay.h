//
//  GamePlay.h
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameState.h"

@interface GamePlay : GameState {
	Level *level;
	Player *thePlayer;
	Renderer *renderer;
	GuiRenderer *guiRenderer;
	PhysicsEngine *physics;
	NSInteger currentLevel;
	NSInteger lives;
	NSInteger points;
	//Levels
	NSMutableArray *levelClasses;
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass;
- (id) initSinglePlayerWithGame:(Game*)theGame currentLevel:(NSInteger)levelNumber;
- (void) advanceLevel;

@property (nonatomic, readonly) Level *level;
@property (nonatomic, readonly) NSInteger lives;
@property (nonatomic) NSInteger points;
@end
