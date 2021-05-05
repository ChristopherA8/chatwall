//
//  UIColor+Hex.h
//  小灯塔
//
//  Created by liuhao on 2018/8/7.
//  Copyright © 2018年 TheTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

#define RGBA_COLOR(R, G, B, A)  [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B)      [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
+ (UIColor *)pf_colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)pf_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)pf_colorWithHex:(long)hexColor;
+ (UIColor *)pf_colorWithHex:(long)hexColor alpha:(float)opacity;

+ (CAGradientLayer *)pf_setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

@end