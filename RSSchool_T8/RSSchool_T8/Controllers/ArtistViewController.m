//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by JohnO on 18.07.2021.
//

#import "ArtistViewController.h"
#import "RSCanvas.h"
#import "RSActionButton.h"

@interface ArtistViewController ()


@property (nonatomic, strong) RSCanvas *canvas;
@property (nonatomic, strong) RSActionButton *openPaletteButton;
@property (nonatomic, strong) RSActionButton *openTimerButton;
@property (nonatomic, strong) RSActionButton *drawButton;
@property (nonatomic, strong) RSActionButton *shareButton;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initStyle];
	[self setupNavigationItem];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self setupViews];
}

- (void)initStyle {
	self.view.backgroundColor = UIColor.whiteColor;
}

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
	
	// share
	button = [[RSActionButton alloc] initWithFrame:CGRectMake(239, 506, 95, 32)];
	[button setTitle:@"Share" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(shareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	self.shareButton = button;
}

- (void)openPaletteTapped:(UIButton *)sender {
}

- (void)openTimerTapped:(UIButton *)sender {
}

- (void)drawButtonTapped:(UIButton *)sender {
}

- (void)shareButtonTapped:(UIButton *)sender {
}

- (void)openDrawings:(id)sender {
	UIViewController *drawingsVC = [UIViewController new];
	[self.navigationController pushViewController:drawingsVC animated:YES];
}

@end
