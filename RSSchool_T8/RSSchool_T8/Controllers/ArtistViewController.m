//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "ArtistViewController.h"
#import "UIColor+Palette.h"
#import "RSCanvas.h"
#import "RSActionButton.h"
#import "PaletteViewController.h"
#import "RSSchool_T8-Swift.h"

typedef NS_ENUM(NSInteger, ArtistViewControllerStatus) {
	ArtistViewControllerIdle,
	ArtistViewControllerDraw,
	ArtistViewControllerDone
};

@interface ArtistViewController ()

@property (nonatomic, strong) RSCanvas *canvas;
@property (nonatomic, strong) RSActionButton *openPaletteButton;
@property (nonatomic, strong) RSActionButton *openTimerButton;
@property (nonatomic, strong) RSActionButton *drawButton;
@property (nonatomic, strong) RSActionButton *resetDrawButton;
@property (nonatomic, strong) RSActionButton *shareButton;

@property (nonatomic, strong) PaletteViewController *paletteViewController;
@property (nonatomic, strong) TimerViewController *timerViewController;
@property (nonatomic, strong) DrawingsViewController *drawingsViewController;

@end

@implementation ArtistViewController

// MARK: - VC delegates
- (void)viewDidLoad {
	[super viewDidLoad];
	[self initStyle];
	[self setupNavigationItem];
	[self setupViews];
	
	self.paletteViewController = [[PaletteViewController alloc] init];
	[self.paletteViewController addOnSaveTarget:self action:@selector(onPaletteSaved)];
	
	self.timerViewController = [[TimerViewController alloc] init];
	[self.timerViewController addOnSaveWithTarget:self action:@selector(onTimerSaved)];
	
	self.drawingsViewController = [DrawingsViewController new];
	self.drawingsViewController.selectedDataUID = RSDrawData.head.uid;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self setStatus: ArtistViewControllerIdle];
}

- (void)initStyle {
	self.view.backgroundColor = UIColor.whiteColor;
}


// MARK: - Navigation item
- (void)setupNavigationItem {
	UIFont *barFont = [UIFont fontWithName:@"Montserrat-Medium" size:17];
	
	// title
	self.navigationItem.title = @"Artist";
	
	// next
	UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
															 style:UIBarButtonItemStylePlain
															target:self
															action:@selector(openDrawings:)];
	[next setTitleTextAttributes:@{NSFontAttributeName : barFont} forState:UIControlStateNormal];
	self.navigationItem.rightBarButtonItem = next;
}

- (void)openDrawings:(id)sender {
	[self.navigationController pushViewController:self.drawingsViewController animated:YES];
}


// MARK: - Contents
- (void)setupViews {
	// canvas
	_canvas = [[RSCanvas alloc] initWithFrame:CGRectMake(38, 104, 300, 300)];
	[self.view addSubview:_canvas];
	
	// openPalette
	RSActionButton *button = [[RSActionButton alloc] initWithFrame:CGRectMake(20, 454, 163, 32)];
	[button setTitle:@"Open Palette" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(openPaletteTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	self.openPaletteButton = button;
	
	// openTimer
	button = [[RSActionButton alloc] initWithFrame:CGRectMake(20, 506, 151, 32)];
	[button setTitle:@"Open Timer" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(openTimerTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	self.openTimerButton = button;
	
	// draw
	button = [[RSActionButton alloc] initWithFrame:CGRectMake(243, 454, 91, 32)];
	[button setTitle:@"Draw" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(drawButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	self.drawButton = button;
	
	// reset
	button = [[RSActionButton alloc] initWithFrame:CGRectMake(233, 454, 101, 32)];
	[button setTitle:@"Reset" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(resetDrawTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	self.resetDrawButton = button;
	
	// share
	button = [[RSActionButton alloc] initWithFrame:CGRectMake(239, 506, 95, 32)];
	[button setTitle:@"Share" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(shareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	self.shareButton = button;
	
	[self setStatus: ArtistViewControllerIdle];
}

- (void)showChildViewController:(UIViewController *)vc {
	[self addChildViewController:vc];
	[self.view addSubview:vc.view];
	[vc didMoveToParentViewController:self];
}

- (void)hideChildViewController:(UIViewController *)vc {
	[vc willMoveToParentViewController:nil];
	[vc.view removeFromSuperview];
	[vc removeFromParentViewController];
}

- (void)setStatus:(ArtistViewControllerStatus)status {
	switch(status) {
		case ArtistViewControllerIdle: {
			[self.canvas resetView];
			self.openPaletteButton.enabled = YES;
			self.openTimerButton.enabled = YES;
			self.drawButton.enabled = YES;
			self.drawButton.hidden = NO;
			self.resetDrawButton.hidden = YES;
			self.shareButton.enabled = NO;
			break;
		}
		case ArtistViewControllerDraw: {
			self.openPaletteButton.enabled = NO;
			self.openTimerButton.enabled = NO;
			self.drawButton.enabled = NO;
			self.resetDrawButton.hidden = YES;
			self.shareButton.enabled = NO;
			break;
		}
		case ArtistViewControllerDone: {
			self.openPaletteButton.enabled = NO;
			self.openTimerButton.enabled = NO;
			self.drawButton.hidden = YES;
			self.resetDrawButton.hidden = NO;
			self.shareButton.enabled = YES;
			break;
		}
	}
}

// MARK: Palette
- (void)openPaletteTapped:(UIButton *)sender {
	CGFloat childHeight = 333.5;
	CGRect childFrame = CGRectMake(0.0,
					self.view.bounds.size.height - childHeight,
					self.view.bounds.size.width,
					childHeight);
	self.paletteViewController.view.frame = childFrame;
	
	[self showChildViewController:self.paletteViewController];
}

- (void)onPaletteSaved {
	[self hideChildViewController: self.paletteViewController];
}

// MARK: Timer
- (void)openTimerTapped:(UIButton *)sender {
	CGFloat childHeight = 333.5;
	CGRect childFrame = CGRectMake(0.0,
					self.view.bounds.size.height - childHeight,
					self.view.bounds.size.width,
					childHeight);
	self.timerViewController.view.frame = childFrame;
	
	[self showChildViewController:self.timerViewController];
}

- (void)onTimerSaved {
	[self hideChildViewController: self.timerViewController];
}

// MARK: Draw
- (void)drawButtonTapped:(UIButton *)sender {
	self.canvas.drawData = [RSDrawData dataByID:self.drawingsViewController.selectedDataUID];
	self.canvas.drawColorsSet = self.paletteViewController.colorsSet;
	
	[self setStatus:ArtistViewControllerDraw];
	
	__weak typeof(self) weakSelf = self;
	[self.canvas startAnimatedDrawWithDuration: 1 complete:^{
		[weakSelf drawDidEnd];
	}];
}

- (void)drawDidEnd {
	[self setStatus:ArtistViewControllerDone];
}

- (void)resetDrawTapped:(UIButton *)sender {
	[self setStatus:ArtistViewControllerIdle];
}

// MARK: Share
- (void)shareButtonTapped:(UIButton *)sender {
	NSData *png = [self.canvas getPNG];
	if (png) {
		UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[png] applicationActivities:nil];
		[self presentViewController:activityVC animated:YES completion:^{}];
	}
}

@end
