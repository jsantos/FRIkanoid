//
//  IScene.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IScene <NSObject, NSFastEnumeration, IUpdatable>

- (void) addItem:(id)item;
- (void) removeItem:(id)item;
- (void) removeObjectsAtIndexes:(NSMutableIndexSet*)set;
- (int) indexOfItem:(id)item;
- (void) removeObjectIdenticalTo:(id)item;
- (BOOL) containsObject:(id)item;
- (void) clear;
- (int) count;

@property (nonatomic, readonly) Event *itemAdded;
@property (nonatomic, readonly) Event *itemRemoved;

@end
