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
	Image *logo;
	Label *featuring, *doneWith, *doneWithin, *address;
}

@end
