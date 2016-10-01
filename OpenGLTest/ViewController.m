//
//  ViewController.m
//  OpenGLTest
//
//  Created by callum taylor on 20/09/2015.
//  Copyright © 2015 callum. All rights reserved.
//

#import "ViewController.h"
#import "Shader.h"

typedef struct Color {
    float r;
    float g;
    float b;
    float a;
} Color;

@interface ViewController ()

@property (nonatomic) GLKView *glView;
@property (nonatomic) Shader *shader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    // Set up view
    GLKView *glkView = (GLKView *)self.view;
    glkView.context = context;
    
    glClearColor(1.f, 0.f, 0.f, 1.f);
    
    self.shader = [[Shader alloc] initWithVertexShader:@"Base" andFragmentShader:@"Gradient"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClear(GL_COLOR_BUFFER_BIT);
    [self.shader renderInRect:rect atTime:self.timeSinceFirstResume];
}

@end

