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
	
	//  Left Pad Sprite
	leftPadSprite = [[Sprite alloc] init];
	leftPadSprite.texture = [self.game.content load:@"Arkanoid2"];
	leftPadSprite.sourceRectangle = [Rectangle rectangleWithX:82 y:355 width:30 height:20];
	leftPadSprite.origin = [Vector2 vectorWithX:15 y:10];

	//  Middle Pad Sprite	
	middlePadSprite = [[Sprite alloc] init];
	middlePadSprite.texture = [self.game.content load:@"Arkanoid2"];
	middlePadSprite.sourceRectangle = [Rectangle rectangleWithX:110 y:355 width:60 height:20];
	middlePadSprite.origin = [Vector2 vectorWithX:30 y:10];

	//	Right Pad Sprite
	rightPadSprite = [[Sprite alloc] init];
	rightPadSprite.texture = [self.game.content load:@"Arkanoid2"];
	rightPadSprite.sourceRectangle = [Rectangle rectangleWithX:162 y:355 width:30 height:20];
	rightPadSprite.origin = [Vector2 vectorWithX:15 y:10];
	
//	padSprite = [[Sprite alloc] init];
//	padSprite.texture = [self.game.content load:@"Arkanoid2"];
//	padSprite.sourceRectangle = [Rectangle rectangleWithX:82 y:350 width:165 height:30];
//	padSprite.origin = [Vector2 vectorWithX:82.5 y:15];
	
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
	
	Texture2D *explosionTexture = [[self.game.content load:[NSString stringWithFormat:@"Explosion"]] autorelease];
	explosionSprite = [[AnimatedSprite alloc] initWithDuration:1];
	
	for (int i = 0; i < 16; i++) {
		int row = i % 4;
		int column = i / 4;
		Sprite *sprite = [[[Sprite alloc] init] autorelease];
		sprite.texture = explosionTexture;
		sprite.sourceRectangle = [Rectangle rectangleWithX:column * 128 y:row * 128 width:128 height:128];
		sprite.origin = [Vector2 vectorWithX:64 y:64];
		AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:explosionSprite.duration * (float)i / 16];
		[explosionSprite addFrame:frame];
	}
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
		
		Pad *pad = [itemWithPosition isKindOfClass:[Pad class]] ? item : nil;
		
		if (pad) {
//			[primitiveBatch beginWithBlendState:blendState DepthStencilState:depthStencilState 
//								RasterizerState:rasterizerState Effect:effect TransformMatrix:transformMatrix];
//			[primitiveBatch drawPointAt:pad.position color:[Color black]];
//			[primitiveBatch drawRectangleAt:pad.position width:pad.width height:pad.height color:[Color black]];
//			[primitiveBatch end];
			
			
			Rectangle *padLeftDestination = [Rectangle rectangleWithX:pad.position.x - pad.width/2 
																	   y:pad.position.y - pad.height / 2
																   width:leftPadSprite.sourceRectangle.width
																  height:leftPadSprite.sourceRectangle.height]; 
			[spriteBatch draw:leftPadSprite.texture toRectangle:padLeftDestination fromRectangle:leftPadSprite.sourceRectangle tintWithColor:[Color white]];
			
			Rectangle *padRightDestination = [Rectangle rectangleWithX:pad.position.x + pad.width/2 - rightPadSprite.sourceRectangle.width -2 //Hardcore cheat
																		y:pad.position.y - pad.height / 2
																	width:rightPadSprite.sourceRectangle.width
																   height:rightPadSprite.sourceRectangle.height]; 
			[spriteBatch draw:rightPadSprite.texture toRectangle:padRightDestination fromRectangle:rightPadSprite.sourceRectangle tintWithColor:[Color white]];
			
			Rectangle *padMiddleDestination = [Rectangle rectangleWithX:pad.position.x - pad.width/2 + leftPadSprite.sourceRectangle.width
																		 y:pad.position.y - pad.height / 2
																	 width:pad.width - rightPadSprite.sourceRectangle.width - rightPadSprite.sourceRectangle.width
																	height:middlePadSprite.sourceRectangle.height];
			[spriteBatch draw:middlePadSprite.texture toRectangle:padMiddleDestination fromRectangle:middlePadSprite.sourceRectangle tintWithColor:[Color white]];
			
		} else if (itemWithPosition && sprite) {
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
	
	// Draw effects in additive mode.
	[spriteBatch beginWithSortMode:SpriteSortModeDeffered BlendState:[BlendState additive] SamplerState:nil DepthStencilState:nil RasterizerState:nil Effect:nil];
	
	for (id<NSObject> item in gamePlay.level.scene) {
		if ([item isKindOfClass:[Explosion class]]) {
			Explosion *explosion = (Explosion*)item;
			
			Sprite *sprite = [explosionSprite spriteAtTime:explosion.lifetime.progress];
			SpriteEffects effects = explosion.random & (SpriteEffectsFlipHorizontally | SpriteEffectsFlipVertically);
			if (sprite) {
				[spriteBatch draw:sprite.texture to:explosion.position fromRectangle:sprite.sourceRectangle tintWithColor:[Color white]
						 rotation:0 origin:sprite.origin scaleUniform:0.65 effects:effects layerDepth:0];
			}
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
	[content release];
	[spriteBatch release];
	[bigPadSprite release];
	[powerUpFSprite release];
	[powerUpSSprite release];
	[powerUpLSprite release];
	[powerUpGSprite release];
	[brick1Sprite release];
	[brick2Sprite release];
	[brick3Sprite release];
	[brick4Sprite release];
	[liveSprite release];
	
//	[blendState release];
//	[depthStencilState release];
//	[rasterizerState release];
//	[effect release];
//	[transformMatrix release];
	
	[super dealloc];
}

@end
