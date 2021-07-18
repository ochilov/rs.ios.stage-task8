//
//  RSButton.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "RSActionButton.h"

@implementation RSActionButton

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
	UIColor *accentColor = [UIColor colorNamed:@"lightGreenSea"];
	UIColor *shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
	[self setBackgroundColor:fillColor];
	[self setTitleColor:accentColor forState:UIControlStateNormal];

	self.layer.cornerRadius = 10;
	self.layer.shadowRadius = 1;
	self.layer.shadowOffset = CGSizeMake(0, 0);
	self.layer.shadowOpacity = 1.0;
	self.layer.shadowColor = shadowColor.CGColor;
	
	self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
}

- (void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
	
	
	UIColor *shadowColor = highlighted ? [UIColor colorNamed:@"lightGreenSea"]
									   : [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25];
	
	self.layer.shadowColor = shadowColor.CGColor;
	self.layer.shadowRadius = highlighted ? 2 : 1;
}

- (void)setEnabled:(BOOL)enabled {
	[super setEnabled:enabled];
	
	self.layer.opacity = enabled ? 1.0 : 0.5;
}

@end
