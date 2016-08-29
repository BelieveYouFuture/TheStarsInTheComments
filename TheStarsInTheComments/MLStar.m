//
//  Created by 张文晏
//  Copyright © 2016年 张文晏. All rights reserved.
//
#import "MLStar.h"

@implementation MLStar


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage *imageStar = [UIImage imageNamed:@"star"];
    
    for (int i = 0; i < 5; ++i) {
        
        CGFloat Width = rect.size.width/5;
        [imageStar drawInRect:CGRectMake(i*Width, 0, Width, rect.size.height)];
    }
    
    //把纹理去掉
    [[UIColor whiteColor] setFill];
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceIn);
    
    //画颜色
    [[UIColor orangeColor] setFill];
    CGRect rect1 = CGRectMake(0, 0, self.progress, rect.size.height);
    UIRectFillUsingBlendMode(rect1, kCGBlendModeSourceIn);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point =  [touch locationInView:self];
    CGFloat X = point.x;
    self.progress = X;
}

-(void)setProgress:(CGFloat)progress{
    
    _progress = progress;
    
    CGFloat starW =  self.frame.size.width/5;
    
    NSLog(@"当前的评价星级指数===%.1f分",self.progress/starW);
    
    [self setNeedsDisplay];
}


@end
