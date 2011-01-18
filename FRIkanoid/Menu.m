//
//  Menu.m
//  FRIkanoid
//
//  Created by jsantos on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Chomponthis.Frikanoid.h"


@implementation Menu

- (id) initWithGame:(Game *)theGame {
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:self.game];
		renderer = [[GuiRenderer alloc] initWithGame:self.game scene:scene];
	}
	return self;
}

- (void) activate {
	[self.game.components addComponent:scene];
	[self.game.components addComponent: renderer];
}

- (void) deactivate {
	[self.game.components removeComponent:scene];
	[self.game.components removeComponent:renderer];
}

- (void) initialize {
	FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
	retrotype = [self.game.content load:@"ArkaType12" processor:fontProcessor];
	fivexfive = [self.game.content load:@"5x5" processor:fontProcessor];
	fivexfive.lineSpacing = 14;
	oops = [self.game.content load:@"Retrotype" processor:fontProcessor];
	
	buttonBackground = [self.game.content load:@"Button"];
	
	back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:110 y:250 width:140 height:32] 
								  background:buttonBackground font:retrotype text:@"Back"];
	back.label.position.x = (self.game.window.clientBounds.width/2)-20;
	back.labelColor = [Color black];
	back.labelHoverColor = [Color white];
	[back.backgroundImage setScaleUniform:2];
	
	[super initialize];
}

- (void) playMusic {
	menuMusic = [[SoundEngine createInstance:Music] retain];
	[menuMusic play];
}

- (void) stopMusic {
	[menuMusic stop];
	[menuMusic release];
}

- (void) updateWithGameTime:(GameTime*)gametime{
	// Update all buttons.
	for (id item in scene) {
		Button *button = [item isKindOfClass:[Button class]] ? item : nil;
		
		if (button) {
			[button update];
		}
	}	
	
	if (back.wasReleased) {
		[frikanoid popState];
	}
}

- (void) dealloc {
	[back release];
	[buttonBackground release];
	[retrotype release];
	[fivexfive release];
	[scene release];
	[renderer release];
	[super dealloc];
}

@end
