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
	Renderer *renderer;
	//Level *currentLevel;
	
	//GamePlay
	GamePlay *currentGameplay;
	
	//Levels
	//NSMutableArray *levels;
	NSMutableArray *levelClasses;
}

//- (void) loadLevel:(Level*) level;
- (void) loadLevel:(Class) levelClass;

@end