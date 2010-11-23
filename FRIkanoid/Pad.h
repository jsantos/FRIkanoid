//
//  Pad.h
//  FRIkanoid
//
//  Created by jsantos on 10/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.Objects.h"

@interface Pad : NSObject <IAxisAlignedRectangleCollider, ICustomCollider> {
	Vector2 *position;
	float width;
	float height;
	BOOL big;
}

@property (nonatomic) BOOL big;

@end
