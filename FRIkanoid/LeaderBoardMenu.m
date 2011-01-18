//
//  LeaderBoardMenu.m
//  FRIkanoid
//
//  Created by jsantos on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LeaderBoardMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation LeaderBoardMenu

- (void) initialize{
	[super initialize];

	placeholder = [[Label alloc] initWithFont:retrotype text:@"Coming soon!" position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-80 y:175]];
	placeholder.color = [Color white];
	[scene addItem:placeholder];

	[scene addItem:back];
	
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:30]];
	[scene addItem:logo];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
}


- (void) dealloc {
	[logo release];
	[back release];
	[super dealloc];
}

@end
