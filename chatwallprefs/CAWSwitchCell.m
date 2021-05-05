#import "CAWSwitchCell.h"
#import "UIColor+Hex.h"

@implementation CAWSwitchCell

-(id)initWithStyle:(int)style reuseIdentifier:(id)identifier specifier:(id)specifier { //init method
	self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier]; //call the super init method
	if (self) {
		[((UISwitch *)[self control]) setOnTintColor:[UIColor pf_colorWithHexString:@"1D9E9C" alpha:1.0f]]; //change the switch color
	}
	return self;
}

@end