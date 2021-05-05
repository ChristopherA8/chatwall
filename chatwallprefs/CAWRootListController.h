#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <Cephei/HBRespringController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <CepheiPrefs/HBLinkTableCell.h>
#import <CepheiPrefs/HBTwitterCell.h>
#import <Cephei/HBPreferences.h>

@interface CAWRootListController : PSListController
@property (nonatomic, retain) UIBarButtonItem *saveButton;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UIImageView *iconView;
-(void)killApp;
-(void)discord;
-(void)paypal;
-(void)sourceCode;
@end