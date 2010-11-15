//
//  IScene.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol IScene <NSFastEnumeration>

- (void) addItem:(id)item;
- (void) removeObjectsAtIndex:(NSMutableIndexSet*)set;

@end
