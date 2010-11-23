//
//  Level.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.h"

@interface Level : GameComponent {
	SimpleScene *scene;
	Ball *ball;
	Pad *playerPad;
	NSMutableArray *bricks;
	Boundary *leftWall;
	Boundary *rightWall;
	Boundary *ceiling;
	PowerUp *powerUp;
	NSInteger numBricks;
	
}

- (void) reset;
- (void) resetAfterMiss;

@property (nonatomic) NSInteger numBricks;
@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Ball *ball;
@property (nonatomic, readonly) Pad *playerPad;
@property (nonatomic, readonly) PowerUp *powerUp;
@property (nonatomic, readonly) NSMutableArray *bricks;
@property (nonatomic, readonly) Boundary *leftWall;
@property (nonatomic, readonly) Boundary *rightWall;
@property (nonatomic, readonly) Boundary *ceiling;

@end