'''
Author: vanmit
LastEditors: vanmit
Date: 2023-05-17 00:39:05
LastEditTime: 2023-05-22 10:14:31
Descripttion: 
'''
import os
import fnmatch
import shutil

# 指定匹配规则
match_rules = ["*_test.cc","*_test_*.cc", "*_benchmark.cc","*_testing.cc","*_testing.h","*_test.h","*_test.cc","chi_square.cc","chi_square.h","*_mock_*.h","*_test_*.h","*_test.cc",
               "*_test_*.cc","test_*.cc","*_mock_*.cc","*_benchmarks.cc","benchmarks.cc","*_benchmark.lds"]

# 获取当前目录
current_dir = os.getcwd()

# 创建other目录
other_dir = os.path.join(current_dir, "tests")
os.makedirs(other_dir, exist_ok=True)

# 遍历所有子目录
for root, dirs, files in os.walk(os.path.join(current_dir, "absl")):
    # 构造other目录下对应的子目录
    other_root = root.replace(current_dir, other_dir)
    os.makedirs(other_root, exist_ok=True)

    # 遍历当前目录下的所有文件
    for file in files:
        # 判断文件是否符合所有匹配规则
        if any(fnmatch.fnmatch(file, match_rule) for match_rule in match_rules):
            # 构造other目录下对应的文件路径
            other_file = os.path.join(other_root, file)
            # 移动文件并保持目录结构
            shutil.move(os.path.join(root, file), other_file)
