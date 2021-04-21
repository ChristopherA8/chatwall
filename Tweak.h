#import <Cephei/HBPreferences.h>

HBPreferences* preferences = nil;

BOOL enabled = NO;

UIImageView *wallpaperView = nil;
UIImage *wallpaper = nil;

@interface CKTranscriptCollectionView : UIView
@end

@interface CKTranscriptCollectionViewController
@property (nonatomic, assign, readwrite) BOOL shouldUseOpaqueMask;
@property (nonatomic, retain) CKTranscriptCollectionView * collectionView;
-(void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated ;
@end

@interface CKGradientReferenceView : UIView
@end

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