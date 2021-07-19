//
//  RSCanvas.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "RSCanvas.h"
#include "UIColor+Palette.h"

@implementation RSCanvas

- (instancetype)init {
	self = [super init];
	if (self) {
		[self initStyle];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		[self initStyle];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self initStyle];
	}
	return self;
}

- (NSData *)getPNG {
	UIGraphicsImageRenderer *imageRenderer = [[UIGraphicsImageRenderer alloc] initWithSize:self.bounds.size
																					format:UIGraphicsImageRendererFormat.preferredFormat];
	NSData *png = [imageRenderer PNGDataWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
		[self.layer renderInContext:rendererContext.CGContext];
	}];
	return png;
}

- (void)initStyle {
	self.backgroundColor = UIColor.whiteColor;
	self.layer.cornerRadius = 8;
	self.layer.shadowRadius = 4;
	self.layer.shadowOffset =  CGSizeZero;
	self.layer.shadowOpacity = 0.25;
	self.layer.shadowColor = UIColor.chillSky.CGColor;
}

@end
