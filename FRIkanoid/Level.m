//
//  Level.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "Chomponthis.FRIkanoid.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"

@implementation Level

- (id) initWithGame:(Game *)theGame{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:theGame];
		scene.updateOrder = 3;
		[self.game.components addComponent:scene];
	
		[scene.itemAdded subscribeDelegate: [Delegate delegateWithTarget:self Method:@selector(itemAddedToScene:eventArgs:)]];
		[scene.itemRemoved subscribeDelegate:[Delegate delegateWithTarget:self Method:@selector(itemRemovedFromScene:eventArgs:)]];

		FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
		if (self.game.window.clientBounds.width == 1024) {
			retrotype = [self.game.content load:@"Steiner28" processor:fontProcessor];
		} else {
			retrotype = [self.game.content load:@"Steiner" processor:fontProcessor];
		}
		
		scoreLabel = [[Label alloc] initWithFont:retrotype text:@"" position:[Vector2 vectorWithX:20 y:5]];
		scoreLabel.color = [Color white];
		
		//Button
		
		buttonBackground = [self.game.content load:@"RestartButton"];
		
		if (self.game.window.clientBounds.width == 1024) {
			restartButton = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width-140 y:32 width:140 height:32] 
												   background:nil font:retrotype text:@"Menu"];
		}
		else {
			restartButton = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width-70 y:15 width:140 height:32] 
												   background:nil font:retrotype text:@"Menu"];
		}

		
		restartButton.label.color = [Color yellow];
		restartButton.labelHoverColor = [Color white];
		//restartButton.backgroundColor = [Color skyBlue];
		//restartButton.backgroundHoverColor = [Color powderBlue];
		//[restartButton.backgroundImage setScaleUniform:1.1];
		
		//Button
		
		if (self.game.window.clientBounds.width == 1024) {
//			Texture2D *logoImg = [[self.game.content load:@"BigLogo"] autorelease];
//			logo = [[Image alloc] initWithTexture:logoImg position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2 - logoImg.width/2) y:10]];
//			[scene addItem:logo];
			
			Texture2D *gameBG = [[self.game.content load:@"iPadBG"] autorelease];
			background = [[Image alloc] initWithTexture:gameBG position:[Vector2 vectorWithX:0 y:0]];
			background.layerDepth = 1;
			[scene addItem:background];
		} else {
//			Texture2D *logoImg = [[self.game.content load:@"Frikanoid"] autorelease];
//			logo = [[Image alloc] initWithTexture:logoImg position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2 - logoImg.width/2) y:10]];
//			[scene addItem:logo];
			
			Texture2D *gameBG = [[self.game.content load:@"iPhoneBG"] autorelease];
			background = [[Image alloc] initWithTexture:gameBG position:[Vector2 vectorWithX:0 y:0]];
			background.layerDepth = 1;
			[scene addItem:background];
		}


		playerPad = [[Pad alloc] initWithGame:self.game];
		
		bricks = [[NSMutableArray alloc] init];
		
		leftWall = [[[Boundary alloc] initWithLimit:
								 [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveX distance:0] isDeadly:NO] autorelease];
		rightWall = [[[Boundary alloc] initWithLimit:
					  [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeX distance:-self.game.window.clientBounds.width] isDeadly:NO] autorelease];
		ceiling = [[[Boundary alloc] initWithLimit:
					[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveY distance:0] isDeadly:NO] autorelease];
		floor = [[[Boundary alloc] initWithLimit:
				  [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeY distance:-self.game.window.clientBounds.height] isDeadly:YES] autorelease];
	}
	return self;
}

@synthesize scene, ball, playerPad, bricks, powerUp, leftWall, rightWall, ceiling, floor, numBricks, numBalls, scoreLabel, restartButton, levelDelay;

- (void) initialize {
	[self reset];
	[super initialize];
}

- (void) reset {
	[scene clear];
	if (self.game.window.clientBounds.width == 1024) {
		playerPad.width = 180;
	} else {
		playerPad.width = 110;
	}
	
	levelDelay = 1.5;
	
	[scene addItem:restartButton];
	[scene addItem:background];
	[scene addItem:playerPad];
	
	[scene addItem:scoreLabel];
	
	[scene addItem: leftWall];
	[scene addItem: rightWall];
	[scene addItem: ceiling];
	[scene addItem: floor];
	
	[bricks removeAllObjects];
}

- (void) resetAfterMiss {}

- (void) resetPad{
	if (self.game.window.clientBounds.width == 1024) {
		playerPad.width = 180;
	} else {
		playerPad.width = 110;
	}
}

- (void) itemAddedToScene:(id)sender eventArgs:(SceneEventArgs*)e{
	if ([e.item isKindOfClass:[Brick class]]) {
		numBricks++;
	} else if ([e.item isKindOfClass:[Ball class]]) {
		numBalls++;
	}
}

- (void) itemRemovedFromScene:(id)sender eventArgs:(SceneEventArgs*)e{
	if ([e.item isKindOfClass:[Brick class]]) {
		numBricks--;
		currentGameplay.points += 100;
	} else if ([e.item isKindOfClass:[Ball class]]) {
		numBalls--;
	}
}

- (void) setGamePlay:(GamePlay*)theGamePlay{
	currentGameplay = theGamePlay;
}

- (void) addBallWithSpeed:(float)speed {
	Ball *tmpBall = [[[Ball alloc] initWithGame:self.game] autorelease];
	tmpBall.position.x = playerPad.position.x + ([Random float] - 0.5f) * 10;
	tmpBall.position.y = playerPad.position.y - playerPad.height/2;
	tmpBall.velocity.y = speed;
	ball = tmpBall;
	[scene addItem:tmpBall];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	if (levelDelay > 0) {
		levelDelay-=gameTime.elapsedGameTime;
		ball.position.x = playerPad.position.x;
		ball.position.y = playerPad.position.y - playerPad.height;

	}
	
	// Update all items with custom update.
	for (id item in scene) {
		id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
		
		if (updatable) {
			[updatable updateWithGameTime:gameTime];
		}	
	}
}

- (void) dealloc {
	[scene release];
	[super dealloc];
}

@end
