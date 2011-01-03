//
//  SceneEventArgs.h
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventArgs.h"


@interface SceneEventArgs : EventArgs {
	id item;
}

- (id) initWithItem:(id)theItem;
+ (SceneEventArgs*) eventArgsWithItem:(id)theItem;

@property (nonatomic, readonly) id item;

@end
