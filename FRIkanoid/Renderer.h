//
//  Renderer.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Chomponthis.FRIkanoid.classes.h";
#import "DrawableGameComponent.h"
#import "GameDefaults.Graphics.h"

@interface Renderer : DrawableGameComponent {
	//Resources
	
	ContentManager *content;
	
	Sprite *ballSprite;
	Sprite *padSprite;
	Sprite *bigPadSprite;
	Sprite *bgSprite;
	Sprite *powerUpFSprite;
	Sprite *powerUpSSprite;
	Sprite *powerUpLSprite;
	Sprite *powerUpGSprite;
	Sprite *brick1Sprite;
	Sprite *brick2Sprite;
	Sprite *brick3Sprite;
	Sprite *brick4Sprite;
	Sprite *liveSprite;

	PrimitiveBatch *primitiveBatch;
	
	NSMutableArray *brickSprites;
	
	
	//Graphic Objects
	SpriteBatch *spriteBatch;
	
	//Gameplay
	GamePlay *gamePlay;
	
//	BlendState *blendState;
//	DepthStencilState *depthStencilState;
//	RasterizerState *rasterizerState;
//	Effect *effect;
//	Matrix *transformMatrix;
}

- (id) initWithGame:(Game *)theGame gamePlay:(GamePlay*) theGamePlay;

@end
