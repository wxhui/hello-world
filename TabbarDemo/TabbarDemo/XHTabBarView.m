//
//  XHTabBarView.m
//  TabbarDemo
//
//  Created by souche on 16/2/22.
//  Copyright © 2016年 wxhui. All rights reserved.
//

#import "XHTabBarView.h"

@interface XHTabBarView()

@property (nonatomic, strong) UIButton *selectedButton;

@end

@implementation XHTabBarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    return self;
}

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (void)setItems:(NSArray *)items {
    for (int i = 0; i<items.count; i++) {
        NSDictionary *dic = [items objectAtIndex:i];
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:[dic valueForKey:@"title"] forState:UIControlStateNormal];
        [button setTitle:[dic valueForKey:@"title"] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [button.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [button setImage:[UIImage imageNamed:[dic valueForKey:@"image"]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[dic valueForKey:@"hightlightImage"]] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

        // the space between the image and text
        CGFloat spacing = 2.0;
        
        // lower the text and push it left so it appears centered
        //  below the image
        CGSize imageSize = button.imageView.image.size;
        button.titleEdgeInsets = UIEdgeInsetsMake(
                                                  0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
        
        // raise the image and push it right so it appears centered
        //  above the text
        CGSize titleSize = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: button.titleLabel.font}];
        button.imageEdgeInsets = UIEdgeInsetsMake(
                                                  - (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
        
        button.tag = i;
        [self.buttonArray addObject:button];
        [self addSubview:button];
    }
    _items = items;
}

- (NSMutableArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = [[NSMutableArray alloc] init];
    }
    return _buttonArray;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.bounds.size;
    if ([self.items count] == 0) {
        return;
    }
    CGFloat btnWidth = size.width/self.items.count;
    CGFloat btnHeight = size.height;
    int i = 0;
    for (UIButton *button in self.buttonArray) {
        button.frame = CGRectMake(btnWidth*i, 0, btnWidth, btnHeight);
        
        i++;
    }
}

- (void)clickButton:(UIButton *)sender {
    _selectedButton.selected = NO;
    _selectedButton = sender;
    _selectedButton.selected = YES;
    if ([self.delegate respondsToSelector:@selector(buttonDidClick:)]) {
        [self.delegate performSelector:@selector(buttonDidClick:) withObject:sender];
    }
}

@end
