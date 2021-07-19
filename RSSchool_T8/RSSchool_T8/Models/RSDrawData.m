//
//  RSDrawData.m
//  RSSchool_T8
//
//  Created by JohnO on 19.07.2021.
//

#import "RSDrawData.h"

// MARK: -
@implementation RSDrawDataPath
- (instancetype)init {
	self = [super init];
	if (self) {
		_bezier = nil;
		_needFill = NO;
		_lineWidth = 1.0;
	}
	return self;
}

- (instancetype)initWithBezier:(UIBezierPath *)bezier {
	self = [super init];
	if (self) {
		_bezier = bezier;
		_needFill = NO;
		_lineWidth = 1.0;
	}
	return self;
}
@end


// MARK: -
@interface RSDrawData() {
	NSMutableArray *_pathes;
}
@end
@implementation RSDrawData

- (NSArray *)pathes {
	return _pathes.copy;
}

- (RSDrawDataPath *)addPath:(UIBezierPath *)path {
	RSDrawDataPath *_path = [[RSDrawDataPath alloc] initWithBezier:path];
	if (!_pathes) {
		_pathes = [NSMutableArray arrayWithObject:_path];
	} else {
		[_pathes addObject:_path];
	}
	return _path;
}


+ (NSArray<RSDrawData *> *)allData {
	return @[ self.planet, self.head, self.tree, self.landscape ];
}

+ (instancetype)dataByID:(NSInteger)uid {
	for (RSDrawData *item in self.allData) {
		if (uid == item.uid) {
			return item;
		}
	}
	return nil;
}

// MARK: - Head template
+ (instancetype)head {
	static RSDrawData *headInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		headInstance = [RSDrawData new];
		RSDrawData *data = headInstance;
		data.uid = 1;
		data.name = @"Head";
		
		//
		UIBezierPath* bezierPath = [UIBezierPath bezierPath];
		[bezierPath moveToPoint: CGPointMake(61.5, 29)];
		[bezierPath addLineToPoint: CGPointMake(77, 89)];
		[bezierPath addLineToPoint: CGPointMake(89, 112)];
		[bezierPath addLineToPoint: CGPointMake(106.5, 131.5)];
		[bezierPath addLineToPoint: CGPointMake(133.5, 154)];
		[bezierPath addLineToPoint: CGPointMake(157, 159.5)];
		[bezierPath addLineToPoint: CGPointMake(193, 142)];
		[bezierPath addLineToPoint: CGPointMake(220, 112)];
		[bezierPath addLineToPoint: CGPointMake(228.5, 100)];
		[bezierPath addLineToPoint: CGPointMake(228.5, 77.5)];
		[bezierPath addLineToPoint: CGPointMake(230.5, 50.5)];
		[bezierPath addLineToPoint: CGPointMake(218.5, 40.5)];
		[bezierPath addLineToPoint: CGPointMake(202, 43.5)];
		[bezierPath addLineToPoint: CGPointMake(191, 60.5)];
		[bezierPath addLineToPoint: CGPointMake(189, 83.5)];
		[bezierPath addLineToPoint: CGPointMake(193, 96)];
		[data addPath:bezierPath];

		//
		UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
		[bezier2Path moveToPoint: CGPointMake(184, 100)];
		[bezier2Path addLineToPoint: CGPointMake(175.5, 98.5)];
		[bezier2Path addLineToPoint: CGPointMake(166, 100.5)];
		[bezier2Path addLineToPoint: CGPointMake(158, 101.5)];
		[bezier2Path addLineToPoint: CGPointMake(148.5, 100.5)];
		[bezier2Path addLineToPoint: CGPointMake(140, 99)];
		[bezier2Path addLineToPoint: CGPointMake(133.5, 98.5)];
		[bezier2Path addLineToPoint: CGPointMake(126, 100)];
		[bezier2Path addLineToPoint: CGPointMake(121.5, 102)];
		[bezier2Path addLineToPoint: CGPointMake(127.5, 104.5)];
		[bezier2Path addLineToPoint: CGPointMake(132, 108)];
		[bezier2Path addLineToPoint: CGPointMake(136.5, 113)];
		[bezier2Path addLineToPoint: CGPointMake(142.5, 115.5)];
		[bezier2Path addLineToPoint: CGPointMake(150, 116.5)];
		[bezier2Path addLineToPoint: CGPointMake(157, 115.5)];
		[bezier2Path addLineToPoint: CGPointMake(164.5, 116.5)];
		[bezier2Path addLineToPoint: CGPointMake(170.5, 115.5)];
		[bezier2Path addLineToPoint: CGPointMake(177, 111.5)];
		[bezier2Path addLineToPoint: CGPointMake(184, 103.5)];
		[bezier2Path addLineToPoint: CGPointMake(188.5, 97.5)];
		[bezier2Path addLineToPoint: CGPointMake(180.5, 96.5)];
		[bezier2Path addLineToPoint: CGPointMake(171.5, 95.5)];
		[bezier2Path addLineToPoint: CGPointMake(162.5, 93.5)];
		[bezier2Path addLineToPoint: CGPointMake(154, 93)];
		[bezier2Path addLineToPoint: CGPointMake(144, 94.5)];
		[bezier2Path addLineToPoint: CGPointMake(135, 96.5)];
		[bezier2Path addLineToPoint: CGPointMake(125, 97.5)];
		[bezier2Path addLineToPoint: CGPointMake(118, 97)];
		[bezier2Path addLineToPoint: CGPointMake(127.5, 91)];
		[bezier2Path addLineToPoint: CGPointMake(136.5, 84.5)];
		[bezier2Path addLineToPoint: CGPointMake(142.5, 81)];
		[bezier2Path addLineToPoint: CGPointMake(147.5, 82.5)];
		[bezier2Path addLineToPoint: CGPointMake(153, 84.5)];
		[bezier2Path addLineToPoint: CGPointMake(159.5, 83.5)];
		[bezier2Path addLineToPoint: CGPointMake(166, 82.5)];
		[bezier2Path addLineToPoint: CGPointMake(171.5, 82.5)];
		[bezier2Path addLineToPoint: CGPointMake(174.5, 84.5)];
		[bezier2Path addLineToPoint: CGPointMake(179.5, 89.5)];
		[bezier2Path addLineToPoint: CGPointMake(187, 94)];
		[data addPath:bezier2Path];


		//
		UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
		[bezier3Path moveToPoint: CGPointMake(189.5, 102.5)];
		[bezier3Path addLineToPoint: CGPointMake(194, 108.5)];
		[bezier3Path addLineToPoint: CGPointMake(196.5, 115)];
		[bezier3Path addLineToPoint: CGPointMake(193, 124)];
		[bezier3Path addLineToPoint: CGPointMake(186, 132.5)];
		[bezier3Path addLineToPoint: CGPointMake(177, 139.5)];
		[bezier3Path addLineToPoint: CGPointMake(167.5, 132.5)];
		[bezier3Path addLineToPoint: CGPointMake(157, 128.5)];
		[bezier3Path addLineToPoint: CGPointMake(147.5, 128.5)];
		[bezier3Path addLineToPoint: CGPointMake(135.5, 132.5)];
		[bezier3Path addLineToPoint: CGPointMake(127.5, 142)];
		[bezier3Path addLineToPoint: CGPointMake(121, 154.5)];
		[bezier3Path addLineToPoint: CGPointMake(109.5, 147.5)];
		[bezier3Path addLineToPoint: CGPointMake(101.5, 137.5)];
		[bezier3Path addLineToPoint: CGPointMake(93, 128.5)];
		[bezier3Path addLineToPoint: CGPointMake(93, 142)];
		[bezier3Path addLineToPoint: CGPointMake(93, 170.5)];
		[bezier3Path addLineToPoint: CGPointMake(93, 187.5)];
		[bezier3Path addLineToPoint: CGPointMake(86, 199)];
		[bezier3Path addLineToPoint: CGPointMake(74.5, 207.5)];
		[bezier3Path addLineToPoint: CGPointMake(63.5, 214.5)];
		[bezier3Path addLineToPoint: CGPointMake(81, 221)];
		[bezier3Path addLineToPoint: CGPointMake(94.5, 229.5)];
		[bezier3Path addLineToPoint: CGPointMake(105, 243.5)];
		[bezier3Path addLineToPoint: CGPointMake(119, 261)];
		[bezier3Path addLineToPoint: CGPointMake(138, 279)];
		[bezier3Path addLineToPoint: CGPointMake(157, 285.5)];
		[bezier3Path addLineToPoint: CGPointMake(171, 285.5)];
		[bezier3Path addLineToPoint: CGPointMake(186, 277.5)];
		[bezier3Path addLineToPoint: CGPointMake(199.5, 261)];
		[bezier3Path addLineToPoint: CGPointMake(209.5, 239.5)];
		[bezier3Path addLineToPoint: CGPointMake(219, 223.5)];
		[bezier3Path addLineToPoint: CGPointMake(233.5, 217)];
		[bezier3Path addLineToPoint: CGPointMake(237, 217)];
		[bezier3Path addLineToPoint: CGPointMake(230.5, 201.5)];
		[bezier3Path addLineToPoint: CGPointMake(221, 173)];
		[bezier3Path addLineToPoint: CGPointMake(219, 150)];
		[bezier3Path addLineToPoint: CGPointMake(219, 126.5)];
		[bezier3Path addLineToPoint: CGPointMake(212, 137.5)];
		[bezier3Path addLineToPoint: CGPointMake(204, 145.5)];
		[bezier3Path addLineToPoint: CGPointMake(196.5, 154.5)];
		[bezier3Path addLineToPoint: CGPointMake(180, 170.5)];
		[bezier3Path addLineToPoint: CGPointMake(170, 185)];
		[bezier3Path addLineToPoint: CGPointMake(161.5, 206.5)];
		[bezier3Path addLineToPoint: CGPointMake(158.5, 232.5)];
		[bezier3Path addLineToPoint: CGPointMake(158.5, 261)];
		[bezier3Path addLineToPoint: CGPointMake(158.5, 279)];
		[data addPath:bezier3Path];
	});
	
	return headInstance;
}

