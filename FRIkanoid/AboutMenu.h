//
//  AboutMenu.h
//  FRIkanoid
//
//  Created by jsantos on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"

@interface AboutMenu : Menu {
	Button *xniLink, *gameteamLink, *sievertlink;
	Label *featuring, *doneWith, *visitUs, *doneWithin, *address, *artwork;
	SpriteFont *arkanoid5;
}

@end
