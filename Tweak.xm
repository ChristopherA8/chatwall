#include "Tweak.h"

%group ChatWall

%hook CKTranscriptCollectionViewController
-(void)viewDidLoad {
	%orig;
	// Remove square black mask around message bubbles
	self.shouldUseOpaqueMask = NO;
	// Remove black background
	self.collectionView.backgroundColor = UIColor.clearColor;
}
%end

%hook CKGradientReferenceView
-(void)setFrame:(CGRect)arg1 {
	%orig;
	// Remove black background
	self.backgroundColor = UIColor.clearColor;
}
%end

%hook CKRecipientSelectionController
-(void)viewDidAppear:(BOOL)animated {
	%orig;
	self.view.backgroundColor = UIColor.blackColor;
}
%end

%hook CKComposeRecipientSelectionController
-(void)viewDidLoad {
	%orig;

	self.view.backgroundColor = UIColor.blackColor;
	if (!wallpaperViewTwo) {
		wallpaperViewTwo = [[UIImageView alloc] initWithFrame:[self.view bounds]];
		[wallpaperViewTwo setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[wallpaperViewTwo setContentMode:UIViewContentModeScaleAspectFill];
	}

	NSData *data = [preferences objectForKey:@"wallpaperImage"];
	wallpaper = [UIImage imageWithData:data];
	[wallpaperViewTwo setImage:wallpaper];
	if (![wallpaperViewTwo isDescendantOfView:self.view]) [self.view insertSubview:wallpaperViewTwo atIndex:0];
}
// Don't do this
-(void)viewDidAppear:(BOOL)animated {
	%orig;
	self.view.backgroundColor = UIColor.blackColor;
	if (!wallpaperViewTwo) {
		wallpaperViewTwo = [[UIImageView alloc] initWithFrame:[self.view bounds]];
		[wallpaperViewTwo setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[wallpaperViewTwo setContentMode:UIViewContentModeScaleAspectFill];
	}

	NSData *data = [preferences objectForKey:@"wallpaperImage"];
	wallpaper = [UIImage imageWithData:data];
	[wallpaperViewTwo setImage:wallpaper];
	if (![wallpaperViewTwo isDescendantOfView:self.view]) [self.view insertSubview:wallpaperViewTwo atIndex:0];
}
%end

%hook CKMessagesController
-(void)viewDidLoad {
	%orig;

	self.view.backgroundColor = UIColor.blackColor;
	if (!wallpaperView) {
		wallpaperView = [[UIImageView alloc] initWithFrame:[self.view bounds]];
		[wallpaperView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[wallpaperView setContentMode:UIViewContentModeScaleAspectFill];
	}

	NSData *data = [preferences objectForKey:@"wallpaperImage"];
	wallpaper = [UIImage imageWithData:data];
	[wallpaperView setImage:wallpaper];
	if (![wallpaperView isDescendantOfView:self.view]) [self.view insertSubview:wallpaperView atIndex:0];
	
}
%end

%end // %group ChatWall

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.chr1s.chatwallprefs"];
	[preferences registerBool:&enabled default:YES forKey:@"enabled"];
	if (enabled) {
		%init(ChatWall);
	}
}