// MARK: - Head template
+ (instancetype)tree {
	static RSDrawData *treeInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		treeInstance = [RSDrawData new];
		RSDrawData *data = treeInstance;
		data.uid = 2;
		data.name = @"Tree";
		
		//
		UIBezierPath* bezierPath = [UIBezierPath bezierPath];
		[bezierPath moveToPoint: CGPointMake(213.19, 65.76)];
		[bezierPath addCurveToPoint: CGPointMake(217, 56.5) controlPoint1: CGPointMake(215.57, 63.25) controlPoint2: CGPointMake(217, 60.02)];
		[bezierPath addCurveToPoint: CGPointMake(200.5, 42) controlPoint1: CGPointMake(217, 48.49) controlPoint2: CGPointMake(209.61, 42)];
		[bezierPath addCurveToPoint: CGPointMake(195.97, 42.55) controlPoint1: CGPointMake(198.93, 42) controlPoint2: CGPointMake(197.41, 42.19)];
		[bezierPath addCurveToPoint: CGPointMake(179.5, 29) controlPoint1: CGPointMake(195.41, 34.99) controlPoint2: CGPointMake(188.25, 29)];
		[bezierPath addCurveToPoint: CGPointMake(171.6, 30.77) controlPoint1: CGPointMake(176.64, 29) controlPoint2: CGPointMake(173.94, 29.64)];
		[bezierPath addCurveToPoint: CGPointMake(160.5, 27) controlPoint1: CGPointMake(168.67, 28.43) controlPoint2: CGPointMake(164.77, 27)];
		[bezierPath addCurveToPoint: CGPointMake(155.97, 27.55) controlPoint1: CGPointMake(158.93, 27) controlPoint2: CGPointMake(157.41, 27.19)];
		[bezierPath addCurveToPoint: CGPointMake(139.5, 14) controlPoint1: CGPointMake(155.41, 19.99) controlPoint2: CGPointMake(148.25, 14)];
		[bezierPath addCurveToPoint: CGPointMake(125.59, 20.7) controlPoint1: CGPointMake(133.65, 14) controlPoint2: CGPointMake(128.52, 16.67)];
		[bezierPath addCurveToPoint: CGPointMake(120.5, 20) controlPoint1: CGPointMake(123.98, 20.25) controlPoint2: CGPointMake(122.28, 20)];
		[bezierPath addCurveToPoint: CGPointMake(110.81, 22.77) controlPoint1: CGPointMake(116.88, 20) controlPoint2: CGPointMake(113.53, 21.03)];
		[bezierPath addCurveToPoint: CGPointMake(105.5, 22) controlPoint1: CGPointMake(109.14, 22.27) controlPoint2: CGPointMake(107.36, 22)];
		[bezierPath addCurveToPoint: CGPointMake(91.59, 28.7) controlPoint1: CGPointMake(99.65, 22) controlPoint2: CGPointMake(94.52, 24.67)];
		[bezierPath addCurveToPoint: CGPointMake(86.5, 28) controlPoint1: CGPointMake(89.98, 28.25) controlPoint2: CGPointMake(88.28, 28)];
		[bezierPath addCurveToPoint: CGPointMake(70, 42.5) controlPoint1: CGPointMake(77.39, 28) controlPoint2: CGPointMake(70, 34.49)];
		[bezierPath addCurveToPoint: CGPointMake(70.01, 43.02) controlPoint1: CGPointMake(70, 42.68) controlPoint2: CGPointMake(70, 42.85)];
		[bezierPath addCurveToPoint: CGPointMake(68.59, 44.7) controlPoint1: CGPointMake(69.49, 43.55) controlPoint2: CGPointMake(69.02, 44.11)];
		[bezierPath addCurveToPoint: CGPointMake(63.5, 44) controlPoint1: CGPointMake(66.98, 44.25) controlPoint2: CGPointMake(65.28, 44)];
		[bezierPath addCurveToPoint: CGPointMake(47, 58.5) controlPoint1: CGPointMake(54.39, 44) controlPoint2: CGPointMake(47, 50.49)];
		[bezierPath addCurveToPoint: CGPointMake(48.58, 64.71) controlPoint1: CGPointMake(47, 60.72) controlPoint2: CGPointMake(47.57, 62.83)];
		[bezierPath addCurveToPoint: CGPointMake(46, 72.5) controlPoint1: CGPointMake(46.95, 66.96) controlPoint2: CGPointMake(46, 69.63)];
		[bezierPath addCurveToPoint: CGPointMake(47.19, 77.92) controlPoint1: CGPointMake(46, 74.42) controlPoint2: CGPointMake(46.42, 76.25)];
		[bezierPath addCurveToPoint: CGPointMake(44, 86.5) controlPoint1: CGPointMake(45.19, 80.33) controlPoint2: CGPointMake(44, 83.29)];
		[bezierPath addCurveToPoint: CGPointMake(45.58, 92.71) controlPoint1: CGPointMake(44, 88.72) controlPoint2: CGPointMake(44.57, 90.83)];
		[bezierPath addCurveToPoint: CGPointMake(43, 100.5) controlPoint1: CGPointMake(43.95, 94.96) controlPoint2: CGPointMake(43, 97.63)];
		[bezierPath addCurveToPoint: CGPointMake(59.5, 115) controlPoint1: CGPointMake(43, 108.51) controlPoint2: CGPointMake(50.39, 115)];
		[bezierPath addCurveToPoint: CGPointMake(61.68, 114.88) controlPoint1: CGPointMake(60.24, 115) controlPoint2: CGPointMake(60.96, 114.96)];
		[bezierPath addCurveToPoint: CGPointMake(76.5, 123) controlPoint1: CGPointMake(64.36, 119.69) controlPoint2: CGPointMake(69.99, 123)];
		[bezierPath addCurveToPoint: CGPointMake(84.35, 121.26) controlPoint1: CGPointMake(79.34, 123) controlPoint2: CGPointMake(82.02, 122.37)];
		[bezierPath addCurveToPoint: CGPointMake(99.5, 130) controlPoint1: CGPointMake(86.89, 126.4) controlPoint2: CGPointMake(92.71, 130)];
		[bezierPath addCurveToPoint: CGPointMake(101.68, 129.88) controlPoint1: CGPointMake(100.24, 130) controlPoint2: CGPointMake(100.96, 129.96)];
		[bezierPath addCurveToPoint: CGPointMake(116.5, 138) controlPoint1: CGPointMake(104.36, 134.69) controlPoint2: CGPointMake(109.99, 138)];
		[bezierPath addCurveToPoint: CGPointMake(125, 135.93) controlPoint1: CGPointMake(119.61, 138) controlPoint2: CGPointMake(122.52, 137.24)];
		[bezierPath addCurveToPoint: CGPointMake(129.66, 137.6) controlPoint1: CGPointMake(126.43, 136.69) controlPoint2: CGPointMake(127.99, 137.26)];
		[bezierPath addCurveToPoint: CGPointMake(142.5, 143) controlPoint1: CGPointMake(132.68, 140.9) controlPoint2: CGPointMake(137.31, 143)];
		[bezierPath addCurveToPoint: CGPointMake(150.35, 141.26) controlPoint1: CGPointMake(145.34, 143) controlPoint2: CGPointMake(148.02, 142.37)];
		[bezierPath addCurveToPoint: CGPointMake(165.5, 150) controlPoint1: CGPointMake(152.89, 146.4) controlPoint2: CGPointMake(158.72, 150)];
		[bezierPath addCurveToPoint: CGPointMake(167.68, 149.88) controlPoint1: CGPointMake(166.24, 150) controlPoint2: CGPointMake(166.96, 149.96)];
		[bezierPath addCurveToPoint: CGPointMake(182.5, 158) controlPoint1: CGPointMake(170.36, 154.69) controlPoint2: CGPointMake(175.99, 158)];
		[bezierPath addCurveToPoint: CGPointMake(191, 155.93) controlPoint1: CGPointMake(185.61, 158) controlPoint2: CGPointMake(188.52, 157.24)];
		[bezierPath addCurveToPoint: CGPointMake(199.5, 158) controlPoint1: CGPointMake(193.48, 157.24) controlPoint2: CGPointMake(196.39, 158)];
		[bezierPath addCurveToPoint: CGPointMake(216, 143.5) controlPoint1: CGPointMake(208.61, 158) controlPoint2: CGPointMake(216, 151.51)];
		[bezierPath addCurveToPoint: CGPointMake(215.99, 142.99) controlPoint1: CGPointMake(216, 143.33) controlPoint2: CGPointMake(216, 143.16)];
		[bezierPath addCurveToPoint: CGPointMake(216.5, 143) controlPoint1: CGPointMake(216.16, 143) controlPoint2: CGPointMake(216.33, 143)];
		[bezierPath addCurveToPoint: CGPointMake(225, 140.93) controlPoint1: CGPointMake(219.61, 143) controlPoint2: CGPointMake(222.52, 142.24)];
		[bezierPath addCurveToPoint: CGPointMake(233.5, 143) controlPoint1: CGPointMake(227.48, 142.24) controlPoint2: CGPointMake(230.39, 143)];
		[bezierPath addCurveToPoint: CGPointMake(250, 128.5) controlPoint1: CGPointMake(242.61, 143) controlPoint2: CGPointMake(250, 136.51)];
		[bezierPath addCurveToPoint: CGPointMake(249.66, 125.56) controlPoint1: CGPointMake(250, 127.49) controlPoint2: CGPointMake(249.88, 126.51)];
		[bezierPath addCurveToPoint: CGPointMake(257, 113.5) controlPoint1: CGPointMake(254.09, 122.96) controlPoint2: CGPointMake(257, 118.53)];
		[bezierPath addCurveToPoint: CGPointMake(253.19, 104.24) controlPoint1: CGPointMake(257, 109.98) controlPoint2: CGPointMake(255.57, 106.75)];
		[bezierPath addCurveToPoint: CGPointMake(260, 92.5) controlPoint1: CGPointMake(257.32, 101.6) controlPoint2: CGPointMake(260, 97.33)];
		[bezierPath addCurveToPoint: CGPointMake(243.5, 78) controlPoint1: CGPointMake(260, 84.49) controlPoint2: CGPointMake(252.61, 78)];
		[bezierPath addCurveToPoint: CGPointMake(238.97, 78.55) controlPoint1: CGPointMake(241.93, 78) controlPoint2: CGPointMake(240.41, 78.19)];
		[bezierPath addCurveToPoint: CGPointMake(222.5, 65) controlPoint1: CGPointMake(238.41, 70.99) controlPoint2: CGPointMake(231.25, 65)];
		[bezierPath addCurveToPoint: CGPointMake(214.6, 66.77) controlPoint1: CGPointMake(219.64, 65) controlPoint2: CGPointMake(216.94, 65.64)];
		[bezierPath addCurveToPoint: CGPointMake(213.19, 65.76) controlPoint1: CGPointMake(214.15, 66.41) controlPoint2: CGPointMake(213.68, 66.08)];
		[bezierPath closePath];
		[data addPath:bezierPath];

		//
		UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
		[bezier3Path moveToPoint: CGPointMake(82, 250.5)];
		[bezier3Path addCurveToPoint: CGPointMake(143.5, 187.5) controlPoint1: CGPointMake(101.83, 244.67) controlPoint2: CGPointMake(141.9, 223.9)];
		[bezier3Path addCurveToPoint: CGPointMake(133.5, 140.5) controlPoint1: CGPointMake(145.1, 151.1) controlPoint2: CGPointMake(137.5, 141)];
		[bezier3Path moveToPoint: CGPointMake(225.5, 256)];
		[bezier3Path addCurveToPoint: CGPointMake(172, 227) controlPoint1: CGPointMake(207.17, 255) controlPoint2: CGPointMake(170.8, 247.8)];
		[bezier3Path addCurveToPoint: CGPointMake(183, 168.5) controlPoint1: CGPointMake(173.2, 206.2) controlPoint2: CGPointMake(179.83, 179.33)];
		[bezier3Path addCurveToPoint: CGPointMake(192.5, 156.5) controlPoint1: CGPointMake(185.17, 164.17) controlPoint2: CGPointMake(190.1, 155.7)];
		[bezier3Path moveToPoint: CGPointMake(158.5, 165)];
		[bezier3Path addCurveToPoint: CGPointMake(151, 214) controlPoint1: CGPointMake(157, 180.17) controlPoint2: CGPointMake(153.4, 211.2)];
		[bezier3Path moveToPoint: CGPointMake(163.5, 239.5)];
		[bezier3Path addCurveToPoint: CGPointMake(168.5, 168.5) controlPoint1: CGPointMake(163.5, 231.5) controlPoint2: CGPointMake(162.5, 183)];
		[bezier3Path moveToPoint: CGPointMake(145, 207.5)];
		[bezier3Path addCurveToPoint: CGPointMake(124.5, 236.5) controlPoint1: CGPointMake(132, 226.5) controlPoint2: CGPointMake(130.5, 231)];
		[data addPath:bezier3Path];
		
		//
		UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
		[bezier4Path moveToPoint: CGPointMake(99.5, 243.5)];
		[bezier4Path addCurveToPoint: CGPointMake(66, 248.81) controlPoint1: CGPointMake(91.5, 235) controlPoint2: CGPointMake(76.4, 235.61)];
		[bezier4Path moveToPoint: CGPointMake(39.5, 255)];
		[bezier4Path addCurveToPoint: CGPointMake(63.5, 248) controlPoint1: CGPointMake(42.83, 251.17) controlPoint2: CGPointMake(52.3, 244.4)];
		[bezier4Path addCurveToPoint: CGPointMake(74, 252) controlPoint1: CGPointMake(74.7, 251.6) controlPoint2: CGPointMake(75.17, 252.17)];
		[bezier4Path moveToPoint: CGPointMake(178, 240.5)];
		[bezier4Path addCurveToPoint: CGPointMake(201.5, 240.5) controlPoint1: CGPointMake(183, 237.73) controlPoint2: CGPointMake(194.7, 233.85)];
		[bezier4Path addCurveToPoint: CGPointMake(206.74, 246.5) controlPoint1: CGPointMake(203.78, 242.73) controlPoint2: CGPointMake(205.48, 244.74)];
		[bezier4Path moveToPoint: CGPointMake(210, 253.5)];
		[bezier4Path addCurveToPoint: CGPointMake(206.74, 246.5) controlPoint1: CGPointMake(210, 252.46) controlPoint2: CGPointMake(209.25, 249.99)];
		[bezier4Path moveToPoint: CGPointMake(206.74, 246.5)];
		[bezier4Path addCurveToPoint: CGPointMake(241.5, 248) controlPoint1: CGPointMake(218.33, 243.33) controlPoint2: CGPointMake(241.5, 239.2)];
		[bezier4Path addCurveToPoint: CGPointMake(224.5, 256) controlPoint1: CGPointMake(241.5, 256.8) controlPoint2: CGPointMake(225.83, 255.17)];
		RSDrawDataPath *path4 = [data addPath:bezier4Path];
		path4.lineWidth = 0.5;
	});
	
	return treeInstance;
}

