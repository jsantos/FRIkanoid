//
//  MainMenu.h
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.h"

@interface MainMenu : GameState {
	SimpleScene *scene;
	GuiRenderer *renderer;
	GamePlay *currentGameplay;
	SpriteFont *retrotype, *fivexfive;
	Texture2D *buttonBackground;
	
	Button *back;
	
	Image *logo;
	Button *startGame, *leaderboards, *options;
}

@end
