//
//  MainMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation MainMenu

- (void) initialize {
	[super initialize];
	
	if (!frikanoid.mutedMusic) {
		Song *menuSong = [self.game.content load:@"sievert-party_dog"];
		[MediaPlayer playSong:menuSong];
	}
	
	[scene addItem:background];
	
	// Buttons
	
	if (self.game.window.clientBounds.width == 1024) {
		startGame = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:400 width:260 height:32] 
										   background:nil font:retrotype text:@"Start Game"];
		startGame.labelColor = [Color white];
		startGame.labelHoverColor = [Color blue];
		[startGame.backgroundImage setScaleUniform:2];
		[scene addItem:startGame];
		
		options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:450 width:260 height:32] 
										 background:nil font:retrotype text:@"Options"];
		options.labelColor = [Color white];
		options.labelHoverColor = [Color blue];
		//options.label.position.x = (self.game.window.clientBounds.width/2)-45;
		[options.backgroundImage setScaleUniform:2];
		[scene addItem:options];
		
		leaderboards = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:500 width:260 height:32]
											  background:nil font:retrotype text:@"LeaderBoard"];
		leaderboards.labelColor = [Color white];
		leaderboards.labelHoverColor = [Color blue];
		[leaderboards.backgroundImage setScaleUniform:2];
		[scene addItem:leaderboards];
		
		about = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/2 y:550 width:260 height:32]
									   background:nil font:retrotype text:@"About"];
		about.labelColor = [Color white];
		about.labelHoverColor = [Color blue];
		[about.backgroundImage setScaleUniform:2];
		[scene addItem:about];
	} else {
		startGame = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/3 y:120 width:260 height:32] 
										   background:nil font:retrotype text:@"Start Game"];
		startGame.labelColor = [Color white];
		startGame.labelHoverColor = [Color blue];
		[startGame.backgroundImage setScaleUniform:2];
		[scene addItem:startGame];
		
		options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/3 y:160 width:260 height:32] 
										 background:nil font:retrotype text:@"Options"];
		options.labelColor = [Color white];
		options.labelHoverColor = [Color blue];
		//options.label.position.x = (self.game.window.clientBounds.width/2)-45;
		[options.backgroundImage setScaleUniform:2];
		[scene addItem:options];
		
		leaderboards = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/3 y:200 width:260 height:32]
											  background:nil font:retrotype text:@"LeaderBoard"];
		leaderboards.labelColor = [Color white];
		leaderboards.labelHoverColor = [Color blue];
		[leaderboards.backgroundImage setScaleUniform:2];
		[scene addItem:leaderboards];
		
		about = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:self.game.window.clientBounds.width/2-260/3 y:240 width:260 height:32]
									   background:nil font:retrotype text:@"About"];
		about.labelColor = [Color white];
		about.labelHoverColor = [Color blue];
		[about.backgroundImage setScaleUniform:2];
		[scene addItem:about];
	}
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
	if (startGame.wasReleased) {
		//[MediaPlayer pause];
		if (currentGameplay) {
			[self.game.components removeComponent:currentGameplay];
			[currentGameplay release];
		}
		[SoundEngine play:Teaser];
		newState = [[GamePlay alloc] initSinglePlayerWithGame:self.game LevelClass:[frikanoid getLevelClass:0] andScore:0 andLives:3  andLevelNum:0];
		currentGameplay = (GamePlay*)newState;
	}
	
	if (options.wasReleased) {
		newState = [[[OptionsMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if (leaderboards.wasReleased) {
		newState = [[[LeaderBoardMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if(about.wasReleased){
		newState = [[[AboutMenu alloc] initWithGame:self.game] autorelease];
	}
	
	if (newState) {
		[frikanoid pushState:newState];
	}
}

- (void) dealloc {
	[startGame release];
	[leaderboards release];
	[options release];
	[about release];
	[currentGameplay release];
	[super dealloc];
}

@end
