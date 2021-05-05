#import "CAWHeaderCell.h"
#import "UIView+Constraints.h"
#import "UIColor+Hex.h"
#import <Preferences/PSSpecifier.h>

@implementation CAWHeaderCell
- (id)initWithSpecifier:(PSSpecifier *)specifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell" specifier:specifier];
    _height = ((NSNumber *)specifier.properties[@"height"]).floatValue ? ((NSNumber *)specifier.properties[@"height"]).floatValue : 50.0f;
	if (self) {
        self.backgroundColor = UIColor.clearColor;

        if (NO) {
            self.layer.cornerRadius = 20;
            if (@available(iOS 13, *)) {
                self.layer.cornerCurve = kCACornerCurveContinuous;
            }
        }

        if (@available(iOS 13, *)) {
            _headerImageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"globe"]];
        }

		_label = [[UILabel alloc] init];
		// [_label setLineBreakMode:NSLineBreakByWordWrapping];
		[_label setNumberOfLines:1];
		[_label setText:specifier.properties[@"title"] ? specifier.properties[@"title"] : @"Missing Title"];
        [_label setTextColor:[UIColor pf_colorWithHexString:specifier.properties[@"titleColor"] ? specifier.properties[@"titleColor"] : @"000000" alpha:1.0f]];
		[_label setTextAlignment:NSTextAlignmentCenter];
		[_label setFont:[UIFont fontWithName:@"PingFangHK-Medium" size:50.0f]];

		[self addSubview:_headerImageView];
		[self addSubview:_label];

        [_headerImageView anchorTop:self.topAnchor
         leading:self.leadingAnchor
          bottom:self.bottomAnchor
        trailing:nil
         padding:UIEdgeInsetsMake(10,20,10,10)
            size:CGSizeMake(70,70)];

        [_label anchorTop:self.topAnchor
         leading:_headerImageView.trailingAnchor
          bottom:self.bottomAnchor
        trailing:self.trailingAnchor
         padding:UIEdgeInsetsMake(10,10,10,10)
            size:CGSizeZero];
	}
	return self;
}

- (CGFloat)preferredHeightForWidth:(CGFloat)width {
	// Return a custom cell height.
	return _height;
}
@end