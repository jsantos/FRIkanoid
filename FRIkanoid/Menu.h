//
//  Menu.h
//  FRIkanoid
//
//  Created by jsantos on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameDefaults.Mirage.h"
#import "GameDefaults.Scene.h"
#import "Retronator.Xni.Framework.Audio.h"
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameState.h"

@interface Menu : GameState {
	Image *background;
	SimpleScene *scene;
	GuiRenderer *renderer;
	SpriteFont *retrotype, *fivexfive, *oops;
	Texture2D *buttonBackground;
	Button *back;
	Image *logo;
}

@end
