//
//  SimpleScene.m
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleScene.h"


@implementation SimpleScene

- (id) init {
	self = [super init];
	if (self != nil) {
		items = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) addItem:(id)item {
	[items addObject:item];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
	return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

@end
