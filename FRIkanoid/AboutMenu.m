//
//  AboutMenu.m
//  FRIkanoid
//
//  Created by jsantos on 2/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutMenu.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Media.h"
#import "Retronator.Xni.Framework.COntent.Pipeline.Processors.h"
#import "Chomponthis.FRIkanoid.h"

@implementation AboutMenu

- (void) initialize {
	[super initialize];
	
	[scene addItem:back];
	Texture2D *logoTexture = [[self.game.content load:@"BigLogo"] autorelease];
	logo = [[Image alloc] initWithTexture:logoTexture position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2-logoTexture.width/2) y:30]];
	[scene addItem:logo];
	
	featuring = [[Label alloc] initWithFont:oops text:[NSString stringWithFormat:@"Featuring Jorge Santos et al."] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-160 y:110]];
	featuring.color = [Color white];
	[scene addItem:featuring];
	
	doneWith = [[Label alloc] initWithFont:fivexfive text:[NSString stringWithFormat:@"Done with XNI Framework: xni.retronator.com"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-235 y:145]];
	doneWith.color = [Color white];
	[scene addItem:doneWith];
	
	doneWithin = [[Label alloc] initWithFont:fivexfive text:[NSString stringWithFormat:@"Done within TINR course taught by\nMatej Jan, Bojan Klemenc & Peter Peer"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:165]];
	doneWithin.color = [Color white];
	[scene addItem:doneWithin];
	
	address = [[Label alloc] initWithFont:fivexfive text:[NSString stringWithFormat:@"Computer Vision Lab\nFaculty of Computer and Information Science\nUniversity of Ljubljana\nSlovenia"] position:[Vector2 vectorWithX:(self.game.window.clientBounds.width/2)-230 y:200]];
	address.color = [Color white];
	[scene addItem:address];
}

- (void) dealloc {
	[logo release];
	[featuring release];
	[doneWith release];
	[address release];
	[super dealloc];
}

@end
