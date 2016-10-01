//
//  Sprite.h
//  OpenGLTest
//
//  Created by callum taylor on 26/09/2015.
//  Copyright © 2015 callum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

typedef struct Position {
    float x;
    float y;
} Position;

typedef struct Color {
    GLubyte r;
    GLubyte g;
    GLubyte b;
    GLubyte a;
} Color;

//The vertex definition
typedef struct Vertex {
    //This is the position struct. When you store a struct or class
    //inside of another struct or class, it is called composition. This is
    //layed out exactly the same in memory as if we had a float position[2],
    //but doing it this way makes more sense.
    Position position;
    
    //4 bytes for r g b a color.
    Color color;
} Vertex;

@interface Sprite : NSObject

@property CGRect rect;
@property GLuint vboID;

- (id)initWithRect:(CGRect)rect;

- (void)draw;

@end
