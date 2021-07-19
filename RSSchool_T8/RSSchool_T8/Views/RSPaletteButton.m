//
//  RSPaletteButton.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "RSPaletteButton.h"
#import "UIColor+Palette.h"

@interface RSPaletteButton() {
	CAShapeLayer *colorLayer;
	CAShapeLayer *colorLayerHighlighted;
}
@end

@implementation RSPaletteButton

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
	self = [super initWithFrame:frame];
	if (self) {
		_color = color;
		[self initStyle];
	}
	return self;
}

- (void)initStyle {
	[self setBackgroundColor:UIColor.whiteColor];

	self.layer.cornerRadius = 10;
	self.layer.shadowRadius = 1;
	self.layer.shadowOffset = CGSizeZero;
	self.layer.shadowColor = UIColor.defaultShadow.CGColor;
	self.layer.shadowOpacity = 1.0;
	
	colorLayer = [self layerWithScale:0.6];
	colorLayer.fillColor = self.color.CGColor;
	[colorLayer setHidden:NO];
	[self.layer addSublayer:colorLayer];
	
	colorLayerHighlighted = [self layerWithScale:0.9];
	colorLayerHighlighted.fillColor = self.color.CGColor;
	[colorLayerHighlighted setHidden:YES];
	[self.layer addSublayer:colorLayerHighlighted];
}

- (void)setHighlighted:(BOOL)highlighted {
	[super setHighlighted:highlighted];
	
	colorLayer.hidden = highlighted;
	colorLayerHighlighted.hidden = !highlighted;
}

- (void)setEnabled:(BOOL)enabled {
	[super setEnabled:enabled];
	
	self.layer.opacity = enabled ? 1.0 : 0.5;
}

- (CAShapeLayer *)layerWithScale:(CGFloat)scale {
	CGFloat radius = self.layer.cornerRadius * scale;
	CGRect frame = self.frame;
	frame.size.width *= scale;
	frame.size.height *= scale;
	frame.origin.x = CGRectGetMidX(self.bounds) - frame.size.width/2;
	frame.origin.y = CGRectGetMidY(self.bounds) - frame.size.height/2;
	UIBezierPath * colorLayerPath = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:radius];
	CAShapeLayer *layer = [CAShapeLayer new];
	layer.path = colorLayerPath.CGPath;
	return layer;
}

@end
