//
//  MyCCDraggableCardView.m
//  MyCCDraggableCardView
//
//  Created by taobaichi on 16/8/31.
//  Copyright © 2016年 taobaichi. All rights reserved.
//

#import "MyCCDraggableCardView.h"

#import "MyModel.h"
@interface MyCCDraggableCardView()
@property (strong, nonatomic)  UIView *detailView;

@property (strong, nonatomic)  UIImageView *pic_urlImageView;
@property (strong, nonatomic)  UILabel *restaurant_nameLabel;
@property (strong, nonatomic)  UIView *tagAndClassView;



@property (strong, nonatomic)  UILabel *need_ping_numLabel;


@property (strong, nonatomic)  UILabel *current_ping_NameLabel;
@property (strong, nonatomic)  UILabel *current_ping_numLabel;
@property (strong, nonatomic)  UIView *divView;


@end

@implementation MyCCDraggableCardView


-(void)setModel:(MyModel *)model
{
    _model = model;
    
    
    self.pic_urlImageView.image = [UIImage imageNamed:model.picUrl];
    self.restaurant_nameLabel.text = [NSString stringWithFormat:@"名称 %@",model.name];

    self.need_ping_numLabel.text = [NSString stringWithFormat:@"任务需求 %@",model.need_ping_num];
    self.current_ping_numLabel.text = model.current_ping_num;
    
    self.current_ping_NameLabel.text = @"目前人气瓶";
    

}
- (instancetype)init {
    if (self = [super init]) {
        [self loadComponent];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadComponent];
    }
    return self;
}
//设置加载组件
- (void)loadComponent {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    
    self.detailView = [[UIView alloc] init];
    [self.detailView.layer setMasksToBounds:YES];
    [self addSubview:self.detailView];
    
    self.pic_urlImageView = [[UIImageView alloc] init];
    [self addSubview:self.pic_urlImageView];
    
    
    
    
    
    
    self.restaurant_nameLabel = [[UILabel alloc] init];
    self.restaurant_nameLabel.textColor = [UIColor blackColor];
    self.restaurant_nameLabel.font =[UIFont systemFontOfSize:14];
    self.restaurant_nameLabel.textAlignment = NSTextAlignmentLeft;
    
    [self.detailView addSubview:self.restaurant_nameLabel];
    
    
    self.current_ping_numLabel = [[UILabel alloc] init];
    
    self.current_ping_numLabel = [[UILabel alloc] init];
    
    
  
    self.current_ping_numLabel.textColor = [UIColor colorWithRed:235/255.0 green:97/255.0 blue:0 alpha:1.0];
    self.current_ping_numLabel.font =[UIFont systemFontOfSize:15];
    self.current_ping_numLabel.textAlignment = NSTextAlignmentCenter;
    [self.detailView addSubview:self.current_ping_numLabel];
    
    
    
    
    
    self.current_ping_NameLabel = [[UILabel alloc] init];
    self.current_ping_NameLabel.textColor = [UIColor blackColor];
    self.current_ping_NameLabel.font =[UIFont systemFontOfSize:14];
    self.current_ping_NameLabel.textAlignment = NSTextAlignmentRight;
    [self.detailView addSubview:self.current_ping_NameLabel];
    
    
    self.divView = [[UIView alloc] init];
    self.divView.backgroundColor = [UIColor lightGrayColor];
    self.divView.alpha = 0.4;
    [self.detailView addSubview:self.divView];
    
    
    
    self.tagAndClassView = [[UIView alloc] init];
    self.tagAndClassView.backgroundColor = [UIColor whiteColor];
    [self.detailView addSubview:self.tagAndClassView];
    
    
    
    
    
    
    self.need_ping_numLabel = [[UILabel alloc] init];
    
    self.need_ping_numLabel.textColor = [UIColor blackColor];
    self.need_ping_numLabel.font =[UIFont systemFontOfSize:14];
    self.need_ping_numLabel.textAlignment = NSTextAlignmentLeft;
    [self.detailView addSubview:self.need_ping_numLabel];
    
    
    
}

- (void)cc_layoutSubviews {
    
    
    //设置frame
    CGFloat margin = 15;
    CGFloat detailViewHeight = 95;
    
    self.detailView.frame = CGRectMake(margin, self.frame.size.height - detailViewHeight, self.frame.size.width - margin *2, detailViewHeight);
    self.pic_urlImageView.frame   = CGRectMake(margin, margin, self.frame.size.width - margin *2, self.frame.size.height - detailViewHeight -15);
    
    
    
    
    
    self.restaurant_nameLabel.frame = CGRectMake(0, 10, self.detailView.frame.size.width, 18);
    
    
    
    self.current_ping_NameLabel.frame = CGRectMake(self.detailView.frame.size.width - 80, CGRectGetMaxY(self.restaurant_nameLabel.frame), 80, 18);
    
    self.current_ping_numLabel.frame = CGRectMake(self.detailView.frame.size.width - 80, CGRectGetMaxY(self.current_ping_NameLabel.frame) +15, 80, 18);
    
    
    self.divView.frame = CGRectMake(self.detailView.frame.size.width - 80 -10, CGRectGetMaxY(self.restaurant_nameLabel.frame), 1, self.detailView.frame.size.height -CGRectGetMaxY(self.restaurant_nameLabel.frame)-10 );
    
    
    
    self.tagAndClassView.frame = CGRectMake(0,CGRectGetMaxY(self.restaurant_nameLabel.frame)+10 ,self.detailView.frame.size.width - 80 -10 ,20);
    
    
    
    
    self.need_ping_numLabel.frame = CGRectMake(0, CGRectGetMaxY(self.tagAndClassView.frame) +10, self.tagAndClassView.frame.size.width, 20);
    
    
}

@end
