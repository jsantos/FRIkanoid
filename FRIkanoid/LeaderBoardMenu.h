//
//  LeaderBoardMenu.h
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.h"

@interface LeaderBoardMenu : GameState {
	SimpleScene *scene;
	GuiRenderer *renderer;
	SpriteFont *retrotype, *fivexfive;
	Texture2D *buttonBackground;
	Label *placeholder;
	Button *back;
	
	Image *logo;
}

@end
