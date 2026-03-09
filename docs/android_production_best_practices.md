# Android 生产环境发布最佳实践 (Lunchbox 专版)

本指南总结了 **Lunchbox** 项目在 Android 生产环境下的配置规范，旨在确保应用的安全性和构建的一致性。

---

## 🚀 核心工作流：从零到 Release

### 1. 生成上传密钥 (Upload Key)

使用 Makefile 封装的命令生成，确保参数符合 Google 标准（RSA 2048, 高有效期）。

> [!IMPORTANT]
> **执行说明**: 
> 1. 请在 **本地终端 (Terminal)** 中执行 `make gen-key`。不要在 IDE 内置的非交互式输出窗口运行。
> 2. **密码输入**: 输入密码时屏幕 **不会显示任何字符**，请直接输完并按回车。
> 3. **强密码建议**: 推荐使用 16 位以上强随机密码。建议将 StorePassword 与 KeyPassword 设为相同。
> 4. **信息填写**: 姓名、组织等信息可按回车跳过，最后确认环节输入 `yes` 并回车。

```bash
make gen-key
```

遇到填写个人信息的交互提示时，可参考以下 **Lunchbox** 项目的专属示例信息：

* **What is your first and last name?** (您的名字与姓氏是什么？) 👉 `Lunchbox App`
* **What is the name of your organizational unit?** (组织单位名称？) 👉 `Dev Team`
* **What is the name of your organization?** (组织名称？) 👉 `Lunchbox Inc`
* **What is the name of your City or Locality?** (城市或区域？) 👉 `Shanghai`
* **What is the name of your State or Province?** (州或省份？) 👉 `Shanghai`
* **What is the two-letter country code for this unit?** (两字母国家代码？) 👉 `CN`
* **Is CN=Lunchbox App, OU=Dev Team... correct?** (确认信息？) 👉 `yes`

* **产物**: `android/app/upload-keystore.jks`
* **规范**: 别名设为 `upload`，有效期 10000 天。

### 2. 配置本地凭据
不要将密码硬编码在构建脚本中。使用 `key.properties` 进行解耦。

1.  复制模板：
    ```bash
    cp android/key.properties.example android/key.properties
    ```
2.  编辑 `android/key.properties` 并填入真实密码：
    ```properties
    storePassword=YOUR_PASSWORD
    keyPassword=YOUR_PASSWORD
    keyAlias=upload
    storeFile=../app/upload-keystore.jks
    ```

### 3. 构建 Release 包
使用 Makefile 运行生产环境构建：

```bash
# 构建 AAB 格式 (推荐用于 Google Play)
make build-apk-google

# 或者构建通用 APK
make build-apk-fat
```

---

## 🛡️ 安全性保障 (Security)

### 1. 代码不落地原则

* **`.gitignore`**: 已配置自动忽略所有 `*.jks`, `*.keystore` 以及 `key.properties`。
* **环境变量**: 生产环境敏感 API Key 应存放在 `.env.prod` 中，并通过 `Envied` 混淆处理，严禁明文出现在 Dart 代码中。

### 2. 签名保护

> [!CAUTION]
> **切勿丢失 `upload-keystore.jks` 文件及其密码。**
> 如果丢失且未开启 Google Play App Signing，你将无法发布该应用的任何更新。建议在公司级的密码管理器（如 1Password/Bitwarden）中备份。

---

## 📦 构建优化 (Optimization)

### 1. 代码混淆与资源缩减
在 `android/app/build.gradle.kts` 中已配置：

*   **`isMinifyEnabled = true`**: 启用 R8 混淆，增加反编译难度并移除死代码。
*   **`isShrinkResources = true`**: 自动移除未使用的资源文件，显著减小安装包体积。

### 2. 多架构支持
*   **AAB (Android App Bundle)**: 推荐发布方式。Google Play 会根据用户设备自动分发最优的架构包。
*   **Split APKs**: `make build-apk-split` 可手动分架构打包，减少单个用户下载的负担。

---

## ⚙️ Gradle 配置解析

`android/app/build.gradle.kts` 已升级为动态签名模式：

```kotlin
// 只有当 key.properties 文件存在时，才会尝试使用 release 签名
signingConfig = if (keystorePropertiesFile.exists()) {
    signingConfigs.getByName("release")
} else {
    signingConfigs.getByName("debug")
}
```
*   **好处**: 团队新成员下载代码后可以直接运行 `debug` 模式，而无需在本地必须拥有 `release` 密钥，开发流程不被阻断。

---

## 🔗 参考资料
- [Flutter 官方 Android 签名文档](https://docs.flutter.dev/deployment/android)
- [Google Play 签名计划 (Play App Signing)](https://support.google.com/googleplay/android-developer/answer/9842756)
