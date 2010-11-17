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

@implementation Renderer

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
		content = [[ContentManager alloc] initWithServiceProvider:self.game.services];
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
	ballSprite.sourceRectangle = [Rectangle rectangleWithX:238 y:179 width:36 height:36];
	ballSprite.origin = [Vector2 vectorWithX:30 y:30];
	
	padSprite = [[Sprite alloc] init];
	padSprite.texture = [self.game.content load:@"Arkanoid2"];
	padSprite.sourceRectangle = [Rectangle rectangleWithX:54 y:345 width:227 height:150];
	padSprite.origin = [Vector2 vectorWithX:120 y:100];
	
	brick1Sprite = [[Sprite alloc] init];
	brick1Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick1Sprite.sourceRectangle = [Rectangle rectangleWithX:65 y:64 width:92 height:38];
	brick1Sprite.origin = [Vector2 vectorWithX:23 y:55];
	
	brick2Sprite = [[Sprite alloc] init];
	brick2Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick2Sprite.sourceRectangle = [Rectangle rectangleWithX:65 y:122 width:92 height:38];
	brick2Sprite.origin = [Vector2 vectorWithX:23 y:55];
		
	brick3Sprite = [[Sprite alloc] init];
	brick3Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick3Sprite.sourceRectangle = [Rectangle rectangleWithX:65 y:178 width:92 height:38];
	brick3Sprite.origin = [Vector2 vectorWithX:23 y:55];
	
	brick4Sprite = [[Sprite alloc] init];
	brick4Sprite.texture = [self.game.content load:@"Arkanoid2"];
	brick4Sprite.sourceRectangle = [Rectangle rectangleWithX:65 y:235 width:92 height:38];
	brick4Sprite.origin = [Vector2 vectorWithX:23 y:55];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	
	[self.graphicsDevice clearWithColor: [Color steelBlue]];
	
	[spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil];
	
	for (id item in level.scene) {
		id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)]  ? item : nil;
		Sprite *sprite;
		
		if ([item isKindOfClass:[Ball class]]) {
			sprite = ballSprite;
		} else if ([item isKindOfClass:[Pad class]]) {
			sprite = padSprite;
		} else if ([item isKindOfClass:[Brick class]]) {
			id<IBrickType> itemBrick = [item conformsToProtocol:@protocol(IBrickType)] ? item : nil;
			switch (itemBrick.brickType) {
				default:
				case 0:
					sprite = brick1Sprite;
					break;
				case 1:
					sprite = brick2Sprite;	
					break;
				case 2:
					sprite = brick3Sprite;
					break;
				case 3:
					sprite = brick4Sprite;
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
	[super dealloc];
}

@end
