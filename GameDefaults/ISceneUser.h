//
//  ISceneUser.h
//  GameDefaults
//
//  Created by jsantos on 11/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDefaults.Scene.classes.h"


@protocol ISceneUser <NSObject>

@property (nonatomic, retain) id<IScene> scene;

@optional

- (void) addedToTheScene:(id<IScene>)scene;
- (void) removedFromScene:(id<IScene>)scene;


@end
