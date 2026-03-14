# Distribute Options (fastforge) 使用说明

本项目使用 `fastforge` 通过 `distribute_options.yaml` 统一管理打包与分发。

## 文件位置

- 配置文件：`/Users/seaside/Projects/flutter/lunchbox/distribute_options.yaml`
- 产物目录：`/Users/seaside/Projects/flutter/lunchbox/dist/`

## 关键概念

### `variables`

用于注入发布平台所需的环境变量。当前配置包含：

- `PGYER_API_KEY`：蒲公英 API Key，用于上传发布包

建议在本地通过环境变量覆盖，避免提交真实密钥。

### `output`

构建产物输出目录，当前为 `dist/`。

### `releases`

发布流程定义。每个 `release` 是一个环境（如 `dev`、`prod`），包含多个 `jobs`。

## 当前发布矩阵

### `dev`

- Android AAB（`appbundle`）
- Android APK（`apk`）
- iOS IPA（`ipa`）

### `prod`

- Android AAB（`appbundle`）
- Android APK（`apk`）
- iOS IPA（`ipa`）

所有任务均发布到 `pgyer`。

## build 参数说明

### Android

- `target-platform`: `android-arm,android-arm64`
- `dart-define`: `APP_ENV=dev|prod`

### iOS

- `export-options-plist`:
  - `ios/dev_ExportOptions.plist`
  - `ios/prod_ExportOptions.plist`
- `dart-define`: `APP_ENV=dev|prod`

## 常用命令

以下命令以 `fastforge` 为例。若你使用的是其他封装 CLI，请按项目脚本替换。

```bash
# 发布 dev 环境
fastforge release dev

# 发布 prod 环境
fastforge release prod
```

## 推荐使用方式

1. 本地设置 `PGYER_API_KEY` 环境变量
2. 运行对应环境的发布命令
3. 产物输出至 `dist/`，并自动上传至蒲公英

## 签名与版本策略（推荐）

### Android 签名

1. 使用 `android/key.properties` + `android/app/keystore.jks`（本地保留，CI 注入）
2. `key.properties` 示例：

```properties
storePassword=...
keyPassword=...
keyAlias=...
storeFile=.../keystore.jks
```

3. CI 中通过 Secret 注入 `keystore.jks` 与 `key.properties`

### iOS 签名

1. `export-options-plist` 按环境区分（`dev/prod`）
2. `method` 使用明确渠道（如 `ad-hoc`、`app-store`）
3. 证书与描述文件通过 CI 注入（Fastlane Match 或 CI Secrets）

### 版本策略

- 使用 `version: 1.4.0+104`（业务版本 + 构建号）
- `build-name` 手动维护语义版本
- `build-number` 由 CI 自增（如 GitHub Actions `run_number`）

### 构建命令示例

```bash
flutter build apk --build-name 1.4.0 --build-number 104
flutter build appbundle --build-name 1.4.0 --build-number 104
flutter build ipa --build-name 1.4.0 --build-number 104
```

## 常见问题

### 1) 上传失败

- 确认 `PGYER_API_KEY` 是否有效
- 确认网络可访问蒲公英服务

### 2) iOS 构建失败

- 确认 `export-options-plist` 文件存在且配置正确
- 检查证书与签名配置

### 3) Android AAB 构建失败

- 确认 `target-platform` 配置无误
- 检查 Gradle 相关依赖与缓存
