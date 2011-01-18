//
//  LeaderBoardMenu.h
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"

@interface LeaderBoardMenu : Menu {
	Label *placeholder;
	Image *logo;
	Button *resetScores;
	Label *firstPlace, *secondPlace, *thirdPlace;
}

@end
