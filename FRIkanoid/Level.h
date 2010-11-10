//
//  Level.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.h"

@interface Level : GameComponent {
	SimpleScene *scene;
	Ball *ball;
	Pad *playerPad;
	NSMutableArray *bricks;
}

- (void) reset;

@property (nonatomic, retain) id<IScene> scene;
@property (nonatomic, retain) Ball *ball;
@property (nonatomic, retain) Pad *playerPad;
@property (nonatomic, retain) NSMutableArray *bricks;

@end