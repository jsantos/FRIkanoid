//
//  OptionsMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OptionsMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation OptionsMenu

- (void) initialize{
	[super initialize];
	
	if (self.game.window.clientBounds.width == 1024) {
		if (frikanoid.mutedSFX) {
			switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:400 width:260 height:32] 
												 background:nil font:retrotype text:@"SFX - Off"];
		} else {
			switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:400 width:260 height:32] 
												 background:nil font:retrotype text:@"SFX - On"];
		}
		
		if (frikanoid.mutedMusic) {
			switchMusic = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:450 width:260 height:32] 
												 background:nil font:retrotype text:@"Music - Off"];
		} else {
			switchMusic = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:450 width:260 height:32] 
												 background:nil font:retrotype text:@"Music - On"];
		}
	} else {
		if (frikanoid.mutedSFX) {
			switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:130 width:260 height:32] 
												 background:nil font:retrotype text:@"SFX - Off"];
		} else {
			switchSound = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:130 width:260 height:32] 
												 background:nil font:retrotype text:@"SFX - On"];
		}
		
		if (frikanoid.mutedMusic) {
			switchMusic = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:180 width:260 height:32] 
												 background:nil font:retrotype text:@"Music - Off"];
		} else {
			switchMusic = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:180 width:260 height:32] 
												 background:nil font:retrotype text:@"Music - On"];
		}
	}

	switchSound.labelColor = [Color white];
	switchSound.labelHoverColor = [Color blue];
	//switchSound.label.position.x = (self.game.window.clientBounds.width/2)-50;
	[switchSound.backgroundImage setScaleUniform:2];
	[scene addItem:switchSound];
	
	switchMusic.labelColor = [Color white];
	switchMusic.labelHoverColor = [Color blue];
	//switchMusic.label.position.x = (self.game.window.clientBounds.width/2)-55;
	[switchMusic.backgroundImage setScaleUniform:2];
	[scene addItem:switchMusic];
	
	[scene addItem:back];
	[scene addItem:background];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	if (switchSound.wasReleased) {
		if ([switchSound.label.text isEqualToString:@"SFX - On"]) {
			switchSound.label.text = @"SFX - Off";
			frikanoid.mutedSFX = YES;
			[SoundEngine play:MuteSounds];
		} else {
			switchSound.label.text = @"SFX - On";
			frikanoid.mutedSFX = NO;
			[SoundEngine play:MuteSounds];
		}
	}
	
	if (switchMusic.wasReleased) {
		if (frikanoid.mutedMusic) {
			frikanoid.mutedMusic = NO;
			switchMusic.label.text = @"Music - On";
			[MediaPlayer resume];
		} else {
			frikanoid.mutedMusic = YES;
			switchMusic.label.text = @"Music - Off";
			[MediaPlayer pause];
		}

	}
}

- (void) dealloc {
	[switchMusic release];
	[switchSound release];

	[super dealloc];
}

@end
