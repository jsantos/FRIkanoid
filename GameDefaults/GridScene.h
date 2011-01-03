//
//  GridScene.h
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleScene.h"


@interface GridScene : SimpleScene {
	NSMutableDictionary *grid;
}

- (NSArray*) getItemsAt:(XniPoint*)gridCoordinate;
- (NSArray*) getItemsAround:(XniPoint*)gridCoordinate neighbourDistance:(int)distance;

//Override this if you calculate grid coordinates from something other that IPosition or Vector2.
- (XniPoint*) calculateGridCoordinateForItem:(id)item;

@end
