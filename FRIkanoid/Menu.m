//
//  Menu.m
//  FRIkanoid
//
//  Created by jsantos on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Menu.h"
#import "Retronator.Xni.Framework.Media.h"
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
	
	if (!frikanoid.mutedMusic) {
		if ([[[MediaPlayer getInstance] queue] count] > 0) {
			[MediaPlayer resume];
		} else {
			Song *menuSong = [self.game.content load:@"sievert-party_dog"];
			[MediaPlayer playSong:menuSong];
		}
	}
}

- (void) deactivate {
	[MediaPlayer pause];
	[self.game.components removeComponent:scene];
	[self.game.components removeComponent:renderer];
}

- (void) initialize {
	if (self.game.window.clientBounds.width == 1024) {
		FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
		retrotype = [self.game.content load:@"Steiner28" processor:fontProcessor];
	} else {
		FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
		retrotype = [self.game.content load:@"Steiner" processor:fontProcessor];
	}

	
	buttonBackground = [self.game.content load:@"Button"];
	
	if (self.game.window.clientBounds.width == 1024) {
		Texture2D *backgroundTexture = [[self.game.content load:@"MenuiPad"] autorelease];
		background = [[Image alloc] initWithTexture:backgroundTexture position:[Vector2 vectorWithX:0 y:0]];
	} else if (self.game.window.clientBounds.width == 960) {
		Texture2D *backgroundTexture = [[self.game.content load:@"MenuiPhoneHR"] autorelease];
		background = [[Image alloc] initWithTexture:backgroundTexture position:[Vector2 vectorWithX:0 y:0]];
	} else {
		Texture2D *backgroundTexture = [[self.game.content load:@"MenuiPhone"] autorelease];
		background = [[Image alloc] initWithTexture:backgroundTexture position:[Vector2 vectorWithX:0 y:0]];
	}
	
	if (self.game.window.clientBounds.width == 1024) {
		back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-75 y:self.game.window.clientBounds.height - 40 width:260 height:32] 
									  background:nil font:retrotype text:@"Back"];
		back.labelColor = [Color white];
		back.labelHoverColor = [Color blue];
	} else {
		back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-50 y:self.game.window.clientBounds.height - 40 width:260 height:32] 
									  background:nil font:retrotype text:@"Back"];
		back.labelColor = [Color white];
		back.labelHoverColor = [Color blue];
	}

	
	[super initialize];
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
	[background release];
	[logo release];
	[retrotype release];
	[fivexfive release];
	[scene release];
	[renderer release];
	[super dealloc];
}

@end
