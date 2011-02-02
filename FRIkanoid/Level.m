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
		retrotype = [self.game.content load:@"Retrotype" processor:fontProcessor];
		fivexfive = [self.game.content load:@"ArkaType12" processor:fontProcessor];
		fivexfive.lineSpacing = 14;
		
		scoreLabel = [[Label alloc] initWithFont:retrotype text:@"" position:[Vector2 vectorWithX:20 y:5]];
		scoreLabel.color = [Color white];
		
		//Button
		
		buttonBackground = [self.game.content load:@"RestartButton"];

		restartButton = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:360 y:10 width:140 height:32] 
										background:buttonBackground font:fivexfive text:@"Menu"];
		restartButton.label.position.y = 32;
		restartButton.label.position.x = 390;
		restartButton.backgroundColor = [Color skyBlue];
		restartButton.backgroundHoverColor = [Color powderBlue];
		[restartButton.backgroundImage setScaleUniform:1.1];
		
		//Button
		
		Texture2D *logoImg = [[self.game.content load:@"Frikanoid"] autorelease];
		logo = [[Image alloc] initWithTexture:logoImg position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2 - logoImg.width/2) y:10]];
		[scene addItem:logo];
		
		ball = [[Ball alloc] init];
		
		playerPad = [[Pad alloc] init];
		
		bricks = [[NSMutableArray alloc] init];
		
		leftWall = [[[Boundary alloc] initWithLimit:
								 [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveX distance:0] isDeadly:NO] autorelease];
		rightWall = [[[Boundary alloc] initWithLimit:
					  [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeX distance:-self.game.window.clientBounds.width] isDeadly:NO] autorelease];
		ceiling = [[[Boundary alloc] initWithLimit:
					[AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveY distance:0] isDeadly:NO] autorelease];
		floor = [[[Boundary alloc] initWithLimit:
				  [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeY distance:-self.game.window.clientBounds.height] isDeadly:YES] autorelease];
	
		
		//currentGameplay.points = 0;
	}
	return self;
}

@synthesize scene, ball, playerPad, bricks, powerUp, leftWall, rightWall, ceiling, floor, numBricks, numBalls, scoreLabel, restartButton;

- (void) initialize {
	[self reset];
	[super initialize];
}

- (void) reset {
	[scene clear];
	playerPad.width = 107.9;
	[scene addItem:restartButton];
	[scene addItem:logo];
	[scene addItem:playerPad];
	[scene addItem:scoreLabel];
	
	[scene addItem: leftWall];
	[scene addItem: rightWall];
	[scene addItem: ceiling];
	[scene addItem: floor];
	
	[scene addItem:ball];
	
	[bricks removeAllObjects];
}

- (void) resetAfterMiss {}

- (void) resetPad{
	playerPad.width = 110;
}

- (void) skipLevel {
	[scene clear];
	[scene addItem:playerPad];
	
	[scene addItem:restartButton];
	
	[scene addItem:scoreLabel];
	
	[scene addItem: leftWall];
	[scene addItem: rightWall];
	[scene addItem: ceiling];
	[scene addItem: ball];
	[bricks removeAllObjects];
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

- (void) resetLevelWithBallSpeed:(float)speed {
	//Remove everything from scene
	[scene clear];
	
	//Add level limits
	[scene addItem:[[[Boundary alloc] initWithLimit:
					 [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveX distance:0] isDeadly:NO] autorelease]];
	
	[scene addItem:[[[Boundary alloc] initWithLimit:
					 [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeX distance:-self.game.window.clientBounds.width] isDeadly:NO] autorelease]];
	[scene addItem:[[[Boundary alloc] initWithLimit:
					 [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionPositiveY distance:0] isDeadly:NO] autorelease]];
	[scene addItem:[[[Boundary alloc] initWithLimit:
					 [AxisAlignedHalfPlane axisAlignedHalfPlaneWithDirection:AxisDirectionNegativeY distance:-self.game.window.clientBounds.height] isDeadly:YES] autorelease]]; 
	
	//Add pad
	[scene addItem:playerPad];
	[self resetPad];
	
	//Add Ball
	[self addBallWithSpeed:speed];
	
	//Add bricks
	for (int i = 0; i < BrickTypes; i++) {
		for (int x = 30; x <= self.game.window.clientBounds.width; x+=60) {
			Brick *brick = [[Brick alloc] init];
			brick.brickType = i;
			if (i == 0) {
				brick.power = 2;
			}
			brick.position.x = x;
			brick.position.y = 75 + i *25;
			[scene addItem:brick];
		}
	}
}

- (void) addBallWithSpeed:(float)speed {
	Ball *tmpBall = [[[Ball alloc] init] autorelease];
	tmpBall.position.x = playerPad.position.x + ([Random float] - 0.5f) * 10;
	tmpBall.position.y = playerPad.position.y - playerPad.height / 2;
	tmpBall.velocity.y = speed;
	[scene addItem:tmpBall];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
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
