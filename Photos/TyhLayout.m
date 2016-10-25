//
//  TyhLayout.m
//  Photos
//
//  Created by tyhmeng on 16/10/25.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "TyhLayout.h"

@implementation TyhLayout



//设置一些初始化的参数
- (void)prepareLayout
{
    
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(180, 180);
}


//数组里面是  UICollectionViewLayoutAttributes 对象    他的frame决定着cell显示的位置
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //获取已经布局好的数组
    NSArray  *tempArr = [super  layoutAttributesForElementsInRect:rect];
    //遍历数组
    for (UICollectionViewLayoutAttributes  *layoutArrributes in tempArr) {
        //定义中心点  滚过的距离 + collectionView的一半
        CGFloat centerX = self.collectionView.contentOffset.x  + self.collectionView.frame.size.width *0.5;
        
        
        CGFloat  scale;
        //（1）中心点和 当前layoutArrributes的中心 x相比较
        //（2）上述比较结果，决定当前cell距离中心点得距离  centerX  - layoutArrributes.center.x
        //（3）算出（2）中距离 与 后者的比例  决定cell大小的比例
        scale  = ABS(centerX  - layoutArrributes.center.x )  / (self.collectionView.frame.size.width  + self.itemSize.width *0.5);
        
        //大于0.5  说明cell 的一半已经滚出可是范围
        if (scale > 0.5) {
            
            scale = 0.5;
        }
        
        //按照比例改变大小 成反比
        layoutArrributes.transform  = CGAffineTransformMakeScale( 1-scale ,1- scale);
    }
    
    return  tempArr;
    
}

//当collectionView 的 bounds发生改变的时候 是否刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
    
}

//滑动完成后，会来到此方法
//proposedContentOffset  最后停止的 contentOffset

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    
    
    CGRect  rect;
    
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    //获取停止时，显示的cell的frame
    NSArray *tempArray  = [super  layoutAttributesForElementsInRect:rect];
    
    CGFloat  gap = 1000;
    
    CGFloat  a = 0;
    
    for (int i = 0; i < tempArray.count; i++) {
        //判断和中心的距离，得到最小的那个
        if (gap > ABS([tempArray[i] center].x - proposedContentOffset.x - self.collectionView.frame.size.width * 0.5)) {
            
            gap =  ABS([tempArray[i] center].x - proposedContentOffset.x - self.collectionView.frame.size.width * 0.5);
            
            a = [tempArray[i] center].x - proposedContentOffset.x - self.collectionView.frame.size.width * 0.5;
            
        }
    }
    
    //把希望得到的值返回出去
    CGPoint  point  =CGPointMake(proposedContentOffset.x + a , proposedContentOffset.y);
    
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    return point;
}

@end
