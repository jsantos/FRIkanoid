//
//  Scene.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Scene.h"

@implementation Scene

- (id) init{
	self = [super init];
	if (self != nil) {
		items = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) addItem:(id)item {
	[items addObject:item];
}

- (NSUInteger) countByEnumeratingWithState:(NSFastEnumerationState *) state 
								   objects:(id *) stackbuf 
									 count:(NSUInteger)len{
	return [items countByEnumeratingWithState:state objects:stackbuf count:len];
}

- (void) dealloc {
	[items release];
	[super dealloc];
}

@end
