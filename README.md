# MyCCDraggableCardView
优化抽取自己的卡片模型
卡片轮播，模型事例，可以翻译，没有数据的空白页面的显示，页面美观仍需要修改
  项目是在CCDraggableCardView的基础上修改的，把模型和视图提取出来，便于直接使用，使用时只需要把加载数据的
         
`          #pragma mark ----加载数据
          -(void)loadDataWithPage:(int) page`
         
  里面的代码改成自己的逻辑，把模型和视图修改替换就好了
 ![例如代码中的](https://github.com/easyhaipi/MyCCDraggableCardView/raw/master/cardView.png)
         
  效果图如下：着实有点丑，颜色搭配也不好，自己修改就行
  ![效果图](https://github.com/easyhaipi/MyCCDraggableCardView/raw/master/carView-Demo.png)
 
