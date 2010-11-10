//
//  Rectangle+Extensions.m
//  FRIkanoid
//
//  Created by jsantos on 11/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Rectangle+Extensions.h"


@implementation Rectangle (Extensions)

- (BOOL) containsVector:(Vector2 *)value {
	return (value.x >= data.x && value.x <= data.x + data.width &&
			value.y >= data.y && value.y <= data.y + data.height);
}

@end
