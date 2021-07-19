//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "PaletteViewController.h"
#import "UIColor+Palette.h"
#import "RSActionButton.h"
#import "RSPaletteButton.h"

@interface PaletteViewController () {
	NSTimer *highlightTimer;
	NSMutableArray<UIColor *> *_colorsSet;
	
	id onSaveTarget;
	SEL onSaveAction;
}

@end

@implementation PaletteViewController

// MARK: - VC delegates
- (void)viewDidLoad {
	[super viewDidLoad];
	[self initStyle];
	_colorsSet = [[NSMutableArray alloc] initWithCapacity:4];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self setupViews];
}

- (void)initStyle {
	self.view.backgroundColor = UIColor.whiteColor;
	
	self.view.layer.cornerRadius = 40;
	self.view.layer.maskedCorners = kCALayerMinXMinYCorner|kCALayerMaxXMinYCorner;
	
	self.view.layer.shadowRadius = 4;
	self.view.layer.shadowOffset = CGSizeZero;
	self.view.layer.shadowColor = UIColor.defaultShadow.CGColor;
	self.view.layer.shadowOpacity = 1;
}

- (void)addOnSaveTarget:(nullable id)target action:(SEL)action {
	onSaveTarget = target;
	onSaveAction = action;
}


// MARK: - Contents
- (void)setupViews {
	// save button
	RSActionButton *saveButton = [[RSActionButton alloc] initWithFrame:CGRectMake(250, 20, 85, 32)];
	[saveButton setTitle:@"Save" forState:UIControlStateNormal];
	[saveButton addTarget:self action:@selector(saveButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:saveButton];
	
	// palette
	NSArray<UIColor *> *colors = @[
		[UIColor colorWithHexString:@"#E21B2C"],
		[UIColor colorWithHexString:@"#3E17CC"],
		[UIColor colorWithHexString:@"#007C37"],
		[UIColor colorWithHexString:@"#808080"],
		[UIColor colorWithHexString:@"#9D5EEA"],
		[UIColor colorWithHexString:@"#FF7A68"],
		
		[UIColor colorWithHexString:@"#FFAD54"],
		[UIColor colorWithHexString:@"#00AEED"],
		[UIColor colorWithHexString:@"#FF77A2"],
		[UIColor colorWithHexString:@"#002E3C"],
		[UIColor colorWithHexString:@"#0E3718"],
		[UIColor colorWithHexString:@"#610F10"]
	];
	UInt8 colorColumns = 6, colorColumn = 0, colorRow = 0;
	CGFloat colorButtonSize = 40;
	CGFloat colorButtonOffset = 20;
	CGFloat colorStartX = 17, colorStartY = 92;
	for (UIColor *color in colors) {
		CGRect frame = CGRectMake(colorStartX + (colorButtonSize + colorButtonOffset) * colorColumn,
								  colorStartY + (colorButtonSize + colorButtonOffset) * colorRow,
								  colorButtonSize,
								  colorButtonSize);
		
		
		RSPaletteButton *button = [[RSPaletteButton alloc] initWithFrame:frame color:color];
		[button addTarget:self action:@selector(paletteButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:button];
		
		colorColumn++;
		if (colorColumn == colorColumns) {
			colorColumn = 0;
			colorRow++;
		}
	}
}

- (void)saveButtonTapped:(UIButton *)sender {
	if (onSaveTarget && onSaveAction) {
		[onSaveTarget performSelector:onSaveAction];
	}
}

- (void)paletteButtonTapped:(RSPaletteButton *)sender {
	UIColor *selectedColor = sender.color;
	// if selected color is exists in colorsSet - exclude this color
	NSInteger index = [_colorsSet indexOfObject:selectedColor];
	if (index != NSNotFound) {
		[_colorsSet removeObjectAtIndex:index];
		return;
	}
	
	// add to stack
	[_colorsSet addObject:selectedColor];
	if (_colorsSet.count > 3) {
		[_colorsSet removeObjectAtIndex:0];
	}
	
	// highlight the color
	self.view.backgroundColor = selectedColor;
	[self.view setNeedsDisplay];
	if (highlightTimer) {
		[highlightTimer invalidate];
	}
	highlightTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(resetPaletteHighlighted) userInfo:nil repeats:NO];
}

- (void)resetPaletteHighlighted {
	self.view.backgroundColor = UIColor.whiteColor;
	[self.view setNeedsDisplay];
}


- (NSArray*)colorsSet {
	return _colorsSet.copy;
}

@end
