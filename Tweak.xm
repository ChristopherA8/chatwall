#include "Tweak.h"

/**
  *
  * Thank you litten for SafariWallpaper
  * This is based heavily off of it
  *
  **/

%group ChatWall

%hook CKTranscriptCollectionViewController
-(void)viewDidLoad {
	%orig;
	self.shouldUseOpaqueMask = NO;
	self.collectionView.backgroundColor = UIColor.clearColor;
}
%end

// %hook CKGradientView
%hook CKGradientReferenceView
// -(void)didMoveToWindow {
-(void)setFrame:(CGRect)arg1 {
	%orig;

	if (!wallpaperView) {
		wallpaperView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[wallpaperView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[wallpaperView setContentMode:UIViewContentModeScaleAspectFill];
	}

	NSData *data = [preferences objectForKey:@"wallpaperImage"];
	wallpaper = [UIImage imageWithData:data];
	[wallpaperView setImage:wallpaper];
	if (![wallpaperView isDescendantOfView:self]) [self insertSubview:wallpaperView atIndex:0];
}
%end

%end

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.chr1s.chatwallprefs"];
	[preferences registerBool:&enabled default:YES forKey:@"enabled"];
	if (enabled) {
		%init(ChatWall);
	}
}