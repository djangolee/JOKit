//
//  SupportViewDidLoad.m
//  JoUIKit
//
//  Created by Panghu Lee on 12/12/2017.
//  Copyright © 2017 Django Lee. All rights reserved.
//

#import "SupportViewDidLoad.h"
#import <objc/runtime.h>

#pragma mark NSObject, about onceToken

@interface NSObject(_SupportLoad)

@property (nonatomic, strong, nullable) NSObject *_supportload_onceToken;

@end

@implementation NSObject(_SupportLoad)

static char _supportload_associatedKey;

-(NSObject * __nullable)_supportload_onceToken {
    return objc_getAssociatedObject(self, &_supportload_associatedKey);
}

- (void)set_supportload_onceToken:(NSObject * __nullable)_supportload_onceToken {
    objc_setAssociatedObject(self, &_supportload_associatedKey, _supportload_onceToken, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark UIViewController

@implementation UIViewController (_SupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method support = class_getInstanceMethod(self, @selector(_jo_supportLoadView));
    method_exchangeImplementations(origin, support);
}

// private

-(void)_jo_supportLoadView {
    [self _jo_supportLoadView];
    if (self.isViewLoaded && !self._supportload_onceToken) {
        self._supportload_onceToken = [NSObject new];
        [self performSelectorOnMainThread:@selector(_jo_viewWillInstallSubviews) withObject:nil waitUntilDone:nil];
    }
}

- (void)_jo_viewWillInstallSubviews {
    [self jo_viewWillInstallSubviews];
    [self performSelectorOnMainThread:@selector(_jo_installSubviews) withObject:nil waitUntilDone:nil];
}

- (void)_jo_installSubviews {
    [self jo_setupSubviews];
    [self jo_makeSubviewsLayout];
    [self performSelectorOnMainThread:@selector(_jo_viewDidInstallSubviews) withObject:nil waitUntilDone:nil];
}

- (void)_jo_viewDidInstallSubviews {
    [self jo_viewDidInstallSubviews];
}

// public

- (void)jo_viewWillInstallSubviews { }
- (void)jo_viewDidInstallSubviews { }

- (void)jo_setupSubviews { }
- (void)jo_makeSubviewsLayout { }

@end

#pragma mark UIView

@implementation UIView (_SupportLoad)

+ (void)load {
    {
        Method origin = class_getInstanceMethod(self, @selector(willMoveToWindow:));
        Method support = class_getInstanceMethod(self, @selector(_jo_willMoveToWindow:));
        method_exchangeImplementations(origin, support);
    }
    {
        Method origin = class_getInstanceMethod(self, @selector(didMoveToWindow));
        Method support = class_getInstanceMethod(self, @selector(_jo_didMoveToWindow));
        method_exchangeImplementations(origin, support);
    }
}

// private

- (void)_jo_willMoveToWindow:(UIWindow *)newWindow {
    [self _jo_willMoveToWindow:newWindow];
    
    if (!self._supportload_onceToken) {
        [self performSelectorOnMainThread:@selector(_jo_requiresviewDidLoad) withObject:nil waitUntilDone:nil];
    } else {
        if (newWindow) {
            [self performSelectorOnMainThread:@selector(_jo_viewWillAppear) withObject:nil waitUntilDone:nil];
        } else {
            [self performSelectorOnMainThread:@selector(_jo_viewWillDisappear) withObject:nil waitUntilDone:nil];
        }
    }
}

- (void)_jo_didMoveToWindow {
    [self _jo_didMoveToWindow];
    if (self.window) {
        [self performSelectorOnMainThread:@selector(_jo_viewDidDisappear) withObject:nil waitUntilDone:nil];
    } else {
        [self performSelectorOnMainThread:@selector(_jo_viewDidDisappear) withObject:nil waitUntilDone:nil];
    }
}

- (void)_jo_requiresviewDidLoad {
    if (self.window && !self._supportload_onceToken) {
        self._supportload_onceToken = [NSObject new];
        [self jo_viewDidLoad];
        [self performSelectorOnMainThread:@selector(_jo_viewWillInstallSubviews) withObject:nil waitUntilDone:nil];
    }
}

- (void)_jo_viewWillInstallSubviews {
    [self jo_viewWillInstallSubviews];
    [self performSelectorOnMainThread:@selector(_jo_installSubviews) withObject:nil waitUntilDone:nil];
}

- (void)_jo_installSubviews {
    [self jo_setupSubviews];
    [self jo_makeSubviewsLayout];
    [self performSelectorOnMainThread:@selector(_jo_viewDidInstallSubviews) withObject:nil waitUntilDone:nil];
}

- (void)_jo_viewDidInstallSubviews {
    [self jo_viewDidInstallSubviews];
}

- (void)_jo_viewWillAppear {
    [self jo_viewWillAppear];
}

- (void)_jo_viewDidAppear {
    [self jo_viewDidAppear];
}

- (void)_jo_viewWillDisappear {
    [self jo_viewWillDisappear];
}

- (void)_jo_viewDidDisappear {
    [self jo_viewDidDisappear];
}

// public

- (void)jo_viewDidLoad { }

- (void)jo_viewWillAppear { }
- (void)jo_viewDidAppear { }

- (void)jo_viewWillDisappear { }
- (void)jo_viewDidDisappear { }

- (void)jo_viewWillInstallSubviews { }
- (void)jo_viewDidInstallSubviews { }
- (void)jo_setupSubviews { }
- (void)jo_makeSubviewsLayout { }
@end
//
//#pragma mark CALayer
//
//@implementation CALayer (_SupportLoad)
//
//
//+ (void)load {
//    Method origin = class_getInstanceMethod(self, @selector(layoutSublayers));
//    Method support = class_getInstanceMethod(self, @selector(_SupportLoadView));
//    method_exchangeImplementations(origin, support);
//}
//
//-(void)_SupportLoadView {
//    [self _SupportLoadView];
//    if (self.superlayer && !self._supportload_onceToken) {
//        self._supportload_onceToken = [NSObject new];
//        [self jo_prepareLoadView];
//        [self jo_setupUI];
//        [self jo_setupSubviews];
//        [self jo_bindingSubviewsLayout];
//        [self jo_viewDidLoad];
//    }
//}
//
//#pragma SupportingLoad methods
//
//-(void)jo_prepareLoadView { }
//-(void)jo_setupUI { }
//-(void)jo_setupSubviews { }
//-(void)jo_bindingSubviewsLayout { }
//-(void)jo_viewDidLoad { }
//
//@end
//
//#pragma mark UIResponder
//
//@implementation UIResponder (_SupportLoad)
//
//#pragma SupportingLoad methods
//
//-(void)jo_prepareLoadView { }
//-(void)jo_setupUI { }
//-(void)jo_setupSubviews { }
//-(void)jo_bindingSubviewsLayout { }
//-(void)jo_viewDidLoad { }
//
//@end

