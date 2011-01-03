//
//  SceneAction.m
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SceneAction.h"


@implementation SceneAction

@synthesize operation, item;

+ (SceneAction*) actionWithOperation:(SceneOperation)theOperation item:(id)theItem {
	SceneAction *action = [[[SceneAction alloc] init] autorelease];
	action.operation = theOperation;
	action.item = theItem;
	return action;
}

- (void) dealloc {
	[item release];
	[super dealloc];
}

@end
