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

- (void) removeObjectsAtIndexes:(NSMutableIndexSet*)set {
	[items removeObjectsAtIndexes:set];
}

- (int) indexOfItem:(id)item {
	return [items indexOfObject:item];
}

- (void) removeObjectIdenticalTo:(id)item {
	return [items removeObjectIdenticalTo:item];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len {
	return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) clear {
	[items removeAllObjects];
}

- (int) count {
	return [items count];
}

- (void) dealloc {
	[items release];
	[super dealloc];
}

@end
