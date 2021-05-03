#import <Cephei/HBPreferences.h>
// #import "UIImage+blur.h"

HBPreferences* preferences = nil;

BOOL enabled = NO;
BOOL everywhere = NO;
BOOL transparent = YES;
BOOL hideAppStrip = YES;

UIImageView *wallpaperView = nil;
UIImage *wallpaper = nil;

UIImageView *wallpaperViewTwo = nil;

UIVisualEffectView *effectView;
UIVisualEffectView *effectViewTwo;
UIBlurEffect *blurEffect;

@interface CKTranscriptCollectionView : UIView
@end

@interface CKTranscriptCollectionViewController
@property (nonatomic, assign, readwrite) BOOL shouldUseOpaqueMask;
@property (nonatomic, retain) CKTranscriptCollectionView * collectionView;
-(void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated ;
@end

@interface CKViewController : UIViewController
@end

@interface CKRecipientSelectionController : CKViewController
@end

@interface CKComposeRecipientSelectionController : CKRecipientSelectionController
@end

@interface CKRecipientSelectionView
@end

@interface CKGradientReferenceView : UIView
@end

@interface CKMessagesController : UISplitViewController
@end

@interface CKNavigationController : UINavigationController
@end

// @interface UINavigationController : UIViewController
// @end

/**
  *
  * Note:
  * self.referenceView is a CKGradientReferenceView, I think :)
  *
  **/

@interface CKGradientView
@property (assign,nonatomic) UIView* referenceView;
-(void)didMoveToWindow;
@end