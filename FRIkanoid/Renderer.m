//
//  Renderer.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Renderer.h"
#import "Chomponthis.FRIkanoid.h"
#import "GameDefaults.Scene.h"
#import "GameDefaults.Scene.Objects.h"
#import "GameDefaults.Graphics.h"

@implementation Renderer

- (id) initWithGame:(Game *)theGame gamePlay:(GamePlay*)theGamePlay{
	if (self = [super initWithGame:theGame]) {
		gamePlay = theGamePlay;
		content = [[ContentManager alloc] initWithServiceProvider:self.game.services];
		//primitiveBatch = [[PrimitiveBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	}
	return self;
}

- (void) initialize {
	[super initialize];
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	ballSprite = [[Sprite alloc] init];
	ballSprite.texture = [self.game.content load:@"Arkanoid2"];
	ballSprite.sourceRectangle = [Rectangle rectangleWithX:236 y:179 width:36 height:36];
	ballSprite.origin = [Vector2 vectorWithX:18 y:18];
	
	padSprite = [[Sprite alloc] init];
	padSprite.texture = [self.game.content load:@"Arkanoid2"];
	padSprite.sourceRectangle = [Rectangle rectangleWithX:82 y:350 width:165 height:30];
	padSprite.origin = [Vector2 vectorWithX:82.5 y:15];
	
	bigPadSprite = [[Sprite alloc] init];
	bigPadSprite.texture = [self.game.content load:@"Arkanoid2"];
	bigPadSprite.sourceRectangle = [Rectangle rectangleWithX:82 y:395 width:265 height:30];
	bigPadSprite.origin = [Vector2 vectorWithX:132.5 y:15];
	
	powerUpFSprite = [[Sprite alloc] init];
	powerUpFSprite.texture = [self.game.content load:@"Arkanoid2"];
	powerUpFSprite.sourceRectangle = [Rectangle rectangleWithX:65 y:281 width:47 height:20];
	powerUpFSprite.origin = [Vector2 vectorWithX:23.5 y:10];
	
	powerUpSSprite = [[Sprite alloc] init];
	powerUpSSprite.texture = [self.game.content load:@"Arkanoid2"];
	powerUpSSprite.sourceRectangle = [Rectangle rectangleWithX:65 y:301 width:47 height:20];
	powerUpSSprite.origin = [Vector2 vectorWithX:23.5 y:10];
	
	powerUpLSprite = [[Sprite alloc] init];
	powerUpLSprite.texture = [self.game.content load:@"Arkanoid2"];
	powerUpLSprite.sourceRectangle = [Rectangle rectangleWithX:114 y:281 width:47 height:20];
	powerUpLSprite.origin = [Vector2 vectorWithX:23.5 y:10];
	
	powerUpGSprite = [[Sprite alloc] init];
	powerUpGSprite.texture = [self.game.content load:@"Arkanoid2"];
	powerUpGSprite.sourceRectangle = [Rectangle rectangleWithX:114 y:301 width:47 height:20];
	powerUpGSprite.origin = [Vector2 vectorWithX:23.5 y:10];
	
	brick1Sprite = [[Sprite alloc] init];
	brick1Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick1Sprite.sourceRectangle = [Rectangle rectangleWithX:55 y:64 width:120 height:37];
	brick1Sprite.origin = [Vector2 vectorWithX:55 y:19];
	
	brick2Sprite = [[Sprite alloc] init];
	brick2Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick2Sprite.sourceRectangle = [Rectangle rectangleWithX:55 y:122 width:120 height:37];
	brick2Sprite.origin = [Vector2 vectorWithX:55 y:19];
		
	brick3Sprite = [[Sprite alloc] init];
	brick3Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick3Sprite.sourceRectangle = [Rectangle rectangleWithX:55 y:178 width:120 height:37];
	brick3Sprite.origin = [Vector2 vectorWithX:55 y:19];
	
	brick4Sprite = [[Sprite alloc] init];
	brick4Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick4Sprite.sourceRectangle = [Rectangle rectangleWithX:55 y:233 width:120 height:37];
	brick4Sprite.origin = [Vector2 vectorWithX:55 y:19];
	
	liveSprite = [[Sprite alloc] init];
	liveSprite.texture = [self.game.content load:@"Arkanoid2"];
	liveSprite.sourceRectangle = [Rectangle rectangleWithX:80 y:449 width:100 height:10];
	liveSprite.origin = [Vector2 vectorWithX:50 y:5];
	
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	
	[self.graphicsDevice clearWithColor: [Color steelBlue]];
	
	[spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil];
	
	for (id item in gamePlay.level.scene) {
		id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)]  ? item : nil;
		Sprite *sprite;
		
		if ([item isKindOfClass:[Ball class]]) {
//			Ball *ball = [item isKindOfClass:[Ball class]] ? item : nil;
			sprite = ballSprite;
//			[primitiveBatch beginWithBlendState:blendState DepthStencilState:depthStencilState 
//								RasterizerState:rasterizerState Effect:effect TransformMatrix:transformMatrix];
//			[primitiveBatch drawPointAt:ball.position color:[Color black]];
//			[primitiveBatch drawCircleAt:ball.position radius:ball.radius divisions:32 color:[Color black]];
//			[primitiveBatch end];
		} else if ([item isKindOfClass:[Pad class]]) {
//			Pad *pad = [item isKindOfClass:[Pad class]] ? item : nil;
			if (gamePlay.level.playerPad.big) {
				sprite = bigPadSprite;
			} else {
				sprite = padSprite;
			}
//			[primitiveBatch beginWithBlendState:blendState DepthStencilState:depthStencilState 
//								RasterizerState:rasterizerState Effect:effect TransformMatrix:transformMatrix];
//			[primitiveBatch drawPointAt:pad.position color:[Color black]];
//			[primitiveBatch drawRectangleAt:pad.position width:pad.width height:pad.height color:[Color black]];
//			[primitiveBatch end];
			
		} else if ([item isKindOfClass:[Brick class]]) {
			Brick *brick = (Brick*)item;
			switch (brick.brickType) {
				default:
				case 0:
					sprite = brick4Sprite;
					break;
				case 1:
					sprite = brick3Sprite;
					break;
				case 2:
					sprite = brick2Sprite;
					break;
				case 3:
					sprite = brick1Sprite;
					break;
			}
//			[primitiveBatch beginWithBlendState:blendState DepthStencilState:depthStencilState 
//								RasterizerState:rasterizerState Effect:effect TransformMatrix:transformMatrix];
//			[primitiveBatch drawPointAt:brick.position color:[Color black]];
//			[primitiveBatch drawRectangleAt:brick.position width:brick.width height:brick.height color:[Color black]];
//			[primitiveBatch end];
		}
		
		PowerUp *temp = [item isKindOfClass:[PowerUp class]] ? item : nil;
		if (temp) {
//			[primitiveBatch beginWithBlendState:blendState DepthStencilState:depthStencilState 
//								RasterizerState:rasterizerState Effect:effect TransformMatrix:transformMatrix];
//			[primitiveBatch drawPointAt:temp.position color:[Color black]];
//			[primitiveBatch drawRectangleAt:temp.position width:temp.width height:temp.height color:[Color black]];
//			[primitiveBatch end];
			switch (temp.type) {
				default:
				case FasterBall:
					sprite = powerUpFSprite;
					break;
				case SlowerBall:
					sprite = powerUpSSprite;
					break;
				case BiggerPad:
					sprite = powerUpLSprite;
					break;
				case MachineGun:
					sprite = powerUpGSprite;
					break;
			}
		}
		
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture 
						   to:itemWithPosition.position
				fromRectangle:sprite.sourceRectangle
				tintWithColor:[Color white]
					 rotation:0 
					   origin:sprite.origin
				 scaleUniform:0.65
					  effects:SpriteEffectsNone 
				   layerDepth:0.1];
		}
		
	}
	
	//Draw lives counter
	Vector2 *pos = [[Vector2 alloc] init];
	pos.x = 50;
	pos.y = 20;
	for (int i = 0; i < gamePlay.lives; i++) {
		
		[spriteBatch draw:liveSprite.texture 
					   to:pos
			fromRectangle:liveSprite.sourceRectangle
			tintWithColor:[Color white]
				 rotation:0 
				   origin:liveSprite.origin
			 scaleUniform:0.65
				  effects:SpriteEffectsNone 
			   layerDepth:0.1];
		if (pos.x > 400) {
			pos.x = -5;
			pos.y += 10;
		} else {
			pos.x += 25;
		}
	}
	
	[spriteBatch end];
}

- (void) unloadContent {
	[content unload];
}

- (void) dealloc {
	[ballSprite release];
	[padSprite release];
	[brick1Sprite release];
	[brick2Sprite release];
	[content release];
	[spriteBatch release];
	
//	[blendState release];
//	[depthStencilState release];
//	[rasterizerState release];
//	[effect release];
//	[transformMatrix release];
	
	[super dealloc];
}

@end
