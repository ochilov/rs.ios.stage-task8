//
//  RSCanvas.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "RSCanvas.h"

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

- (void)initStyle {
	UIColor *fillColor   = UIColor.whiteColor;
	UIColor *accentColor = [UIColor colorNamed:@"chillSky"];
	UIColor *shadowColor = [accentColor colorWithAlphaComponent:0.25];
	
	self.backgroundColor = fillColor;
	self.layer.cornerRadius = 8;
	self.layer.shadowRadius = 4;
	self.layer.shadowOffset = CGSizeMake(0, 0);
	self.layer.shadowOpacity = 1.0;
	self.layer.shadowColor = shadowColor.CGColor;
}

@end
