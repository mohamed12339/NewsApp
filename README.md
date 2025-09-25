# NewsApp

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![News API](https://img.shields.io/badge/News_API-000000?style=for-the-badge&logo=newsapi&logoColor=white)

A modern, responsive news browsing app built with Flutter and the News API (https://newsapi.org/), delivering Arabic and English news with Clean Architecture, Hive, Provider, Cubit, and MVVM.

<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 49_d1541ee7" src="https://github.com/user-attachments/assets/c7ac00dd-2367-49f3-beef-9a6e5251f439" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 49_c8f81099" src="https://github.com/user-attachments/assets/0bd3179c-f949-4649-9fe9-d7ed8ec1013c" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 49_07b9dd77" src="https://github.com/user-attachments/assets/122aa38e-4c7a-48f3-bf6f-55b7c696c00b" />


## 📸 Screenshots
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 50_429ef1b8" src="https://github.com/user-attachments/assets/6b4d80fa-25b0-489b-bf53-d96afd342406" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 49_3103d6f2" src="https://github.com/user-attachments/assets/92149272-5f87-4222-a0ee-19a5c52312ec" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 48_f6e17068" src="https://github.com/user-attachments/assets/43224b60-631b-4b04-86e7-710c76bad2db" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 48_ce980bef" src="https://github.com/user-attachments/assets/8bf724c0-5953-4e9c-880e-edc8c2b50e48" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 48_b89a9d81" src="https://github.com/user-attachments/assets/90d62e1f-10e5-4b47-9d79-ef87c9b621ef" />
<img width="400" height="500" alt="WhatsApp Image 2025-09-25 at 03 55 48_0592a7a7" src="https://github.com/user-attachments/assets/06a499ae-a635-4360-8771-b07efaa1e915" />


## 🚀 Features
❤ Save news articles locally using Hive for quick access and history  
🔥 Explore the latest Arabic and English news from worldwide sources  
⚡ Real-time search with debounce effect  
📦 Clean Architecture + Repository Pattern  
🎯 Advanced State Management using Provider and Cubit  
🌐 API Integration using Dio for News API (https://newsapi.org/)  
📶 Handles internet issues gracefully with Dio exceptions  
🧪 Full error handling for server & client-side issues  
🔁 Async API calls using Future.wait for optimized loading  
📱 Responsive design with a clean, modern UI  
🎨 MVVM architecture for scalable and maintainable code  

Additional modules:  
- Home for browsing and discovery  
- News Details for in-depth info  
- Network layer handling API interactions  
- Local Storage with Hive for offline access  

## 🧰 Prerequisites
- Flutter SDK installed  
- News API Key: Register at https://newsapi.org/ to get your API key (free for development, no credit card required)  

## 🛠 Getting Started
To run the app locally:

```bash
git clone https://github.com/mohamed12339/NewsApp
cd NewsApp
flutter pub get
```

For iOS:
```bash
cd ios
pod install
```

That’s it!  
Feel free to run this code, edit it, and use any part of it in your own projects.  
And don’t forget to ⭐ star the repo if you liked it!

## 🔌 API Usage
The app uses the News API (https://newsapi.org/) to fetch news articles.  
- **Endpoint**: `https://newsapi.org/v2/everything` or `https://newsapi.org/v2/top-headlines`  
- **Sample Query**: `q=technology&language=en` or `q=أخبار&language=ar`  
- **Parameters**:  
  - `q`: Keywords (e.g., "technology" or "أخبار")  
  - `from`: Date (e.g., `2025-09-01`)  
  - `language`: `en` or `ar`  
  - `apiKey`: Your News API key  

## 🤝 Contributing
All contributions are welcome!  
If you spot an issue or have an idea for a new feature:  
- Fork the repo  
- Create a new branch  
- Commit clean and well-tested code  
- Open a Pull Request 🚀  


## 🙏 Acknowledgments
Thanks to News API (https://newsapi.org/) for providing a rich and powerful API that powers this app.  
And big thanks to the open-source community 💙.

## 📬 Contact
Built by Mohamed Magdy  
📧 Email: mhoda7891@gmail.com  
📱 Phone: +20 111 164 1701  
🔗 GitHub: https://github.com/mohamed12339
