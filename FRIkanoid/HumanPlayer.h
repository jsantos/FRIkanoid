//
//  HumanPlayer.h
//  FRIkanoid
//
//  Created by jsantos on 11/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface HumanPlayer : Player {
	Rectangle *inputArea;
	BOOL grabbed;
	Vector2 *touchOffset;
	//Level *level;
}

//- (id) initWithPad:(Pad *)thePad scene:(id <IScene>)theScene level:(Level*)theLevel game:(Game*)game;

@end