// MARK: - Head template
+ (instancetype)landscape {
	static RSDrawData *landscapeInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		landscapeInstance = [RSDrawData new];
		RSDrawData *data = landscapeInstance;
		data.uid = 3;
		data.name = @"Landscape";

		//
		UIBezierPath* bezierPath = [UIBezierPath bezierPath];
		[bezierPath moveToPoint: CGPointMake(249, 134)];
		[bezierPath addLineToPoint: CGPointMake(255.5, 143.5)];
		[bezierPath addLineToPoint: CGPointMake(268, 156)];
		[bezierPath addLineToPoint: CGPointMake(267, 139.5)];
		[bezierPath addLineToPoint: CGPointMake(264.5, 124)];
		[bezierPath addLineToPoint: CGPointMake(259.5, 110.5)];
		[bezierPath addLineToPoint: CGPointMake(255.5, 102)];
		[bezierPath addLineToPoint: CGPointMake(251.5, 94.5)];
		[bezierPath addLineToPoint: CGPointMake(245.5, 86)];
		[bezierPath addLineToPoint: CGPointMake(240.5, 85.5)];
		[bezierPath addLineToPoint: CGPointMake(238, 85.5)];
		[bezierPath addLineToPoint: CGPointMake(234, 86)];
		[bezierPath addLineToPoint: CGPointMake(230, 87.5)];
		[bezierPath addLineToPoint: CGPointMake(226.5, 85.5)];
		[bezierPath addLineToPoint: CGPointMake(223.5, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(219.5, 85.5)];
		[bezierPath addLineToPoint: CGPointMake(214.5, 85.5)];
		[bezierPath addLineToPoint: CGPointMake(210, 87.5)];
		[bezierPath addLineToPoint: CGPointMake(207, 86)];
		[bezierPath addLineToPoint: CGPointMake(203, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(199, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(192, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(185.5, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(182.5, 86)];
		[bezierPath addLineToPoint: CGPointMake(176, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(170, 84.5)];
		[bezierPath addLineToPoint: CGPointMake(166, 83.5)];
		[bezierPath addLineToPoint: CGPointMake(160.5, 85.5)];
		[bezierPath addLineToPoint: CGPointMake(157, 83.5)];
		[bezierPath addLineToPoint: CGPointMake(150, 83.5)];
		[bezierPath addLineToPoint: CGPointMake(155.5, 82)];
		[bezierPath addLineToPoint: CGPointMake(159, 79)];
		[bezierPath addLineToPoint: CGPointMake(160.5, 77)];
		[bezierPath addLineToPoint: CGPointMake(163.5, 74.5)];
		[bezierPath addLineToPoint: CGPointMake(166, 71)];
		[bezierPath addLineToPoint: CGPointMake(170, 71)];
		[bezierPath addLineToPoint: CGPointMake(177.5, 71)];
		[bezierPath addLineToPoint: CGPointMake(183, 71)];
		[bezierPath addLineToPoint: CGPointMake(188, 68)];
		[bezierPath addLineToPoint: CGPointMake(190, 64)];
		[bezierPath addLineToPoint: CGPointMake(196.5, 63)];
		[bezierPath addLineToPoint: CGPointMake(200, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(204, 64)];
		[bezierPath addLineToPoint: CGPointMake(208, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(210, 61.5)];
		[bezierPath addLineToPoint: CGPointMake(214.5, 59.5)];
		[bezierPath addLineToPoint: CGPointMake(220.5, 59.5)];
		[bezierPath addLineToPoint: CGPointMake(210, 52)];
		[bezierPath addLineToPoint: CGPointMake(196.5, 44.5)];
		[bezierPath addLineToPoint: CGPointMake(179, 37.5)];
		[bezierPath addLineToPoint: CGPointMake(159, 33.5)];
		[bezierPath addLineToPoint: CGPointMake(143.5, 32.5)];
		[bezierPath addLineToPoint: CGPointMake(126.5, 33.5)];
		[bezierPath addLineToPoint: CGPointMake(110, 36)];
		[bezierPath addLineToPoint: CGPointMake(97, 41)];
		[bezierPath addLineToPoint: CGPointMake(85.5, 46)];
		[bezierPath addLineToPoint: CGPointMake(91, 49)];
		[bezierPath addLineToPoint: CGPointMake(95, 53)];
		[bezierPath addLineToPoint: CGPointMake(98, 58.5)];
		[bezierPath addLineToPoint: CGPointMake(98.5, 64)];
		[bezierPath addLineToPoint: CGPointMake(95, 72)];
		[bezierPath addLineToPoint: CGPointMake(89.5, 77)];
		[bezierPath addLineToPoint: CGPointMake(85.5, 79)];
		[bezierPath addLineToPoint: CGPointMake(81, 79)];
		[bezierPath addLineToPoint: CGPointMake(74, 76)];
		[bezierPath addLineToPoint: CGPointMake(69, 72)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 65.5)];
		[bezierPath addLineToPoint: CGPointMake(65.5, 59.5)];
		[bezierPath addLineToPoint: CGPointMake(53, 70.5)];
		[bezierPath addLineToPoint: CGPointMake(44.5, 80.5)];
		[bezierPath addLineToPoint: CGPointMake(37, 92)];
		[bezierPath addLineToPoint: CGPointMake(31.5, 103)];
		[bezierPath addLineToPoint: CGPointMake(30, 109)];
		[bezierPath addLineToPoint: CGPointMake(33.5, 109)];
		[bezierPath addLineToPoint: CGPointMake(37, 108)];
		[bezierPath addLineToPoint: CGPointMake(43.5, 112)];
		[bezierPath addLineToPoint: CGPointMake(49.5, 112)];
		[bezierPath addLineToPoint: CGPointMake(55.5, 117)];
		[bezierPath addLineToPoint: CGPointMake(59, 116)];
		[bezierPath addLineToPoint: CGPointMake(64, 118.5)];
		[bezierPath addLineToPoint: CGPointMake(61.5, 119.5)];
		[bezierPath addLineToPoint: CGPointMake(55.5, 121)];
		[bezierPath addLineToPoint: CGPointMake(50.5, 120)];
		[bezierPath addLineToPoint: CGPointMake(48.5, 121)];
		[bezierPath addLineToPoint: CGPointMake(44.5, 121)];
		[bezierPath addLineToPoint: CGPointMake(41.5, 121)];
		[bezierPath addLineToPoint: CGPointMake(39.5, 123)];
		[bezierPath addLineToPoint: CGPointMake(37.5, 122)];
		[bezierPath addLineToPoint: CGPointMake(35.5, 122)];
		[bezierPath addLineToPoint: CGPointMake(30, 119.5)];
		[bezierPath addLineToPoint: CGPointMake(24.5, 122)];
		[bezierPath addLineToPoint: CGPointMake(22, 130.5)];
		[bezierPath addLineToPoint: CGPointMake(20, 156.5)];
		[bezierPath addLineToPoint: CGPointMake(24.5, 186.5)];
		[bezierPath addLineToPoint: CGPointMake(31.5, 179.5)];
		[bezierPath addLineToPoint: CGPointMake(37, 175.5)];
		[bezierPath addLineToPoint: CGPointMake(48.5, 163)];
		[bezierPath addLineToPoint: CGPointMake(59, 151.5)];
		[bezierPath moveToPoint: CGPointMake(249, 134)];
		[bezierPath addLineToPoint: CGPointMake(238, 139.5)];
		[bezierPath moveToPoint: CGPointMake(249, 134)];
		[bezierPath addLineToPoint: CGPointMake(247.17, 143.5)];
		[bezierPath addLineToPoint: CGPointMake(247.17, 155)];
		[bezierPath moveToPoint: CGPointMake(238, 139.5)];
		[bezierPath addLineToPoint: CGPointMake(226.5, 116)];
		[bezierPath addLineToPoint: CGPointMake(218, 108.5)];
		[bezierPath addLineToPoint: CGPointMake(210, 118.5)];
		[bezierPath addLineToPoint: CGPointMake(199, 131)];
		[bezierPath addLineToPoint: CGPointMake(194.5, 128.5)];
		[bezierPath addLineToPoint: CGPointMake(177.5, 146.5)];
		[bezierPath addLineToPoint: CGPointMake(163.5, 167)];
		[bezierPath moveToPoint: CGPointMake(238, 139.5)];
		[bezierPath addLineToPoint: CGPointMake(242, 146.5)];
		[bezierPath addLineToPoint: CGPointMake(247.17, 155)];
		[bezierPath moveToPoint: CGPointMake(163.5, 167)];
		[bezierPath addLineToPoint: CGPointMake(155.5, 158)];
		[bezierPath addLineToPoint: CGPointMake(135, 138)];
		[bezierPath addLineToPoint: CGPointMake(127.5, 118.5)];
		[bezierPath addLineToPoint: CGPointMake(123, 118.5)];
		[bezierPath addLineToPoint: CGPointMake(116.5, 108.5)];
		[bezierPath moveToPoint: CGPointMake(163.5, 167)];
		[bezierPath addLineToPoint: CGPointMake(163.5, 169.5)];
		[bezierPath addLineToPoint: CGPointMake(167, 173)];
		[bezierPath addLineToPoint: CGPointMake(174.25, 180.25)];
		[bezierPath moveToPoint: CGPointMake(116.5, 108.5)];
		[bezierPath addLineToPoint: CGPointMake(105, 117)];
		[bezierPath addLineToPoint: CGPointMake(101.5, 124)];
		[bezierPath addLineToPoint: CGPointMake(90.5, 136.5)];
		[bezierPath addLineToPoint: CGPointMake(84.5, 134)];
		[bezierPath moveToPoint: CGPointMake(116.5, 108.5)];
		[bezierPath addLineToPoint: CGPointMake(112.5, 116)];
		[bezierPath addLineToPoint: CGPointMake(111, 124)];
		[bezierPath moveToPoint: CGPointMake(84.5, 134)];
		[bezierPath addLineToPoint: CGPointMake(69, 154)];
		[bezierPath addLineToPoint: CGPointMake(59, 151.5)];
		[bezierPath moveToPoint: CGPointMake(84.5, 134)];
		[bezierPath addLineToPoint: CGPointMake(84.5, 146.5)];
		[bezierPath addLineToPoint: CGPointMake(86.5, 158)];
		[bezierPath moveToPoint: CGPointMake(59, 151.5)];
		[bezierPath addLineToPoint: CGPointMake(62.5, 157.5)];
		[bezierPath addLineToPoint: CGPointMake(64, 164.5)];
		[bezierPath addLineToPoint: CGPointMake(64, 174)];
		[bezierPath addLineToPoint: CGPointMake(69, 183.5)];
		[bezierPath moveToPoint: CGPointMake(181.5, 187.5)];
		[bezierPath addLineToPoint: CGPointMake(174.25, 180.25)];
		[bezierPath moveToPoint: CGPointMake(258.5, 175)];
		[bezierPath addLineToPoint: CGPointMake(249, 158)];
		[bezierPath addLineToPoint: CGPointMake(247.17, 155)];
		[bezierPath moveToPoint: CGPointMake(174.25, 180.25)];
		[bezierPath addLineToPoint: CGPointMake(188, 175.5)];
		[bezierPath addLineToPoint: CGPointMake(189.16, 177)];
		[bezierPath moveToPoint: CGPointMake(196.5, 186.5)];
		[bezierPath addLineToPoint: CGPointMake(189.16, 177)];
		[bezierPath moveToPoint: CGPointMake(189.16, 177)];
		[bezierPath addLineToPoint: CGPointMake(196.5, 174)];
		[bezierPath addLineToPoint: CGPointMake(203, 177)];
		[bezierPath addLineToPoint: CGPointMake(213, 183.5)];
		[bezierPath addLineToPoint: CGPointMake(223.5, 187.5)];
		[bezierPath addLineToPoint: CGPointMake(232, 194.5)];
		[bezierPath addLineToPoint: CGPointMake(238, 196)];
		[bezierPath addLineToPoint: CGPointMake(253.5, 208)];
		[bezierPath moveToPoint: CGPointMake(108, 149)];
		[bezierPath addLineToPoint: CGPointMake(108, 140.5)];
		[bezierPath addLineToPoint: CGPointMake(109.5, 131)];
		[data addPath:bezierPath];

		//
		UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
		[bezier2Path moveToPoint: CGPointMake(35.5, 213.5)];
		[bezier2Path addLineToPoint: CGPointMake(50, 213.5)];
		[bezier2Path addLineToPoint: CGPointMake(64, 210)];
		[bezier2Path addLineToPoint: CGPointMake(81.5, 200.5)];
		[bezier2Path addLineToPoint: CGPointMake(98.5, 195.5)];
		[bezier2Path addLineToPoint: CGPointMake(114.5, 202)];
		[bezier2Path addLineToPoint: CGPointMake(127.25, 207.75)];
		[bezier2Path moveToPoint: CGPointMake(140, 213.5)];
		[bezier2Path addLineToPoint: CGPointMake(127.25, 207.75)];
		[bezier2Path moveToPoint: CGPointMake(127.25, 207.75)];
		[bezier2Path addLineToPoint: CGPointMake(140, 204)];
		[bezier2Path addLineToPoint: CGPointMake(150, 205.5)];
		[bezier2Path addLineToPoint: CGPointMake(159.5, 207.75)];
		[bezier2Path addLineToPoint: CGPointMake(173, 210)];
		[bezier2Path addLineToPoint: CGPointMake(195, 217.5)];
		[bezier2Path moveToPoint: CGPointMake(185.5, 220)];
		[bezier2Path addLineToPoint: CGPointMake(198, 217.5)];
		[bezier2Path addLineToPoint: CGPointMake(208.5, 212)];
		[bezier2Path addLineToPoint: CGPointMake(222.5, 212)];
		[bezier2Path addLineToPoint: CGPointMake(237, 212)];
		[bezier2Path addLineToPoint: CGPointMake(257, 207.75)];
		[bezier2Path moveToPoint: CGPointMake(56.5, 241.5)];
		[bezier2Path addLineToPoint: CGPointMake(70.5, 241.5)];
		[bezier2Path addLineToPoint: CGPointMake(87.5, 238)];
		[bezier2Path addLineToPoint: CGPointMake(104.5, 241.5)];
		[bezier2Path addLineToPoint: CGPointMake(129, 244.5)];
		[bezier2Path addLineToPoint: CGPointMake(173, 249)];
		[bezier2Path moveToPoint: CGPointMake(140, 258.5)];
		[bezier2Path addLineToPoint: CGPointMake(163.5, 252.5)];
		[bezier2Path addLineToPoint: CGPointMake(185.5, 241.5)];
		[bezier2Path addLineToPoint: CGPointMake(198, 235)];
		[bezier2Path addLineToPoint: CGPointMake(216.5, 235)];
		[bezier2Path addLineToPoint: CGPointMake(238.5, 235)];
		[bezier2Path moveToPoint: CGPointMake(86, 265)];
		[bezier2Path addLineToPoint: CGPointMake(98.5, 262.5)];
		[bezier2Path addLineToPoint: CGPointMake(123, 265)];
		[bezier2Path addLineToPoint: CGPointMake(151, 266)];
		[bezier2Path addLineToPoint: CGPointMake(173, 266)];
		[bezier2Path addLineToPoint: CGPointMake(195, 258.5)];
		[bezier2Path addLineToPoint: CGPointMake(218, 256)];
		[data addPath:bezier2Path];

		//
		UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
		[bezier3Path moveToPoint: CGPointMake(103.5, 153)];
		[bezier3Path addLineToPoint: CGPointMake(105.5, 159.5)];
		[bezier3Path addLineToPoint: CGPointMake(106.5, 170.5)];
		[bezier3Path addLineToPoint: CGPointMake(104, 189)];
		[bezier3Path addLineToPoint: CGPointMake(100.5, 206.5)];
		[bezier3Path addLineToPoint: CGPointMake(101, 216)];
		[bezier3Path addLineToPoint: CGPointMake(104, 224)];
		[bezier3Path moveToPoint: CGPointMake(108.5, 224)];
		[bezier3Path addLineToPoint: CGPointMake(109.5, 212.5)];
		[bezier3Path moveToPoint: CGPointMake(110.5, 208.5)];
		[bezier3Path addLineToPoint: CGPointMake(109.5, 196.5)];
		[bezier3Path addLineToPoint: CGPointMake(108.5, 188.5)];
		[bezier3Path addLineToPoint: CGPointMake(107.5, 181)];
		[bezier3Path moveToPoint: CGPointMake(116, 175.5)];
		[bezier3Path addLineToPoint: CGPointMake(118, 183.5)];
		[bezier3Path addLineToPoint: CGPointMake(119.5, 194)];
		[bezier3Path moveToPoint: CGPointMake(121, 184.5)];
		[bezier3Path addLineToPoint: CGPointMake(121.5, 190.5)];
		[bezier3Path addLineToPoint: CGPointMake(124, 199.5)];
		[bezier3Path addLineToPoint: CGPointMake(126.5, 205.5)];
		[bezier3Path moveToPoint: CGPointMake(125, 194)];
		[bezier3Path addLineToPoint: CGPointMake(125.5, 198.5)];
		[bezier3Path addLineToPoint: CGPointMake(129, 204.5)];
		[bezier3Path moveToPoint: CGPointMake(138, 182)];
		[bezier3Path addLineToPoint: CGPointMake(139, 189)];
		[bezier3Path addLineToPoint: CGPointMake(140.5, 196)];
		[bezier3Path addLineToPoint: CGPointMake(143, 201.5)];
		[bezier3Path moveToPoint: CGPointMake(146.5, 203)];
		[bezier3Path addLineToPoint: CGPointMake(143.5, 197)];
		[bezier3Path addLineToPoint: CGPointMake(142, 192)];
		[bezier3Path addLineToPoint: CGPointMake(141.5, 187)];
		[bezier3Path moveToPoint: CGPointMake(139, 196)];
		[bezier3Path addLineToPoint: CGPointMake(137, 190)];
		[bezier3Path addLineToPoint: CGPointMake(136, 184)];
		[bezier3Path addLineToPoint: CGPointMake(135.5, 176)];
		[bezier3Path addLineToPoint: CGPointMake(136, 169)];
		[bezier3Path moveToPoint: CGPointMake(79, 158.5)];
		[bezier3Path addLineToPoint: CGPointMake(76.5, 166)];
		[bezier3Path addLineToPoint: CGPointMake(75.5, 173)];
		[bezier3Path addLineToPoint: CGPointMake(75.5, 181)];
		[bezier3Path moveToPoint: CGPointMake(73.5, 175.5)];
		[bezier3Path addLineToPoint: CGPointMake(74, 167.5)];
		[bezier3Path addLineToPoint: CGPointMake(76.5, 158.5)];
		[bezier3Path addLineToPoint: CGPointMake(80, 151)];
		[bezier3Path moveToPoint: CGPointMake(82.5, 140)];
		[bezier3Path addLineToPoint: CGPointMake(78.5, 146)];
		[bezier3Path addLineToPoint: CGPointMake(75.5, 152)];
		[bezier3Path moveToPoint: CGPointMake(38.5, 181)];
		[bezier3Path addLineToPoint: CGPointMake(36.5, 189)];
		[bezier3Path addLineToPoint: CGPointMake(33.5, 196.5)];
		[bezier3Path addLineToPoint: CGPointMake(30.5, 202)];
		[bezier3Path moveToPoint: CGPointMake(41.5, 181)];
		[bezier3Path addLineToPoint: CGPointMake(39.5, 188.5)];
		[bezier3Path addLineToPoint: CGPointMake(36, 197.5)];
		[bezier3Path moveToPoint: CGPointMake(43, 173)];
		[bezier3Path addLineToPoint: CGPointMake(42, 178.5)];
		[bezier3Path moveToPoint: CGPointMake(56.5, 159.5)];
		[bezier3Path addLineToPoint: CGPointMake(54, 169)];
		[bezier3Path moveToPoint: CGPointMake(55.5, 172)];
		[bezier3Path addLineToPoint: CGPointMake(54, 178.5)];
		[bezier3Path addLineToPoint: CGPointMake(53.5, 186)];
		[bezier3Path moveToPoint: CGPointMake(52.5, 174.5)];
		[bezier3Path addLineToPoint: CGPointMake(51.5, 184)];
		[bezier3Path moveToPoint: CGPointMake(62.5, 187)];
		[bezier3Path addLineToPoint: CGPointMake(63, 193)];
		[bezier3Path moveToPoint: CGPointMake(64.5, 194)];
		[bezier3Path addLineToPoint: CGPointMake(64.5, 208.5)];
		[bezier3Path moveToPoint: CGPointMake(80, 174.5)];
		[bezier3Path addLineToPoint: CGPointMake(80.5, 185.5)];
		[bezier3Path addLineToPoint: CGPointMake(81.5, 194)];
		[bezier3Path moveToPoint: CGPointMake(191.5, 141)];
		[bezier3Path addLineToPoint: CGPointMake(192, 145.5)];
		[bezier3Path addLineToPoint: CGPointMake(194.5, 152)];
		[bezier3Path addLineToPoint: CGPointMake(195.04, 154.5)];
		[bezier3Path moveToPoint: CGPointMake(194.5, 166.5)];
		[bezier3Path addLineToPoint: CGPointMake(196, 159)];
		[bezier3Path addLineToPoint: CGPointMake(195.04, 154.5)];
		[bezier3Path moveToPoint: CGPointMake(196, 140.5)];
		[bezier3Path addLineToPoint: CGPointMake(195.5, 146.5)];
		[bezier3Path addLineToPoint: CGPointMake(195.04, 154.5)];
		[bezier3Path moveToPoint: CGPointMake(207.5, 133.5)];
		[bezier3Path addLineToPoint: CGPointMake(205.5, 141)];
		[bezier3Path addLineToPoint: CGPointMake(203.5, 148.5)];
		[bezier3Path moveToPoint: CGPointMake(226, 144)];
		[bezier3Path addLineToPoint: CGPointMake(227.5, 153.5)];
		[bezier3Path addLineToPoint: CGPointMake(233.5, 166.5)];
		[bezier3Path moveToPoint: CGPointMake(205.5, 188.5)];
		[bezier3Path addLineToPoint: CGPointMake(210, 196)];
		[bezier3Path addLineToPoint: CGPointMake(215, 201.5)];
		[bezier3Path moveToPoint: CGPointMake(203.5, 202)];
		[bezier3Path addLineToPoint: CGPointMake(198, 198.5)];
		[bezier3Path moveToPoint: CGPointMake(253.5, 151)];
		[bezier3Path addLineToPoint: CGPointMake(253.5, 154.5)];
		[bezier3Path moveToPoint: CGPointMake(258, 153.5)];
		[bezier3Path addLineToPoint: CGPointMake(258, 158.5)];
		[bezier3Path addLineToPoint: CGPointMake(260.5, 162.5)];
		[bezier3Path moveToPoint: CGPointMake(119.5, 136)];
		[bezier3Path addLineToPoint: CGPointMake(121.5, 145.5)];
		[bezier3Path addLineToPoint: CGPointMake(126.5, 148.5)];
		[bezier3Path addLineToPoint: CGPointMake(129, 154.5)];
		[bezier3Path moveToPoint: CGPointMake(219, 116.5)];
		[bezier3Path addLineToPoint: CGPointMake(221, 120)];
		[bezier3Path addLineToPoint: CGPointMake(221, 124)];
		[bezier3Path moveToPoint: CGPointMake(215, 122.5)];
		[bezier3Path addLineToPoint: CGPointMake(213.5, 132.5)];
		[bezier3Path moveToPoint: CGPointMake(223.5, 196)];
		[bezier3Path addLineToPoint: CGPointMake(226, 197.5)];
		[bezier3Path addLineToPoint: CGPointMake(231, 199.5)];
		[bezier3Path addLineToPoint: CGPointMake(239.5, 206.5)];
		[bezier3Path moveToPoint: CGPointMake(159.5, 174.5)];
		[bezier3Path addLineToPoint: CGPointMake(162, 181)];
		[bezier3Path addLineToPoint: CGPointMake(168.5, 188.5)];
		RSDrawDataPath *path3 = [data addPath:bezier3Path];
		path3.lineWidth = 0.5;
	});
	
	return landscapeInstance;
}

// MARK: - Head template
+ (instancetype)planet {
	static RSDrawData *planetInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		planetInstance = [RSDrawData new];
		RSDrawData *data = planetInstance;
		data.uid = 4;
		data.name = @"Planet";
		
		//
		UIBezierPath* bezierPath = [UIBezierPath bezierPath];
		[bezierPath moveToPoint: CGPointMake(60.5, 154)];
		[bezierPath addLineToPoint: CGPointMake(51.5, 158)];
		[bezierPath addLineToPoint: CGPointMake(42.5, 165)];
		[bezierPath addLineToPoint: CGPointMake(34, 173)];
		[bezierPath addLineToPoint: CGPointMake(28, 181)];
		[bezierPath addLineToPoint: CGPointMake(26, 189)];
		[bezierPath addLineToPoint: CGPointMake(27, 197)];
		[bezierPath addLineToPoint: CGPointMake(31, 203.5)];
		[bezierPath addLineToPoint: CGPointMake(38, 209)];
		[bezierPath addLineToPoint: CGPointMake(48.5, 213.5)];
		[bezierPath addLineToPoint: CGPointMake(59.5, 216)];
		[bezierPath addLineToPoint: CGPointMake(71, 217)];
		[bezierPath addLineToPoint: CGPointMake(82, 217.5)];
		[bezierPath addLineToPoint: CGPointMake(88.5, 217.3)];
		[bezierPath moveToPoint: CGPointMake(60.5, 154)];
		[bezierPath addLineToPoint: CGPointMake(61, 147)];
		[bezierPath addLineToPoint: CGPointMake(63.5, 134.5)];
		[bezierPath addLineToPoint: CGPointMake(67, 124)];
		[bezierPath addLineToPoint: CGPointMake(71.5, 112.5)];
		[bezierPath addLineToPoint: CGPointMake(77, 104)];
		[bezierPath addLineToPoint: CGPointMake(84, 94.5)];
		[bezierPath addLineToPoint: CGPointMake(92, 87)];
		[bezierPath addLineToPoint: CGPointMake(100, 81.5)];
		[bezierPath addLineToPoint: CGPointMake(108.5, 76.5)];
		[bezierPath addCurveToPoint: CGPointMake(120, 71.5) controlPoint1: CGPointMake(112.17, 75) controlPoint2: CGPointMake(119.6, 71.9)];
		[bezierPath addCurveToPoint: CGPointMake(131, 68) controlPoint1: CGPointMake(120.4, 71.1) controlPoint2: CGPointMake(127.5, 69)];
		[bezierPath addLineToPoint: CGPointMake(147.5, 66.5)];
		[bezierPath addLineToPoint: CGPointMake(161.5, 67.5)];
		[bezierPath addLineToPoint: CGPointMake(175.5, 70)];
		[bezierPath addLineToPoint: CGPointMake(188, 75)];
		[bezierPath addLineToPoint: CGPointMake(200, 82.5)];
		[bezierPath addLineToPoint: CGPointMake(208.5, 89.5)];
		[bezierPath addLineToPoint: CGPointMake(215.5, 96.5)];
		[bezierPath addLineToPoint: CGPointMake(221.5, 103.5)];
		[bezierPath moveToPoint: CGPointMake(60.5, 154)];
		[bezierPath addLineToPoint: CGPointMake(60.5, 160.5)];
		[bezierPath addLineToPoint: CGPointMake(61.5, 168)];
		[bezierPath moveToPoint: CGPointMake(221.5, 103.5)];
		[bezierPath addLineToPoint: CGPointMake(230.5, 102)];
		[bezierPath addLineToPoint: CGPointMake(242.5, 101.5)];
		[bezierPath addLineToPoint: CGPointMake(254, 103)];
		[bezierPath addLineToPoint: CGPointMake(264.5, 107)];
		[bezierPath addLineToPoint: CGPointMake(271.5, 112.5)];
		[bezierPath addLineToPoint: CGPointMake(274, 120)];
		[bezierPath addLineToPoint: CGPointMake(273.5, 129)];
		[bezierPath addLineToPoint: CGPointMake(270, 137.5)];
		[bezierPath addLineToPoint: CGPointMake(259.5, 151)];
		[bezierPath addLineToPoint: CGPointMake(251, 159.5)];
		[bezierPath addLineToPoint: CGPointMake(238, 169.5)];
		[bezierPath addLineToPoint: CGPointMake(234.67, 171.5)];
		[bezierPath moveToPoint: CGPointMake(221.5, 103.5)];
		[bezierPath addLineToPoint: CGPointMake(225, 108.5)];
		[bezierPath addLineToPoint: CGPointMake(228, 115)];
		[bezierPath moveToPoint: CGPointMake(61.5, 168)];
		[bezierPath addLineToPoint: CGPointMake(57.5, 170.5)];
		[bezierPath addLineToPoint: CGPointMake(54, 175)];
		[bezierPath addLineToPoint: CGPointMake(52.5, 180)];
		[bezierPath addLineToPoint: CGPointMake(53, 185)];
		[bezierPath addLineToPoint: CGPointMake(55.5, 189)];
		[bezierPath addLineToPoint: CGPointMake(60.5, 192)];
		[bezierPath addLineToPoint: CGPointMake(68, 195)];
		[bezierPath addLineToPoint: CGPointMake(70.5, 195.47)];
		[bezierPath moveToPoint: CGPointMake(61.5, 168)];
		[bezierPath addLineToPoint: CGPointMake(64, 176.5)];
		[bezierPath addLineToPoint: CGPointMake(66.5, 185)];
		[bezierPath addLineToPoint: CGPointMake(70.5, 195.47)];
		[bezierPath moveToPoint: CGPointMake(228, 115)];
		[bezierPath addLineToPoint: CGPointMake(234.5, 115)];
		[bezierPath addLineToPoint: CGPointMake(242.5, 118)];
		[bezierPath addLineToPoint: CGPointMake(245.5, 122)];
		[bezierPath addLineToPoint: CGPointMake(246, 128)];
		[bezierPath addLineToPoint: CGPointMake(244.5, 133.5)];
		[bezierPath addLineToPoint: CGPointMake(240.5, 139)];
		[bezierPath addLineToPoint: CGPointMake(236.83, 143)];
		[bezierPath moveToPoint: CGPointMake(228, 115)];
		[bezierPath addLineToPoint: CGPointMake(231, 122)];
		[bezierPath addLineToPoint: CGPointMake(234.67, 133.5)];
		[bezierPath addLineToPoint: CGPointMake(236.83, 143)];
		[bezierPath moveToPoint: CGPointMake(88.5, 217.3)];
		[bezierPath addLineToPoint: CGPointMake(98.5, 217)];
		[bezierPath addLineToPoint: CGPointMake(119.5, 214.5)];
		[bezierPath addLineToPoint: CGPointMake(137, 211)];
		[bezierPath addLineToPoint: CGPointMake(152.5, 207)];
		[bezierPath addLineToPoint: CGPointMake(172, 201)];
		[bezierPath addLineToPoint: CGPointMake(191.5, 193.5)];
		[bezierPath addLineToPoint: CGPointMake(207, 186.5)];
		[bezierPath addLineToPoint: CGPointMake(223, 178.5)];
		[bezierPath addLineToPoint: CGPointMake(234.67, 171.5)];
		[bezierPath moveToPoint: CGPointMake(88.5, 217.3)];
		[bezierPath addLineToPoint: CGPointMake(93.5, 223)];
		[bezierPath addLineToPoint: CGPointMake(101.5, 229)];
		[bezierPath addLineToPoint: CGPointMake(110.5, 233.5)];
		[bezierPath addLineToPoint: CGPointMake(119.5, 237)];
		[bezierPath addLineToPoint: CGPointMake(130.5, 240.5)];
		[bezierPath addLineToPoint: CGPointMake(143, 242.5)];
		[bezierPath addLineToPoint: CGPointMake(155, 242.5)];
		[bezierPath addLineToPoint: CGPointMake(166, 241.5)];
		[bezierPath addLineToPoint: CGPointMake(175.5, 239)];
		[bezierPath addLineToPoint: CGPointMake(183, 236)];
		[bezierPath addLineToPoint: CGPointMake(192.5, 231.5)];
		[bezierPath addLineToPoint: CGPointMake(200, 226.5)];
		[bezierPath addLineToPoint: CGPointMake(206, 222)];
		[bezierPath addLineToPoint: CGPointMake(214, 213.5)];
		[bezierPath addLineToPoint: CGPointMake(222, 203.5)];
		[bezierPath addLineToPoint: CGPointMake(227.5, 194)];
		[bezierPath addLineToPoint: CGPointMake(232.5, 182)];
		[bezierPath addLineToPoint: CGPointMake(234.67, 171.5)];
		[bezierPath moveToPoint: CGPointMake(236.83, 143)];
		[bezierPath addLineToPoint: CGPointMake(235, 145)];
		[bezierPath addLineToPoint: CGPointMake(230, 150)];
		[bezierPath addLineToPoint: CGPointMake(224, 154.5)];
		[bezierPath addLineToPoint: CGPointMake(216.5, 159.5)];
		[bezierPath addLineToPoint: CGPointMake(209.5, 164)];
		[bezierPath addLineToPoint: CGPointMake(202.5, 168)];
		[bezierPath addLineToPoint: CGPointMake(195.5, 171.5)];
		[bezierPath addLineToPoint: CGPointMake(186.5, 176)];
		[bezierPath addLineToPoint: CGPointMake(175, 181)];
		[bezierPath addLineToPoint: CGPointMake(163.5, 185)];
		[bezierPath addLineToPoint: CGPointMake(151.5, 188.5)];
		[bezierPath addLineToPoint: CGPointMake(140, 191.5)];
		[bezierPath addLineToPoint: CGPointMake(128, 194)];
		[bezierPath addLineToPoint: CGPointMake(116, 196)];
		[bezierPath addLineToPoint: CGPointMake(104, 197)];
		[bezierPath addLineToPoint: CGPointMake(92.5, 197.5)];
		[bezierPath addLineToPoint: CGPointMake(83.5, 197)];
		[bezierPath addLineToPoint: CGPointMake(76, 196.5)];
		[bezierPath addLineToPoint: CGPointMake(70.5, 195.47)];
		[data addPath:bezierPath];


		//// Bezier 2 Drawing
		UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
		[bezier2Path moveToPoint: CGPointMake(156, 114.5)];
		[bezier2Path addLineToPoint: CGPointMake(162, 111.5)];
		[bezier2Path addLineToPoint: CGPointMake(171.5, 106)];
		[bezier2Path addLineToPoint: CGPointMake(181, 99)];
		[bezier2Path addLineToPoint: CGPointMake(187.5, 92)];
		[bezier2Path addLineToPoint: CGPointMake(191.5, 85)];
		[bezier2Path addLineToPoint: CGPointMake(194, 79)];
		[bezier2Path moveToPoint: CGPointMake(109.5, 93)];
		[bezier2Path addLineToPoint: CGPointMake(102.5, 92.5)];
		[bezier2Path addLineToPoint: CGPointMake(96.5, 90.5)];
		[bezier2Path addLineToPoint: CGPointMake(91.5, 87.5)];
		[bezier2Path moveToPoint: CGPointMake(120, 91.5)];
		[bezier2Path addLineToPoint: CGPointMake(127.5, 89.5)];
		[bezier2Path addLineToPoint: CGPointMake(135.5, 87)];
		[bezier2Path addLineToPoint: CGPointMake(143.5, 82.5)];
		[bezier2Path addCurveToPoint: CGPointMake(151, 77) controlPoint1: CGPointMake(145.83, 80.83) controlPoint2: CGPointMake(150.6, 77.4)];
		[bezier2Path addCurveToPoint: CGPointMake(155.5, 72) controlPoint1: CGPointMake(151.4, 76.6) controlPoint2: CGPointMake(154.17, 73.5)];
		[bezier2Path addLineToPoint: CGPointMake(157.5, 67.5)];
		[bezier2Path moveToPoint: CGPointMake(97.5, 108.5)];
		[bezier2Path addLineToPoint: CGPointMake(102, 109.5)];
		[bezier2Path addLineToPoint: CGPointMake(109.5, 109.5)];
		[bezier2Path addLineToPoint: CGPointMake(117.5, 108.5)];
		[bezier2Path addLineToPoint: CGPointMake(124.5, 107)];
		[bezier2Path addLineToPoint: CGPointMake(133, 105)];
		[bezier2Path moveToPoint: CGPointMake(103, 128)];
		[bezier2Path addCurveToPoint: CGPointMake(107, 127.5) controlPoint1: CGPointMake(103.4, 128) controlPoint2: CGPointMake(105.83, 127.67)];
		[bezier2Path addLineToPoint: CGPointMake(111.5, 127)];
		[bezier2Path addLineToPoint: CGPointMake(115.5, 126)];
		[bezier2Path moveToPoint: CGPointMake(94.5, 127.5)];
		[bezier2Path addLineToPoint: CGPointMake(87, 127)];
		[bezier2Path addLineToPoint: CGPointMake(80, 124.5)];
		[bezier2Path addCurveToPoint: CGPointMake(73.5, 121.5) controlPoint1: CGPointMake(78, 123.5) controlPoint2: CGPointMake(73.9, 121.5)];
		[bezier2Path addCurveToPoint: CGPointMake(69, 119) controlPoint1: CGPointMake(73.1, 121.5) controlPoint2: CGPointMake(70.33, 119.83)];
		[bezier2Path moveToPoint: CGPointMake(86.5, 166.5)];
		[bezier2Path addLineToPoint: CGPointMake(78.5, 165)];
		[bezier2Path addLineToPoint: CGPointMake(69.5, 161.5)];
		[bezier2Path addLineToPoint: CGPointMake(60.5, 156)];
		[bezier2Path moveToPoint: CGPointMake(106.5, 166.5)];
		[bezier2Path addLineToPoint: CGPointMake(112, 166.5)];
		[bezier2Path addLineToPoint: CGPointMake(116.5, 166)];
		[bezier2Path addLineToPoint: CGPointMake(125.5, 164.5)];
		[bezier2Path addLineToPoint: CGPointMake(136, 162)];
		[bezier2Path addLineToPoint: CGPointMake(145.5, 159.5)];
		[bezier2Path addLineToPoint: CGPointMake(155, 156.5)];
		[bezier2Path addLineToPoint: CGPointMake(164.5, 153.5)];
		[bezier2Path addLineToPoint: CGPointMake(174.5, 149)];
		[bezier2Path addLineToPoint: CGPointMake(184, 144.5)];
		[bezier2Path addLineToPoint: CGPointMake(192, 139.5)];
		[bezier2Path addLineToPoint: CGPointMake(198, 135.5)];
		[bezier2Path addLineToPoint: CGPointMake(203.5, 132)];
		[bezier2Path moveToPoint: CGPointMake(212, 124)];
		[bezier2Path addLineToPoint: CGPointMake(216, 119)];
		[bezier2Path addLineToPoint: CGPointMake(219.5, 113)];
		[bezier2Path addLineToPoint: CGPointMake(222.5, 105.5)];
		[bezier2Path moveToPoint: CGPointMake(125.5, 145)];
		[bezier2Path addLineToPoint: CGPointMake(133.5, 143)];
		[bezier2Path addLineToPoint: CGPointMake(146.5, 139)];
		[bezier2Path addLineToPoint: CGPointMake(155, 136)];
		[bezier2Path addLineToPoint: CGPointMake(164, 132)];
		[bezier2Path addLineToPoint: CGPointMake(171.5, 128.5)];
		[bezier2Path addLineToPoint: CGPointMake(178, 125)];
		[bezier2Path moveToPoint: CGPointMake(86.5, 184)];
		[bezier2Path addLineToPoint: CGPointMake(93.5, 184.5)];
		[bezier2Path addLineToPoint: CGPointMake(101, 184.5)];
		[bezier2Path addLineToPoint: CGPointMake(109, 183.5)];
		[bezier2Path moveToPoint: CGPointMake(190.5, 159.5)];
		[bezier2Path addLineToPoint: CGPointMake(196.5, 157.5)];
		[bezier2Path addLineToPoint: CGPointMake(204, 153)];
		[bezier2Path addLineToPoint: CGPointMake(213, 146)];
		[bezier2Path addLineToPoint: CGPointMake(219, 141.5)];
		[bezier2Path addLineToPoint: CGPointMake(223, 137)];
		[bezier2Path moveToPoint: CGPointMake(167, 213.5)];
		[bezier2Path addLineToPoint: CGPointMake(171.5, 212.5)];
		[bezier2Path addLineToPoint: CGPointMake(180.5, 209)];
		[bezier2Path addLineToPoint: CGPointMake(188.5, 205.5)];
		[bezier2Path addLineToPoint: CGPointMake(195, 202.5)];
		[bezier2Path addLineToPoint: CGPointMake(201, 199.5)];
		[bezier2Path addLineToPoint: CGPointMake(203.5, 196.5)];
		[bezier2Path moveToPoint: CGPointMake(208.5, 209)];
		[bezier2Path addLineToPoint: CGPointMake(214.5, 205.5)];
		[bezier2Path addLineToPoint: CGPointMake(220, 201.5)];
		[bezier2Path addLineToPoint: CGPointMake(227.5, 194)];
		[bezier2Path moveToPoint: CGPointMake(198, 215)];
		[bezier2Path addLineToPoint: CGPointMake(190.5, 218.5)];
		[bezier2Path addLineToPoint: CGPointMake(180, 222.5)];
		[bezier2Path addLineToPoint: CGPointMake(170, 226)];
		[bezier2Path addLineToPoint: CGPointMake(159, 229)];
		[bezier2Path addLineToPoint: CGPointMake(148.5, 231.5)];
		[bezier2Path addLineToPoint: CGPointMake(134.5, 233)];
		[bezier2Path addLineToPoint: CGPointMake(121, 233.5)];
		[bezier2Path addLineToPoint: CGPointMake(109.5, 233)];
		[data addPath:bezier2Path];

		//
		UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
		[bezier3Path moveToPoint: CGPointMake(252.5, 181)];
		[bezier3Path addLineToPoint: CGPointMake(257.5, 177.5)];
		[bezier3Path addLineToPoint: CGPointMake(264.5, 178)];
		[bezier3Path addLineToPoint: CGPointMake(269, 181.5)];
		[bezier3Path addLineToPoint: CGPointMake(270.5, 186.5)];
		[bezier3Path addLineToPoint: CGPointMake(269.5, 191)];
		[bezier3Path addLineToPoint: CGPointMake(266.5, 195.5)];
		[bezier3Path addLineToPoint: CGPointMake(261.5, 197)];
		[bezier3Path addLineToPoint: CGPointMake(255.5, 196)];
		[bezier3Path addLineToPoint: CGPointMake(251.5, 192)];
		[bezier3Path addLineToPoint: CGPointMake(250, 187)];
		[bezier3Path addLineToPoint: CGPointMake(252.5, 181)];
		[bezier3Path closePath];
		
		[bezier3Path moveToPoint: CGPointMake(240, 211)];
		[bezier3Path addLineToPoint: CGPointMake(242, 209)];
		[bezier3Path addLineToPoint: CGPointMake(244.5, 209)];
		[bezier3Path addLineToPoint: CGPointMake(246.5, 210.5)];
		[bezier3Path addLineToPoint: CGPointMake(247, 213)];
		[bezier3Path addLineToPoint: CGPointMake(246, 215)];
		[bezier3Path addLineToPoint: CGPointMake(243.5, 216)];
		[bezier3Path addLineToPoint: CGPointMake(241, 215.5)];
		[bezier3Path addLineToPoint: CGPointMake(239.5, 213.5)];
		[bezier3Path addLineToPoint: CGPointMake(240, 211)];
		[bezier3Path closePath];
		
		[bezier3Path moveToPoint: CGPointMake(74.5, 242)];
		[bezier3Path addLineToPoint: CGPointMake(76.5, 241)];
		[bezier3Path addLineToPoint: CGPointMake(79.5, 242)];
		[bezier3Path addCurveToPoint: CGPointMake(81, 244.5) controlPoint1: CGPointMake(80, 242.67) controlPoint2: CGPointMake(81, 244.1)];
		[bezier3Path addCurveToPoint: CGPointMake(81, 247.5) controlPoint1: CGPointMake(81, 244.9) controlPoint2: CGPointMake(81.17, 246.83)];
		[bezier3Path addLineToPoint: CGPointMake(78.5, 249)];
		[bezier3Path addLineToPoint: CGPointMake(75, 249)];
		[bezier3Path addLineToPoint: CGPointMake(73.5, 247)];
		[bezier3Path addLineToPoint: CGPointMake(73, 244.5)];
		[bezier3Path addLineToPoint: CGPointMake(74.5, 242)];
		[bezier3Path closePath];
		
		[bezier3Path moveToPoint: CGPointMake(35.5, 76.5)];
		[bezier3Path addCurveToPoint: CGPointMake(41.5, 72) controlPoint1: CGPointMake(37.33, 75) controlPoint2: CGPointMake(41.1, 72)];
		[bezier3Path addLineToPoint: CGPointMake(48, 71)];
		[bezier3Path addLineToPoint: CGPointMake(54.5, 73)];
		[bezier3Path addLineToPoint: CGPointMake(60.5, 80)];
		[bezier3Path addLineToPoint: CGPointMake(61, 89.5)];
		[bezier3Path addLineToPoint: CGPointMake(57, 97)];
		[bezier3Path addLineToPoint: CGPointMake(48.5, 101)];
		[bezier3Path addLineToPoint: CGPointMake(39.5, 99)];
		[bezier3Path addLineToPoint: CGPointMake(33.5, 94.5)];
		[bezier3Path addLineToPoint: CGPointMake(31.5, 85.5)];
		[bezier3Path addLineToPoint: CGPointMake(35.5, 76.5)];
		[bezier3Path closePath];
		
		[bezier3Path moveToPoint: CGPointMake(217, 51)];
		[bezier3Path addCurveToPoint: CGPointMake(222.5, 50) controlPoint1: CGPointMake(218, 50.67) controlPoint2: CGPointMake(222.1, 50)];
		[bezier3Path addLineToPoint: CGPointMake(227, 53)];
		[bezier3Path addLineToPoint: CGPointMake(227.5, 58)];
		[bezier3Path addLineToPoint: CGPointMake(225.5, 62)];
		[bezier3Path addLineToPoint: CGPointMake(220.5, 63.5)];
		[bezier3Path addLineToPoint: CGPointMake(215.5, 61)];
		[bezier3Path addLineToPoint: CGPointMake(214, 55.5)];
		[bezier3Path addLineToPoint: CGPointMake(217, 51)];
		[bezier3Path closePath];
		
		[data addPath:bezier3Path];

	});
	
	return planetInstance;
}

@end
