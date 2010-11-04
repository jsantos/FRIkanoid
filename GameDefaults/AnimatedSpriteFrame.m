//
//  AnimatedSpriteFrame.m
//  GameDefaults
//
//  Created by jsantos on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AnimatedSpriteFrame.h"


@implementation AnimatedSpriteFrame

- (id) initWithSprite:(Sprite *)theSprite start:(NSTimeInterval)theStart
{
	self = [super init];
	if (self != nil) {
		sprite = [theSprite retain];
		start = theStart;
	}
	return self;
}

+ (id) frameWithSprite:(Sprite *)theSprite start:(NSTimeInterval)theStart {
	return [[[AnimatedSpriteFrame alloc] initWithSprite:theSprite start:theStart] autorelease];
}

@synthesize sprite;
@synthesize start;

- (void) dealloc
{
	[sprite release];
	[super dealloc];
}


@end
