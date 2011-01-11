//
//  GameState.h
//  FRIkanoid
//
//  Created by jsantos on 1/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRIkanoid.h"

@interface GameState : GameComponent {
	FRIkanoid *frikanoid;
}

- (void) activate;
- (void) deactivate;

@end