//
//  Image.m
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Image.h"


@implementation Image

- (id) initWithTexture:(Texture2D *)theTexture position:(Vector2 *)thePosition {
	self = [super init];
	if (self != nil) {
		texture = [theTexture retain];
		position = [thePosition retain];
		
		color = [[Color white] retain];
		origin = [[Vector2 zero] retain];
		scale = [[Vector2 one] retain];
	}
	return self;
}

@synthesize texture, sourceRectangle, color, position, origin, scale, rotation, layerDepth;

- (void) setScaleUniform:(float)value {
	scale.x = value;
	scale.y = value;
}

- (void) dealloc {
	[texture release];
	[sourceRectangle release];
	[color release];
	[position release];
	[origin release];
	[scale release];
	
	[super dealloc];
}

@end
