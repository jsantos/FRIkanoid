//
//  Sprite.m
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"
#import "Chomponthis.FRIkanoid.h"

@implementation Sprite

@synthesize texture;
@synthesize sourceRectangle;
@synthesize origin;


- (void) dealloc {
	[texture release];
	[sourceRectangle release];
	[origin release];
	[super dealloc];
}
@end
