//
//  SceneEventArgs.m
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SceneEventArgs.h"


@implementation SceneEventArgs

- (id) initWithItem:(id)theItem {
	self = [super init];
	if (self != nil) {
		item = theItem;
	}
	return self;
}

+ (SceneEventArgs*) eventArgsWithItem:(id)theItem {
	return [[[SceneEventArgs alloc] initWithItem:theItem] autorelease];
}

@synthesize item;

@end
