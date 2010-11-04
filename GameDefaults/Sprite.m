//
//  Sprite.m
//  GameDefaults
//
//  Created by jsantos on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"


@implementation Sprite

@synthesize texture;
@synthesize sourceRectangle;
@synthesize origin;

- (void) dealloc
{
	[texture release];
	[sourceRectangle release];
	[origin release];
	[super dealloc];
}

@end