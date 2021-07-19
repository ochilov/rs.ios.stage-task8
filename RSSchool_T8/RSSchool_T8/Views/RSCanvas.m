//
//  RSCanvas.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "RSCanvas.h"
#import "UIColor+Palette.h"

@interface RSCanvas() {
	NSTimer *drawTimer;
	NSInteger drawProgress;
	DrawCompleteBlock drawComplete;
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

- (void)resetView {
	self.layer.sublayers = nil;
	[self setNeedsDisplay];
}

- (void)startAnimatedDrawWithDuration:(NSTimeInterval)duration complete:(DrawCompleteBlock)complete {
	[self stopAnimatedDraw];
	if (!self.drawData || !self.drawData.pathes.count) {
		return;
	}
	
	// setup draw data
	NSMutableArray *sublayers = [[NSMutableArray alloc] initWithCapacity: self.drawData.pathes.count];
	NSInteger colorIndex = 0;
	for (RSDrawDataPath *path in self.drawData.pathes) {
		if (path.bezier.empty) {
			continue;
		}
		if (colorIndex >= self.drawColorsSet.count) {
			colorIndex = 0;
		}
		UIColor *color = colorIndex < self.drawColorsSet.count ? self.drawColorsSet[colorIndex++] : UIColor.blackColor;
		
		CAShapeLayer *bezier = [CAShapeLayer layer];
		bezier.path = path.bezier.CGPath;

		bezier.strokeColor = color.CGColor;
		bezier.lineWidth   = path.lineWidth;
		bezier.fillColor = path.needFill ? bezier.strokeColor : nil;

		bezier.strokeStart = 0.0;
		bezier.strokeEnd   = 0.0;
		
		[sublayers addObject:bezier];
	}
	self.layer.sublayers = sublayers;
	
	// setup progress
	drawProgress = 0;
	drawComplete = complete;
	
	// start draw
	drawTimer = [NSTimer scheduledTimerWithTimeInterval:duration/60.0 target:self selector:@selector(animatedDraw:) userInfo:nil repeats:YES];
}

- (void)stopAnimatedDraw {
	if (drawTimer) {
		[drawTimer invalidate];
		drawTimer = nil;
	}
}

- (void)animatedDraw:(NSTimer *)timer {
	drawProgress++;
	if (drawProgress > 60) {
		[timer invalidate];
		if (drawComplete) {
			drawComplete();
		}
		return;
	}
	CGFloat strokeProgress = (CGFloat)drawProgress / 60.0;
	for (CAShapeLayer *subLayer in self.layer.sublayers) {
		subLayer.strokeEnd = strokeProgress;
	}
}

@end
