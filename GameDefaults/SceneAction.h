//
//  SceneAction.h
//  GameDefaults
//
//  Created by jsantos on 1/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	SceneOperationAdd,
	SceneOperationRemove
} SceneOperation;


@interface SceneAction : NSObject {
	SceneOperation operation;
	id item;
}

@property (nonatomic) SceneOperation operation;
@property (nonatomic, retain) id item;

+ (SceneAction*) actionWithOperation:(SceneOperation)theOperation item:(id)theItem;

@end
