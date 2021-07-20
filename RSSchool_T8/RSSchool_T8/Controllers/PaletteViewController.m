//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "PaletteViewController.h"
#import "UIColor+Palette.h"
#import "RSSettings.h"
#import "RSActionButton.h"
#import "RSPaletteButton.h"

@interface PaletteViewController () {
	NSTimer *highlightTimer;
	NSInteger _pressedPaletteButtonsCount;
	NSMutableArray<RSPaletteButton *> *_pressedPaletteButtons;
	
	id onSaveTarget;
	SEL onSaveAction;
}

@end

@implementation PaletteViewController

// MARK: - VC delegates
- (void)viewDidLoad {
	[super viewDidLoad];
	[self initStyle];
	[self setupViews];
	_pressedPaletteButtonsCount = 3;
	_pressedPaletteButtons = [NSMutableArray arrayWithCapacity:_pressedPaletteButtonsCount];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
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
	NSMutableArray *_colorsSet = [NSMutableArray arrayWithCapacity:_pressedPaletteButtons.count];
	for (RSPaletteButton *button in _pressedPaletteButtons) {
		[_colorsSet addObject:button.color];
	}
	RSSettings.defaultSettings.drawColors = _colorsSet.copy;
	
	if (onSaveTarget && onSaveAction) {
		IMP imp = [onSaveTarget methodForSelector:onSaveAction];
		void (*func)(id, SEL) = (void *)imp;
		func(onSaveTarget, onSaveAction);
	}
}

- (void)paletteButtonTapped:(RSPaletteButton *)button {
	// if deselected = remove from buffer
	if (!button.isSelected) {
		[self removeFromPressed:button];
		return;
	}
	
	// add to buffer
	[self addToPressed:button];
	
	// highlight the color
	self.view.backgroundColor = button.color;
	[self.view setNeedsDisplay];
	if (highlightTimer) {
		[highlightTimer invalidate];
	}
	highlightTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(resetPaletteHighlighted) userInfo:nil repeats:NO];
}

- (void)removeFromPressed:(RSPaletteButton *)button {
	[_pressedPaletteButtons removeObject:button];
}

- (void)addToPressed:(RSPaletteButton *)button {
	if (_pressedPaletteButtons.count < _pressedPaletteButtonsCount) {
		[_pressedPaletteButtons addObject:button];
		return;
	}
	
	RSPaletteButton *firstbutton = _pressedPaletteButtons.firstObject;
	[firstbutton setSelected:NO];
	for (NSInteger i = 1; i < _pressedPaletteButtons.count; i++) {
		_pressedPaletteButtons[i-1] = _pressedPaletteButtons[i];
	}
	_pressedPaletteButtons[_pressedPaletteButtonsCount-1] = button;
}

- (void)resetPaletteHighlighted {
	self.view.backgroundColor = UIColor.whiteColor;
	[self.view setNeedsDisplay];
}

@end
