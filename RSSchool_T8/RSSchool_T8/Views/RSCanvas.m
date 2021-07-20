//
//  RSCanvas.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "RSCanvas.h"
#import "UIColor+Palette.h"
#import "RSSettings.h"
#import "NSMutableArray+Extensions.h"

@interface RSCanvas() {
	NSTimer *drawTimer;
	NSInteger animationProgress;
	NSInteger animationStep;
	NSInteger animationEnd;
	DrawCompleteBlock animationComplete;
}

@end


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

- (void)clear {
	[self stopAnimation];
	self.layer.sublayers = nil;
	[self setNeedsDisplay];
}

- (void)animatedClearWithComplete:(DrawCompleteBlock)complete {
	[self stopAnimation];
	if (!self.layer.sublayers.count) {
		// no draw data - exit
		return;
	}
	// setup animation
	animationComplete = complete;
	animationProgress = 60;
	animationStep = -1;
	animationEnd = -1;
	NSTimeInterval duration = 0.25;
	
	// start animation
	drawTimer = [NSTimer scheduledTimerWithTimeInterval:duration/60.0 target:self selector:@selector(animation:) userInfo:nil repeats:YES];
	
}

- (void)animatedDraw:(RSDrawData *)drawData complete:(DrawCompleteBlock)complete {
	[self stopAnimation];
	if (!drawData || !drawData.pathes.count) {
		return;
	}
	
	// init colors
	UIColor *defaultColor = UIColor.blackColor;
	NSMutableArray *_colorsSet = [NSMutableArray arrayWithArray:RSSettings.defaultSettings.drawColors];
	while (_colorsSet.count < 3) {
		[_colorsSet addObject:defaultColor];
	}
	[_colorsSet shuffle];
	
	// setup draw data
	NSMutableArray *sublayers = [[NSMutableArray alloc] initWithCapacity: drawData.pathes.count];
	NSInteger colorIndex = 0;
	for (RSDrawDataPath *path in drawData.pathes) {
		if (path.bezier.empty) {
			continue;
		}
		if (colorIndex >= _colorsSet.count) {
			colorIndex = 0;
		}
		UIColor *color = colorIndex < _colorsSet.count ? _colorsSet[colorIndex++] : defaultColor;
		
		CAShapeLayer *bezier = [CAShapeLayer layer];
		bezier.path = path.bezier.CGPath;

		bezier.strokeColor = color.CGColor;
		bezier.lineWidth   = path.lineWidth;
		bezier.fillColor   = path.needFill ? bezier.strokeColor : nil;

		bezier.strokeStart = 0.0;
		bezier.strokeEnd   = 0.0;
		
		[sublayers addObject:bezier];
	}
	self.layer.sublayers = sublayers;
	
	// setup animation
	animationComplete = complete;
	animationProgress = 0;
	animationStep = 1;
	animationEnd = 60;
	NSTimeInterval duration = RSSettings.defaultSettings.drawDuration;
	
	// start animation
	drawTimer = [NSTimer scheduledTimerWithTimeInterval:duration/60.0 target:self selector:@selector(animation:) userInfo:nil repeats:YES];
}

- (void)stopAnimation {
	if (drawTimer) {
		[drawTimer invalidate];
		drawTimer = nil;
	}
}

- (void)animation:(NSTimer *)timer {
	animationProgress += animationStep;
	if (animationProgress == animationEnd) {
		[timer invalidate];
		if (animationComplete) {
			animationComplete();
		}
		return;
	}
	CGFloat strokeProgress = (CGFloat)animationProgress / 60.0;
	for (CAShapeLayer *subLayer in self.layer.sublayers) {
		subLayer.strokeEnd = strokeProgress;
	}
}

@end
