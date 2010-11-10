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
}

- (void) initWithGame:(Game *)theGame LevelClass:(Class)levelClass;
- (id) initSinglePlayerWithGame:(Game*)theGame levelClass:(Class)levelClass;

@end
