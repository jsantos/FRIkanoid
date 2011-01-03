//
//  GridScene.m
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GridScene.h"
#import "GameDefaults.Scene.h"
#import "GameDefaults.Scene.Objects.h"

@implementation GridScene

- (id) initWithGame:(Game *) theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		grid = [[NSMutableDictionary alloc] init];
		[super.itemAdded subscribeDelegate:
		 [Delegate delegateWithTarget:self Method:@selector(itemAddedToParent:eventArgs:)]];
		[super.itemRemoved subscribeDelegate:
		 [Delegate delegateWithTarget:self Method:@selector(itemRemovedFromParent:eventArgs:)]];
	}
	return self;
}

- (NSArray*) getItemsAt:(XniPoint *)gridCoordinate {
	NSMutableArray *itemsAtCoordinate = [grid objectForKey:gridCoordinate];
	return [NSArray arrayWithArray:itemsAtCoordinate];
}

- (NSArray*) getItemsAround:(XniPoint *)gridCoordinate neighbourDistance:(int)distance {
	NSMutableArray *itemsAround = [NSMutableArray array];
	
	for (int i = gridCoordinate.x - distance; i <= gridCoordinate.x + distance; i++) {
		for (int j = gridCoordinate.y - distance; j <= gridCoordinate.y + distance; j++) {
			NSMutableArray *itemsAtCoordinate = [grid objectForKey:[XniPoint pointWithX:i y:j]];
			[itemsAround addObjectsFromArray:itemsAtCoordinate];
		}
	}
	return itemsAround;
}

- (void) itemAddedToParent:(id<IScene>)scene eventArgs:(SceneEventArgs*)e {
	XniPoint *gridCoordinate = [self calculateGridCoordinateForItem:e.item];
	
	if (gridCoordinate) {
		NSMutableArray *itemsAtCoordinate = [grid objectForKey:gridCoordinate];
		if (!itemsAtCoordinate) {
			itemsAtCoordinate = [NSMutableArray array];
			[grid setObject:itemsAtCoordinate forKey:gridCoordinate];
		}
		[itemsAtCoordinate addObject:e.item];
	}
}

- (void) itemRemovedFromParent:(id<IScene>)scene eventArgs:(SceneEventArgs*)e {
	XniPoint *gridCoordinate = [self calculateGridCoordinateForItem:e.item];
	
	if (gridCoordinate) {
		NSMutableArray *itemsAtCoordinate = [grid objectForKey:gridCoordinate];
		[itemsAtCoordinate removeObject:e.item];
	}
}

- (XniPoint*) calculateGridCoordinateForItem:(id)item {
	id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
	Vector2 *position = [item isKindOfClass:[Vector2 class]] ? item : nil;
	
	if (itemWithPosition) {
		position = itemWithPosition.position;
	}
	
	if (position) {
		return [XniPoint pointWithX:floorf(position.x) y:floorf(position.y)];
	} else {
		return nil;
	}
}

- (void) dealloc {
	[grid dealloc];
	[super dealloc];
}
					

@end
