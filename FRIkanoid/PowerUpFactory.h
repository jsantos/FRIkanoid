//
//  PowerUpFactory.h
//  FRIkanoid
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Chomponthis.FRIkanoid.h"

@interface PowerUpFactory : NSObject {
	
}

+ (PowerUp*) createPowerUp:(PowerUpType)type;

+ (PowerUp*) createRandomPowerUp;

@end
