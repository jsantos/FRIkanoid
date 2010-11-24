//
//  GamePlay.h
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"

@interface GamePlay : GameComponent {
	Level *level;
	Player *thePlayer;
	Renderer *renderer;
	PhysicsEngine *physics;
	NSInteger currentLevel;
	NSInteger lives;
	
	//Levels
	NSMutableArray *levelClasses;
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass;
- (id) initSinglePlayerWithGame:(Game*)theGame currentLevel:(NSInteger)levelNumber;
- (void) advanceLevel;

@property (nonatomic, readonly) Level *level;
@property (nonatomic, readonly) NSInteger lives;
@end
