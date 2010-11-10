//
//  IParticle.h
//  GameDefaults
//
//  Created by jsantos on 11/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMovable.h"
#import "IMass.h"
#import "IParticleColider.h"

@protocol IParticle <IMovable, IMass, IParticleColider>


@end
