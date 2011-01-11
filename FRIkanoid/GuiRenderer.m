//
//  GuiRenderer.m
//  FRIkanoid
//
//  Created by jsantos on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GuiRenderer.h"
#import "GameDefaults.Mirage.h"
#import "Chomponthis.FRIkanoid.h"

@implementation GuiRenderer

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene {
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = theScene;
	}
	return self;
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[spriteBatch beginWithSortMode:SpriteSortModeDeffered 
						BlendState:nil
						SamplerState:[SamplerState pointClamp]
						DepthStencilState:nil
						RasterizerState:nil];
	
	for (id item in scene) {
		Label *label = [item isKindOfClass:[Label class]] ? item : nil;
		Image *image = [item isKindOfClass:[Image class]] ? item : nil;
		
		if (label) {
			[spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
										 rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
		}
		
		if (image) {
			[spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
					 rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
			}
	}
	[spriteBatch end];
}

- (void) unloadContent {
	[spriteBatch release];
}

@end
