//
//  UIColor+Palette.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "UIColor+Palette.h"

@implementation UIColor (Palette)

+ (UIColor *)defaultShadow {
	return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
}

+ (UIColor *)highlightedShadow {
	return [UIColor colorNamed:@"lightGreenSea"];
}

+ (UIColor *)lightGreenSea {
	return [UIColor colorNamed:@"lightGreenSea"];
}

+ (UIColor *)chillSky {
	return [UIColor colorNamed:@"chillSky"];
}

+ (UIColor *)colorWithHexString:(NSString *)str {
	const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
	long x = strtol(cStr+1, NULL, 16);
	return [UIColor colorWithHex:(UInt32)x];
}

+ (UIColor *)colorWithHex:(UInt32)col {
	unsigned char r, g, b;
	b = col & 0xFF;
	g = (col >> 8) & 0xFF;
	r = (col >> 16) & 0xFF;
	return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

@end
