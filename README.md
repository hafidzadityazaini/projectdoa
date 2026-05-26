📖 Muslim App — Aplikasi Muslim Flutter

Muslim App adalah aplikasi muslim modern berbasis Flutter yang menyediakan berbagai fitur islami seperti jadwal shalat, dzikir harian, artikel islami, kompas kiblat, murottal Al-Qur’an, kalender hijriyah, dan pengingat waktu shalat.

✨ Fitur Utama
🕌 Jadwal Shalat Otomatis
Menggunakan lokasi pengguna
Menampilkan:
Subuh
Terbit
Dzuhur
Ashar
Maghrib
Isya
Countdown menuju waktu shalat berikutnya
Pencarian kota & daerah terpencil
📿 Dzikir Harian
Dzikir pagi
Dzikir petang
Doa sehari-hari
Arab
Latin
Arti
🧭 Kompas Kiblat
Penunjuk arah kiblat realtime
Menggunakan sensor compass device
🎧 Murottal Al-Qur'an
Audio murottal
Play / Pause
UI modern
❤️ Tasbih Digital
Counter dzikir
Reset counter
Tampilan modern
📰 Artikel Islami
Artikel islami modern
Detail artikel
Gambar & deskripsi
📅 Kalender Hijriyah
Menampilkan tanggal hijriyah realtime
🖼️ UI Modern
Design ala aplikasi muslim modern
Gradient card
Rounded UI
Bottom navigation modern
Responsive layout
📦 Dependencies
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  sqflite: ^2.3.0
  path: ^1.9.0
  intl: ^0.19.0
  http: ^1.2.1
  geolocator: ^13.0.4
  flutter_qiblah: ^3.0.4
  geocoding: ^3.0.0
  flutter_compass: ^0.8.0
  just_audio: ^0.9.36
  flutter_local_notifications: ^17.1.2
  hijri: ^3.0.0
  audioplayers: ^6.0.0
  flutter_typeahead: ^5.2.0
📂 Struktur Folder
lib/
│
├── components/
├── data/
├── models/
├── pages/
├── service/
├── widgets/
│
├── main.dart
🚀 Cara Menjalankan
1. Clone Repository
git clone https://github.com/username/muslim-app.git
2. Masuk Folder Project
cd muslim-app
3. Install Dependencies
flutter pub get
4. Jalankan Aplikasi
flutter run
🗂️ Assets

Pastikan assets sudah ditambahkan di pubspec.yaml

flutter:

  uses-material-design: true

  assets:
    - assets/logo.png
    - assets/poster.png
    - assets/maghrib.jpeg
    - assets/dzikir.jpeg
    - assets/compass.jpg
    - assets/worldcities.json
📍 Permission Android

Tambahkan permission lokasi di:

android/app/src/main/AndroidManifest.xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
🛠️ Teknologi
Flutter
Dart
REST API
Geolocator
Audio Player
Qibla Compass
Local Notification
📱 Screenshot Fitur
Home Modern UI
Jadwal Shalat
Artikel Islami
Tasbih Digital
Kompas Kiblat
Murottal Quran
👨‍💻 Developer

Muhammad Hafidz Aditya Zaini

📄 License

This project is licensed under the MIT License.




<img width="203" height="349" alt="Screenshot 2026-05-26 100934" src="https://github.com/user-attachments/assets/87badfb0-942f-45fe-94d3-8a13feed4cb2" />
<img width="202" height="348" alt="Screenshot 2026-05-26 100907" src="https://github.com/user-attachments/assets/2a55fae3-ec50-4f39-bbb8-fad9ad202eaf" />
<img width="206" height="347" alt="Screenshot 2026-05-26 101150" src="https://github.com/user-attachments/assets/eb5917c4-f8a0-43ae-aa51-fdbdf18af417" />
<img width="209" height="353" alt="Screenshot 2026-05-26 101123" src="https://github.com/user-attachments/assets/4cedca32-9d40-4ce5-b486-5b45e301c63e" />
<img width="209" height="349" alt="Screenshot 2026-05-26 101039" src="https://github.com/user-attachments/assets/d61f7b22-843f-41f4-957f-f0388f0fc263" />
<img width="194" height="348" alt="Screenshot 2026-05-26 100958" src="https://github.com/user-attachments/assets/5822e87f-9a8a-49f5-9ae9-08b9bd79f8cd" />
