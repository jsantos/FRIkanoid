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
#import "GameDefaults.Mirage.h"

@interface Level : GameComponent {
	SimpleScene *scene;
	Button *restartButton;
	Image *logo;
	Label *scoreLabel;
	Texture2D *buttonBackground;
	SpriteFont *retrotype, *fivexfive;
	Ball *ball;
	Pad *playerPad;
	NSMutableArray *bricks;
	Boundary *leftWall;
	Boundary *rightWall;
	Boundary *ceiling;
	Boundary *floor;
	PowerUp *powerUp;
	NSInteger numBricks;
	NSInteger numBalls;
	NSInteger levelScore;
	GamePlay *currentGameplay;
}

- (void) reset;
- (void) resetAfterMiss;
- (void) skipLevel;
- (void) resetPad;
- (void) addBallWithSpeed:(float)speed;
- (void) resetLevelWithBallSpeed:(float)speed;

@property (nonatomic) NSInteger numBricks;
@property (nonatomic) NSInteger numBalls;
@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Ball *ball;
@property (nonatomic, readonly) Pad *playerPad;
@property (nonatomic, readonly) PowerUp *powerUp;
@property (nonatomic, readonly) NSMutableArray *bricks;
@property (nonatomic, readonly) Boundary *leftWall;
@property (nonatomic, readonly) Boundary *rightWall;
@property (nonatomic, readonly) Boundary *ceiling;
@property (nonatomic, readonly) Boundary *floor;
@property (nonatomic, readonly) Label *scoreLabel;
@property (nonatomic, readonly) Button *restartButton;

@end