//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by JohnO on 17.07.2021.
//

#import "AppDelegate.h"
#import "Controllers/ArtistViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	window.rootViewController = [self rootViewController];
	
	self.window = window;
	[self.window makeKeyAndVisible];
	return YES;
}

- (UIViewController *)rootViewController {
	
	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:[ArtistViewController new]];
	
	// init bar style
	navigation.navigationBar.tintColor = [UIColor colorNamed:@"lightGreenSea"];
	[navigation.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	navigation.navigationBar.backgroundColor = UIColor.whiteColor;
	navigation.navigationBar.layer.shadowOffset = CGSizeMake(0, 0.5);
	navigation.navigationBar.layer.shadowRadius = 0;
	navigation.navigationBar.layer.shadowColor  = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
	navigation.navigationBar.layer.shadowOpacity = 1;
	navigation.navigationBar.titleTextAttributes =
		@{NSFontAttributeName : [UIFont fontWithName:@"Montserrat-Medium" size:17]};
	
	return navigation;
	
}


@end
