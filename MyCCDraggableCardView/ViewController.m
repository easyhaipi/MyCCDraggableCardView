//
//  ViewController.m
//  MyCCDraggableCardView
//
//  Created by taobaichi on 16/8/31.
//  Copyright © 2016年 taobaichi. All rights reserved.
//

#import "ViewController.h"
#import "CCDraggableContainer.h"
#import "MyCCDraggableCardView.h"



#import "MyModel.h"


/// 屏幕宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/// 屏幕高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<CCDraggableContainerDataSource,CCDraggableContainerDelegate>
{
    int pageInt;
    int maxPageInt;
    
    MyModel *currentModel;
}
@property (nonatomic, strong) CCDraggableContainer *container;
@property(nonatomic,strong)NSMutableArray *modelArray;
@property (strong, nonatomic) IBOutlet UIButton *tuijianButton;

@property (strong, nonatomic) IBOutlet UIButton *pingziButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@end

@implementation ViewController

-(NSMutableArray *)modelArray
{
    if (_modelArray == nil) {
        _modelArray = [[NSMutableArray alloc] init];
    }
    return _modelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    
    
}

- (void)loadUI {
    
    self.container = [[CCDraggableContainer alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth, kScreenHeight - 100 - 40 -64) style:CCDraggableStyleUpOverlay];
    self.container.delegate = self;
    self.container.dataSource = self;
    [self.view addSubview:self.container];
    
 
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
  
    
    self.pingziButton.hidden = NO;
    self.tuijianButton.hidden = NO;
    self.nextButton.hidden = NO;
    
    pageInt = 1;
    maxPageInt = 1;
    
    
    [self loadDataWithPage:pageInt];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----加载数据
-(void)loadDataWithPage:(int) page
{

    
    NSMutableArray *temArray = [[NSMutableArray alloc] init];

    if(pageInt<=maxPageInt){
        for (int i= 0; i <13; i++) {
            MyModel *model = [[MyModel alloc] init];
            model.name = [NSString stringWithFormat:@"name%d",i+(pageInt-1)*13];
            model.picUrl = [NSString stringWithFormat:@"%d.png",i+1];
            model.current_ping_num = [NSString stringWithFormat:@"%d",i+(pageInt-1)*13+10];
            model.need_ping_num = [NSString stringWithFormat:@"%d",i+(pageInt-1)*13+30];
            [temArray addObject:model];
        }
        
        maxPageInt = 2;
        self.modelArray = temArray;
        [self.container reloadData];

    }
   
}


#pragma mark - CCDraggableContainer DataSource

- (CCDraggableCardView *)draggableContainer:(CCDraggableContainer *)draggableContainer viewForIndex:(NSInteger)index{

    MyCCDraggableCardView *view = [[MyCCDraggableCardView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    view.model = [self.modelArray objectAtIndex:index];

    
    return view;
}

- (NSInteger)numberOfIndexs {
    return self.modelArray.count;
 
}

#pragma mark - CCDraggableContainer Delegate

- (void)draggableContainer:(CCDraggableContainer *)draggableContainer draggableDirection:(CCDraggableDirection)draggableDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio {
    
 
    if (draggableContainer.currentCards.count) {
         MyCCDraggableCardView *tt = [draggableContainer.currentCards objectAtIndex:0];
        
        MyModel *model = tt.model;
        
        currentModel = model;
        NSLog(@"-nameTag--%@",model.name);
    }
}

- (void)draggableContainer:(CCDraggableContainer *)draggableContainer cardView:(CCDraggableCardView *)cardView didSelectIndex:(NSInteger)didSelectIndex {
    MyModel *model = [self.modelArray objectAtIndex:didSelectIndex];
    NSLog(@"-查看这个的详情--%@",model.name);
}

- (void)draggableContainer:(CCDraggableContainer *)draggableContainer finishedDraggableLastCard:(BOOL)finishedDraggableLastCard {
    if (pageInt <= maxPageInt) {
        pageInt ++;
        [self loadDataWithPage:pageInt];
        self.pingziButton.hidden = NO;
        self.tuijianButton.hidden = NO;
        self.nextButton.hidden = NO;
        
    }else{
        self.pingziButton.hidden = YES;
        self.tuijianButton.hidden = YES;
        self.nextButton.hidden = YES;
    }
}


@end
