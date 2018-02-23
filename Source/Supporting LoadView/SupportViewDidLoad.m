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
        [self _jo_requiresviewDidLoad:newWindow];
    }
    if (!self._supportload_onceToken) return;
    
    newWindow ? [self _jo_viewWillAppear] : [self _jo_viewWillDisappear];
}

- (void)_jo_didMoveToWindow {
    [self _jo_didMoveToWindow];
    
    self.window ? [self _jo_viewDidAppear] : [self _jo_viewDidDisappear];
}

- (void)_jo_requiresviewDidLoad:(UIWindow *)newWindow {
    if (newWindow && !self._supportload_onceToken) {
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

#pragma mark CALayer

@implementation CALayer (_SupportLoad)

+ (void)load {
    Method origin = class_getInstanceMethod(self, @selector(layoutSublayers));
    Method support = class_getInstanceMethod(self, @selector(_jo_layoutSublayers));
    method_exchangeImplementations(origin, support);
}

// private

- (void)_jo_layoutSublayers {
    [self _jo_layoutSublayers];
    
    if (self.superlayer && !self._supportload_onceToken) {
        self._supportload_onceToken = [NSObject new];
        [self performSelectorOnMainThread:@selector(_jo_requiresLayerDidLoad) withObject:nil waitUntilDone:nil];
    }
}

- (void)_jo_requiresLayerDidLoad {
    [self jo_layerDidLoad];
    [self performSelectorOnMainThread:@selector(_jo_layerWillInstallSublayers) withObject:nil waitUntilDone:nil];
}

- (void)_jo_layerWillInstallSublayers {
    [self jo_layerWillInstallSublayers];
    [self performSelectorOnMainThread:@selector(_jo_installSublayers) withObject:nil waitUntilDone:nil];
}

- (void)_jo_installSublayers {
    [self jo_setupSublayers];
    [self jo_makeSublayersLayout];
    [self performSelectorOnMainThread:@selector(_jo_layerDidInstallSublayers) withObject:nil waitUntilDone:nil];
}

- (void)_jo_layerDidInstallSublayers {
    [self jo_layerDidInstallSublayers];
}

// public

- (void)jo_layerDidLoad { }

- (void)jo_layerWillInstallSublayers { }
- (void)jo_layerDidInstallSublayers { }

- (void)jo_setupSublayers { }
- (void)jo_makeSublayersLayout { }

@end


