//
//  WFExternVar.h
//  GraduationDesign
//
//  Created by wufeng on 2020/1/31.
//  Copyright © 2020 wufeng. All rights reserved.
//

#define SCREEN_WIDTH ([UIApplication sharedApplication].keyWindow.bounds.size.width)
#define SCREEN_HEIGHT ([UIApplication sharedApplication].keyWindow.bounds.size.height)

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B)     [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

//@property (nonatomic, strong) UILabel *name;
//@property (nonatomic, strong) AFHTTPSessionManager *manager;

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
//    [self.view addSubview:self.name];
//    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];
//    self.name.text = @"你好";
//    self.name.textColor = [UIColor blackColor];
//    NSDictionary *params = @{@"consumerId" : @(1)};
//    [self.manager POST:@"http://192.168.8.174:8088/consumer/displayinfo" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
//        WFUserResponseModel *model = [MTLJSONAdapter modelOfClass:[WFUserResponseModel class] fromJSONDictionary:responseObject error:nil];
//        self.name.text = model.data.name;
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
//}
//
//- (UILabel *)name
//{
//    if (!_name) {
//        _name = [[UILabel alloc] init];
//    }
//    return _name;
//}
//
//- (AFHTTPSessionManager *)manager
//{
//    if (!_manager) {
//        _manager = [AFHTTPSessionManager manager];
//    }
//    return _manager;
//}

