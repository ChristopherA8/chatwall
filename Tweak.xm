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
-(void)viewDidAppear:(BOOL)animated {
	%orig;
	self.view.backgroundColor = UIColor.blackColor;
	if (!wallpaperViewTwo) {
		wallpaperViewTwo = [[UIImageView alloc] initWithFrame:[self.view bounds]];
		[wallpaperViewTwo setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[wallpaperViewTwo setContentMode:UIViewContentModeScaleAspectFill];
	}

	if (!effectView) {
		if (@available(iOS 13, *)) {
			blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
			effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
			[effectView setFrame:[self.view bounds]];
			[effectView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
			[effectView setAlpha:[preferences floatForKey:@"alpha"]];
		}
	}
	[effectView setAlpha:[preferences floatForKey:@"alpha"]];

	NSData *data = [preferences objectForKey:@"wallpaperImage"];
	wallpaper = [UIImage imageWithData:data];
	[wallpaperViewTwo setImage:wallpaper];
	if (![wallpaperViewTwo isDescendantOfView:self.view]) [self.view insertSubview:wallpaperViewTwo atIndex:0];
	if (![effectView isDescendantOfView:wallpaperViewTwo]) [wallpaperViewTwo insertSubview:effectView atIndex:0];
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

	if (!effectViewTwo) {
		if (@available(iOS 13, *)) {
			blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
			effectViewTwo = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
			[effectViewTwo setFrame:[self.view bounds]];
			[effectViewTwo setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
			[effectViewTwo setAlpha:[preferences floatForKey:@"alpha"]];
		}
	}
	[effectViewTwo setAlpha:[preferences floatForKey:@"alpha"]];

	NSData *data = [preferences objectForKey:@"wallpaperImage"];
	wallpaper = [UIImage imageWithData:data];
	[wallpaperView setImage:wallpaper];
	if (![wallpaperView isDescendantOfView:self.view]) [self.view insertSubview:wallpaperView atIndex:0];
	if (![effectViewTwo isDescendantOfView:wallpaperView]) [wallpaperView insertSubview:effectViewTwo atIndex:0];
	
}
%end

%end // %group ChatWall

@interface CKConversationListCollectionViewConversationCell : UIView
@end

%group WallpaperEverywhere
%hook CKConversationListCollectionView
-(void)setBackgroundColor:(UIColor *)color {
	%orig(UIColor.clearColor);
}
%end
%hook CKConversationListCollectionViewConversationCell
-(void)setDelegate:(id)delegate {
	%orig;
	for (UIView *view in self.subviews) {
		if ([view isKindOfClass:%c(_UISystemBackgroundView)]) {
			view.hidden = YES;
		}
	}
}
%end
%end

@interface CKMessageEntryView : UIView
@end

%group TransparentMessageEntryView
%hook CKMessageEntryView
-(UIVisualEffectView *)backgroundView {
	return nil;
}
-(UIVisualEffectView *)knockoutView {
	return nil;
}
-(BOOL)shouldShowAppStrip {
	if (hideAppStrip) {
		return NO;
	}
	return %orig;
}
%end
%end

// For screenshots
/* %group screenshots
@interface CKLabel : UILabel
@end

%hook CKLabel
-(void)setText:(NSString *)text {
	%orig(@"Cool Person");
}
%end

@interface CNAvatarView : UIView
@property (nonatomic, copy, readwrite) UIImageView *imageView;
@end

@interface CKAvatarView : CNAvatarView
@end

%hook CKAvatarView
-(void)setImage:(UIImage *)image state:(NSInteger)state {
	// UIImage *blurredImage = [image blurredImageWithImage:image inputRadius:2.0f];
	%orig;
	if (@available(iOS 13, *)) {
		UIImage *faceImage = [UIImage systemImageNamed:@"person.circle"];
		%orig(faceImage, state);
	}
}
%end
%end */

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.chr1s.chatwallprefs"];
	[preferences registerBool:&enabled default:YES forKey:@"enabled"];
	[preferences registerBool:&everywhere default:NO forKey:@"everywhere"];
	[preferences registerBool:&transparent default:YES forKey:@"transparent"];
	[preferences registerBool:&hideAppStrip default:YES forKey:@"appStrip"];

	if (enabled) {
		// %init(screenshots);
		%init(ChatWall);
		if (everywhere) {
			%init(WallpaperEverywhere);
		}
		if (transparent) {
			%init(TransparentMessageEntryView);
		}
	}
}