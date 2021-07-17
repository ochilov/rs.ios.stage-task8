//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by JohnO on 17.07.2021.
//

#import "AppDelegate.h"

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
	UIViewController *root = [[UIViewController alloc] init];
	root.view.backgroundColor = UIColor.yellowColor;
	return root;
}


@end
