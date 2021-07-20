//
//  RSSettings.m
//  RSSchool_T8
//
//  Created by JohnO on 20.07.2021.
//

#import "RSSettings.h"

@implementation RSSettings

+ (instancetype)defaultSettings {
	static RSSettings *_defaultSettings = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_defaultSettings = [[self alloc] init];
		_defaultSettings.drawDuration = 1.0;
	});
	
	return _defaultSettings;
}

@end
