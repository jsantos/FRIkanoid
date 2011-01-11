//
//  GuiRenderer.h
//  FRIkanoid
//
//  Created by jsantos on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDefaults.Scene.h"
#import "Chomponthis.FRIkanoid.classes.h"


@interface GuiRenderer : DrawableGameComponent {
	SpriteBatch *spriteBatch;
	id<IScene> scene;
}

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene;

@end
