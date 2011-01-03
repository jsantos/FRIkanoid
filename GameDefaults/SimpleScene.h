//
//  SimpleScene.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IScene.h"
#import "GameComponent.h"


@interface SimpleScene : GameComponent <IScene> {
	NSMutableArray *items;
	
	//List of adds and removes to be executed on the scene
	NSMutableArray *actions;
	
	Event *itemAdded;
	Event *itemRemoved;
}

@end
