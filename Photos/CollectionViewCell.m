//
//  CollectionViewCell.m
//  Photos
//
//  Created by tyhmeng on 16/10/25.
//  Copyright © 2016年 tyhmeng. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *numberLable;


@end

@implementation CollectionViewCell

//设置图片
-  (void)setImageName:(NSString *)imageName {

    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];

}


//设置第几个图片
- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    self.numberLable.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];



}

@end
