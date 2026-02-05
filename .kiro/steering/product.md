# Product Overview

## E-Lunchbox (饭盒售货机应用)

A production-grade Flutter mobile application for automated lunchbox vending machines. The app provides a convenient lunch purchasing experience with multi-payment support, device management, and location services.

## Core Features

- **Device Management**: Monitor device status, view device information, and report device issues
- **Product Browsing & Purchase**: Browse products by category, view details, manage shopping cart, create and submit orders
- **Payment System**: WeChat Pay and Alipay support with payment status management and transaction history
- **Location Services**: Real-time device location reporting and location-based services
- **User Center**: Order history, profile management, and help center

## Data Hierarchy

The application follows a three-tier data structure:

1. **City (城市)**: Geographic region containing multiple devices
2. **Device (设备)**: Physical vending machine located in a specific city, containing multiple products
3. **Product (产品)**: Purchasable items available in specific devices

## Key Characteristics

- High reliability for stable operation in various environments
- Quality user experience with intuitive interface and smooth workflows
- Multi-platform support (Android and iOS)
- Dual payment channels (WeChat and Alipay)
- Real-time location reporting
- Remote device management capabilities
