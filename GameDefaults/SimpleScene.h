//
//  SimpleScene.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IScene.h"


@interface SimpleScene : NSObject <IScene> {
	NSMutableArray *items;
}

@end
