//
//  PhysicsEngine.h
//  FRIkanoid
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.h"

@interface PhysicsEngine : GameComponent {
	// Level
	Level *level;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
