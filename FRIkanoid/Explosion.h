//
//  Explosion.h
//  FRIkanoid
//
//  Created by jsantos on 11/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.classes.h"
#import "GameDefaults.Scene.Objects.h"

@interface Explosion : NSObject<IPosition, ILifetime> {
	Vector2 *position;
	Lifetime *lifetime;
	int random;
}

@property (nonatomic, readonly) int random;

- (id) initWithGameTime: (GameTime*) gameTime;

@end
