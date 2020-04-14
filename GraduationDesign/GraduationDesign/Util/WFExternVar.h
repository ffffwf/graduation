//
//  WFExternVar.h
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#define SCREEN_WIDTH ([UIApplication sharedApplication].keyWindow.bounds.size.width)
#define SCREEN_HEIGHT ([UIApplication sharedApplication].keyWindow.bounds.size.height)

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B)     [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define STATUS_BAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define STATUS_BAR_NORMAL_HEIGHT (20 + NAVIGATION_BAR_OFFSET)
#define TAB_BAR_HEIGHT          (49 + IPHONE_X_BOTTOM_OFFSET)
#define NAVIGATION_BAR_HEIGHT   (64 + NAVIGATION_BAR_OFFSET)
#define NAVIGATION_BAR_OFFSET   ([UIDevice awe_isIPhoneX] ? (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? 4 : 24) : 0)
#define IPHONE_X_BOTTOM_OFFSET ([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0 ? 34 : 0)
#define VIDEO_FILL_MAX_RATO (9.2f / 16.0f)

