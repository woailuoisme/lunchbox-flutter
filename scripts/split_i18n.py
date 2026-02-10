import json
import os

# 定义源文件路径
files = {
    'zh_CN': 'lib/i18n/zh_CN.i18n.json',
    'en': 'lib/i18n/en.i18n.json',
    'zh_TW': 'lib/i18n/zh_TW.i18n.json'
}

for locale, path in files.items():
    if not os.path.exists(path):
        print(f"Skipping {locale}: {path} not found")
        continue

    print(f"Processing {locale}...")

    # 读取原始大文件
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)

    # 创建对应的语言目录
    dir_path = os.path.join('lib/i18n', locale)
    os.makedirs(dir_path, exist_ok=True)

    # 按顶级 key 拆分为独立文件
    for key, value in data.items():
        # 使用 .json 后缀（更简洁）
        new_file_path = os.path.join(dir_path, f"{key}.json")
        with open(new_file_path, 'w', encoding='utf-8') as f_out:
            json.dump(value, f_out, indent=2, ensure_ascii=False)
        print(f"  -> Created {new_file_path}")

print("\nDone! Please verify the files and then delete the original .i18n.json files.")
