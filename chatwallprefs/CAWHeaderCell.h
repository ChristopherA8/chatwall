#import <Preferences/PSTableCell.h>

// @interface PSTableCell : UITableViewCell
// @end

/*
		<dict>
			<key>cell</key>
			<string>PSGroupCell</string>
			<key>headerCellClass</key>
			<string>CAWHeaderCell</string>
			<key>title</key>
			<string>ChatWall</string>
			<key>titleColor</key>
			<string>27B7C8</string>
			<key>height</key>
			<integer>100</integer>
		</dict>
*/

/*
		<dict>
			<key>cell</key>
			<string>PSGroupCell</string>
			<key>headerCellClass</key>
			<string>HBPackageNameHeaderCell</string>
			<key>packageIdentifier</key>
			<string>com.chr1s.chatwall</string>
			<key>titleColor</key>
			<string>#0086bf</string>
			<key>condensed</key>
			<false/>
			<key>icon</key>
			<string>icon@3x.png</string>
		</dict>
*/

// OTHER

/*
		<dict>
			<key>cell</key>
			<string>PSButtonCell</string>
			<key>action</key>
			<string>killApp</string>
			<key>confirmation</key>
				<dict>
					<key>prompt</key>
					<string>Are you sure?</string>
					<key>title</key>
					<string>Kill iMessage</string>
					<key>okTitle</key>
					<string>Kill iMessage</string>
					<key>cancelTitle</key>
					<string>Cancel</string>
				</dict>
			<key>isDestructive</key>
			<true/>
			<key>label</key>
			<string>Save Changes</string>
		</dict>
*/

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(PSSpecifier *)specifier;
- (CGFloat)preferredHeightForWidth:(CGFloat)width;
@end

@interface CAWHeaderCell : PSTableCell <PreferencesTableCustomView> {
	UILabel *_label;
    UIImageView *_headerImageView;
    float _height;
}
@end