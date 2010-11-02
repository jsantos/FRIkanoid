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

@interface Renderer : DrawableGameComponent {
	//Resources
	
	Sprite *ballSprite;
	Sprite *padSprite;
	Sprite *bgSprite;
	Sprite *brick1Sprite;
	Sprite *brick2Sprite;

	
	NSMutableArray *brickSprites;
	
	//Graphic Objects
	SpriteBatch *spriteBatch;
	
	//Level
	Level *level;
}

- (id) initWithGame:(Game *)theGame level:(Level*) theLevel;

@end
