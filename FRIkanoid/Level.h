//
//  Level.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"

@interface Level : NSObject {
	Scene *scene;
	Ball *ball;
	Pad *playerPad;
	NSMutableArray *bricks;
}

@property (nonatomic, retain) Scene *scene;

@end