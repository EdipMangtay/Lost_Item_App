# CAMPUS LOST & FOUND MANAGEMENT SYSTEM
## Presentation Speech Scripts / Sunum Konuşma Metinleri

---

## 1. AHMET - GİRİŞ VE PLANLAMA FAZI / INTRODUCTION AND PLANNING PHASE

### Türkçe / Turkish

**Konuşma Metni:**

"Sayın yöneticiler, değerli hocalarım ve arkadaşlarım. Bugün sizlere, SWE307 dersi kapsamında geliştirdiğimiz **Campus Lost & Found Management System** projemizi sunmaktan büyük mutluluk duyuyorum.

Öncelikle proje ekibimizi tanıtmak istiyorum. Projemiz 5 kişilik bir ekipten oluşuyor: Ben Ahmet, Planlama ve Proje Yönetimi sorumluluğunu üstlendim. Aleyna gereksinim analizi, Esma sistem tasarımı, Tuana geliştirme, Zehra ise test ve deployment konularında çalıştı.

**Planlama fazında** yaptığımız çalışmaları özetlemek gerekirse:

İlk olarak, projenin kapsamını belirledik. Kampüs içinde kaybolan veya bulunan eşyaların dijital ortamda yönetilmesi gerektiğini tespit ettik. Mevcut sistemlerin manuel ve verimsiz olduğunu gözlemledik. Bu nedenle, modern bir mobil uygulama geliştirmeye karar verdik.

**Proje zaman çizelgemiz** 12 haftalık bir süreç olarak planlandı. İlk 2 hafta planlama ve gereksinim analizi, sonraki 3 hafta sistem tasarımı, 5 hafta geliştirme, 1 hafta test ve son hafta deployment ve dokümantasyon için ayrıldı.

**Teknoloji seçimimizde** cross-platform bir çözüm istediğimiz için Flutter framework'ünü seçtik. Backend için Firebase'i tercih ettik çünkü hızlı geliştirme, ölçeklenebilirlik ve güvenlik sağlıyor. Ayrıca Firebase'in Authentication, Firestore ve Storage servisleri projemizin tüm ihtiyaçlarını karşılıyor.

**Risk analizi** yaptığımızda, Firebase bağlantı sorunları, fotoğraf yükleme performansı ve kullanıcı deneyimi konularında potansiyel riskler tespit ettik. Bu risklere karşı alternatif çözümler ve fallback mekanizmaları geliştirdik.

Takım görev dağılımını, her üyenin güçlü yönlerine göre yaptık. Düzenli toplantılar ve code review süreçleri ile proje ilerleyişini takip ettik.

Sonuç olarak, planlama fazında projenin temellerini sağlam bir şekilde attık ve tüm ekip üyeleri net görevlerle ilerlemeye başladık. Şimdi sözü gereksinim analizi sorumlumuz Aleyna'ya bırakıyorum."

---

### English

**Speech Script:**

"Distinguished managers, esteemed professors, and colleagues. I am delighted to present our **Campus Lost & Found Management System** project, developed as part of the SWE307 course.

First, I would like to introduce our project team. Our project consists of a 5-member team: I am Ahmet, and I took responsibility for Planning and Project Management. Aleyna worked on requirements analysis, Esma on system design, Tuana on development, and Zehra on testing and deployment.

**In the planning phase**, our work can be summarized as follows:

First, we defined the project scope. We identified the need for digital management of lost or found items on campus. We observed that existing systems were manual and inefficient. Therefore, we decided to develop a modern mobile application.

**Our project timeline** was planned as a 12-week process. The first 2 weeks were allocated for planning and requirements analysis, the next 3 weeks for system design, 5 weeks for development, 1 week for testing, and the final week for deployment and documentation.

**In our technology selection**, we chose the Flutter framework because we wanted a cross-platform solution. We preferred Firebase for the backend because it provides rapid development, scalability, and security. Additionally, Firebase's Authentication, Firestore, and Storage services meet all our project needs.

**In our risk analysis**, we identified potential risks in Firebase connection issues, photo upload performance, and user experience. We developed alternative solutions and fallback mechanisms for these risks.

We distributed team tasks based on each member's strengths. We tracked project progress through regular meetings and code review processes.

In conclusion, we laid solid foundations for the project in the planning phase, and all team members began with clear tasks. Now I hand over to our requirements analysis lead, Aleyna."

---

## 2. ALEYNA - GEREKSİNİM ANALİZİ FAZI / REQUIREMENTS ANALYSIS PHASE

### Türkçe / Turkish

**Konuşma Metni:**

"Teşekkürler Ahmet. Ben Aleyna, gereksinim analizi fazını yürüttüm. Bu fazda, sistemin ne yapması gerektiğini detaylı bir şekilde analiz ettik.

**Fonksiyonel gereksinimlerimizi** 6 ana kategori altında topladık:

**Birincisi, Kimlik Doğrulama Sistemi.** Kullanıcılar email ve şifre ile kayıt olabilmeli ve giriş yapabilmeli. Firebase Authentication kullanarak güvenli bir kimlik doğrulama mekanizması kurduk. Kullanıcılar profil bilgilerini güncelleyebilmeli ve öğrenci numarası gibi ek bilgiler ekleyebilmeli.

**İkincisi, Eşya Kayıt Sistemi.** Memur rolündeki kullanıcılar bulunan eşyaları sisteme kaydedebilmeli. Her eşya için başlık, açıklama, kategori, bulunduğu konum, bulunma tarihi ve saati bilgileri zorunlu. Ayrıca her eşya için en fazla 3 fotoğraf yüklenebilmeli. Kategoriler arasında Elektronik, Kıyafet, Kitap, Aksesuar, Anahtar, Kimlik Kartı, Çanta, Spor Ekipmanı ve Diğer seçenekleri bulunuyor. Konumlar ise Kütüphane, Kafeterya, Öğrenci Merkezi, Spor Salonu, Otopark A ve B, Fen Fakültesi, Sanat Fakültesi, Yurt A ve B, Ana Salon, Bilgisayar Laboratuvarı gibi kampüs içi lokasyonları içeriyor.

**Üçüncüsü, Arama ve Filtreleme Özellikleri.** Kullanıcılar eşyaları başlık, açıklama, kategori veya konum bilgisine göre arayabilmeli. Ayrıca kategori bazlı filtreleme yapabilmeli. Arama sonuçları gerçek zamanlı olarak güncellenmeli ve kullanıcıya anında geri bildirim sağlanmalı.

**Dördüncüsü, Talep Sistemi.** Öğrenci rolündeki kullanıcılar, bir eşyanın kendilerine ait olduğunu düşünüyorlarsa talep oluşturabilmeli. Talep oluştururken isim, öğrenci numarası ve en önemlisi doğrulama notları eklemeli. Bu notlarda seri numarası, çizik, yapışkan gibi eşyayı tanımlayıcı bilgiler bulunmalı. Memurlar bu talepleri inceleyip onaylayabilmeli veya reddedebilmeli. Talep durumları Pending, Approved ve Rejected olarak takip edilmeli.

**Beşincisi, Mesajlaşma Sistemi.** Bulan kişi ile talep eden kişi arasında gerçek zamanlı mesajlaşma olabilmeli. Her eşya için ayrı bir chat kanalı oluşturulmalı ve mesajlar Firebase Firestore'da saklanmalı.

**Altıncısı, QR Kod Sistemi.** Her eşya için benzersiz bir QR kod oluşturulmalı. Bu QR kod ile eşyaya hızlıca erişilebilmeli ve takip yapılabilmeli.

**Fonksiyonel olmayan gereksinimler** açısından ise: Performans gereksinimi olarak sayfa yüklemeleri 2 saniyenin altında olmalı. Güvenlik için Firebase Security Rules ile veri erişimi kontrol edilmeli. Kullanılabilirlik için Material Design 3 standartlarına uygun modern bir arayüz tasarlandı. Ölçeklenebilirlik için Firebase'in otomatik ölçekleme özelliklerinden yararlanıldı.

Tüm bu gereksinimler, kullanıcı hikayeleri ve use case diyagramları ile dokümante edildi. Şimdi sistem tasarımı sorumlumuz Esma'ya geçiyoruz."

---

### English

**Speech Script:**

"Thank you, Ahmet. I am Aleyna, and I led the requirements analysis phase. In this phase, we analyzed in detail what the system needs to do.

**We grouped our functional requirements** into 6 main categories:

**First, Authentication System.** Users should be able to register and log in with email and password. We established a secure authentication mechanism using Firebase Authentication. Users should be able to update their profile information and add additional information such as student numbers.

**Second, Item Registration System.** Users with the Officer role should be able to register found items in the system. For each item, title, description, category, location where it was found, date and time found are mandatory. Additionally, up to 3 photos can be uploaded for each item. Categories include Electronics, Clothing, Books, Accessories, Keys, ID Cards, Bags, Sports Equipment, and Other. Locations include campus locations such as Library, Cafeteria, Student Center, Gym, Parking Lot A and B, Science Building, Arts Building, Dormitory A and B, Main Hall, and Computer Lab.

**Third, Search and Filtering Features.** Users should be able to search items by title, description, category, or location information. They should also be able to filter by category. Search results should update in real-time and provide immediate feedback to users.

**Fourth, Claim System.** Users with the Student role should be able to create a claim if they believe an item belongs to them. When creating a claim, they must add their name, student number, and most importantly, verification notes. These notes should contain identifying information such as serial numbers, scratches, stickers, etc. Officers should be able to review and approve or reject these claims. Claim statuses should be tracked as Pending, Approved, and Rejected.

**Fifth, Messaging System.** There should be real-time messaging between the finder and the claimant. A separate chat channel should be created for each item, and messages should be stored in Firebase Firestore.

**Sixth, QR Code System.** A unique QR code should be generated for each item. This QR code should allow quick access to the item and enable tracking.

**In terms of non-functional requirements:** Performance requirement is that page loads should be under 2 seconds. For security, data access should be controlled with Firebase Security Rules. For usability, a modern interface was designed in accordance with Material Design 3 standards. For scalability, Firebase's automatic scaling features were utilized.

All these requirements were documented with user stories and use case diagrams. Now we move on to our system design lead, Esma."

---

## 3. ESMA - SİSTEM TASARIMI FAZI / SYSTEM DESIGN PHASE

### Türkçe / Turkish

**Konuşma Metni:**

"Teşekkürler Aleyna. Ben Esma, sistem tasarımı fazında mimari kararları aldık ve sistemin teknik yapısını tasarladık.

**Mimari tasarımımız** üç katmanlı bir yapı üzerine kuruldu:

**Presentation Layer**, Flutter widget'larından oluşuyor. Bu katmanda kullanıcı arayüzü, form validasyonları ve kullanıcı etkileşimleri yer alıyor. Material Design 3 standartlarına uygun modern bir UI tasarladık.

**Business Logic Layer**, Riverpod state management ile yönetiliyor. Bu katmanda iş mantığı, state yönetimi ve veri akışı kontrol ediliyor. Provider pattern kullanarak dependency injection sağladık.

**Data Layer**, Repository Pattern ile tasarlandı. Her feature için ayrı repository sınıfları oluşturduk: FoundItemsRepository, ClaimsRepository, ChatRepository, UserRepository ve ItemPhotosRepository. Bu yapı sayesinde veri kaynağından bağımsız bir mimari oluşturduk.

**Veri modelimizde** 5 ana entity var:

**FoundItem** entity'si eşya bilgilerini tutuyor: benzersiz ID, başlık, kategori, açıklama, bulunduğu konum, bulunma tarihi, durum (In Storage, Pending Claim, Delivered), fotoğraflar listesi, QR kod değeri, oluşturan memur ID'si ve teslim tarihi.

**ClaimRequest** entity'si talep bilgilerini içeriyor: talep ID'si, eşya ID'si, talep eden kullanıcı bilgileri, doğrulama notları, durum ve karar bilgileri.

**ChatMessage** entity'si mesajlaşma için: gönderen ID, mesaj metni ve zaman damgası.

**AppUser** entity'si kullanıcı bilgilerini tutuyor: kullanıcı ID'si, isim, rol (Student, Officer, Admin), öğrenci numarası ve profil fotoğrafı.

**AuditLog** entity'si ise tüm sistem işlemlerini kayıt altına alıyor: işlem türü, işlemi yapan kullanıcı, işlem zamanı ve detaylar.

**Firestore veritabanı yapımız** şu şekilde organize edildi:

Users koleksiyonu kullanıcı profillerini tutuyor. Found_items koleksiyonu bulunan eşyaları içeriyor ve her eşyanın alt koleksiyonu olarak photos koleksiyonu fotoğrafları saklıyor. Claims koleksiyonu talep kayıtlarını, chats koleksiyonu chat kanallarını ve her chat'in alt koleksiyonu olan messages koleksiyonu mesajları tutuyor.

**Rol yönetimi** için üç seviye belirledik: Student rolü eşya arama, talep etme ve mesajlaşma yetkilerine sahip. Officer rolü eşya kaydetme, düzenleme, talep onaylama/reddetme ve teslim işlemlerini yapabilir. Admin rolü tüm yetkilere sahiptir.

**Durum yönetimi** için Riverpod Provider'ları kullandık. Her repository için provider oluşturduk ve reactive programming ile gerçek zamanlı güncellemeler sağladık. Firestore Stream'leri sayesinde veritabanındaki değişiklikler anında kullanıcı arayüzüne yansıyor.

**Navigasyon** için GoRouter kullandık. Declarative routing ile route tanımlamaları yaptık ve deep linking desteği ekledik. Bu sayede kullanıcılar QR kod ile direkt eşya detay sayfasına yönlendirilebiliyor.

Tüm bu tasarım kararları, kod tekrarını önlemek, bakımı kolaylaştırmak ve ölçeklenebilirliği sağlamak için alındı. Şimdi geliştirme sorumlumuz Tuana'ya geçiyoruz."

---

### English

**Speech Script:**

"Thank you, Aleyna. I am Esma, and in the system design phase, we made architectural decisions and designed the technical structure of the system.

**Our architectural design** is built on a three-layer structure:

**Presentation Layer** consists of Flutter widgets. This layer contains the user interface, form validations, and user interactions. We designed a modern UI in accordance with Material Design 3 standards.

**Business Logic Layer** is managed with Riverpod state management. This layer controls business logic, state management, and data flow. We provided dependency injection using the Provider pattern.

**Data Layer** was designed with the Repository Pattern. We created separate repository classes for each feature: FoundItemsRepository, ClaimsRepository, ChatRepository, UserRepository, and ItemPhotosRepository. This structure enabled us to create an architecture independent of the data source.

**Our data model** has 5 main entities:

**FoundItem** entity holds item information: unique ID, title, category, description, location where it was found, date found, status (In Storage, Pending Claim, Delivered), list of photos, QR code value, ID of the officer who created it, and delivery date.

**ClaimRequest** entity contains claim information: claim ID, item ID, claimant user information, verification notes, status, and decision information.

**ChatMessage** entity is for messaging: sender ID, message text, and timestamp.

**AppUser** entity holds user information: user ID, name, role (Student, Officer, Admin), student number, and profile photo.

**AuditLog** entity records all system operations: operation type, user who performed the operation, operation time, and details.

**Our Firestore database structure** is organized as follows:

The Users collection holds user profiles. The found_items collection contains found items, and each item has a photos subcollection that stores photos. The Claims collection holds claim records, the chats collection holds chat channels, and each chat's messages subcollection holds messages.

**For role management**, we defined three levels: The Student role has permissions for searching items, making claims, and messaging. The Officer role can register items, edit them, approve/reject claims, and perform delivery operations. The Admin role has all permissions.

**For state management**, we used Riverpod Providers. We created providers for each repository and provided real-time updates with reactive programming. Thanks to Firestore Streams, changes in the database are instantly reflected in the user interface.

**For navigation**, we used GoRouter. We made route definitions with declarative routing and added deep linking support. This allows users to be redirected directly to the item detail page via QR code.

All these design decisions were made to prevent code duplication, facilitate maintenance, and ensure scalability. Now we move on to our development lead, Tuana."

---

## 4. TUANA - GELİŞTİRME FAZI / DEVELOPMENT PHASE

### Türkçe / Turkish

**Konuşma Metni:**

"Teşekkürler Esma. Ben Tuana, geliştirme fazında sistemin kodlamasını gerçekleştirdim. Bu fazda, tasarım dokümanlarını çalışan bir uygulamaya dönüştürdük.

**Teknoloji stack'imiz** şu şekilde: Flutter 3.x framework'ünü Dart 3.x programlama dili ile kullandık. Backend için Firebase ekosistemini tercih ettik: Firebase Authentication kimlik doğrulama için, Cloud Firestore veritabanı için, Firebase Storage fotoğraf depolama için kullanıldı.

State management için Flutter Riverpod 2.5.1 versiyonunu kullandık. Bu sayede reactive programming ve dependency injection sağladık. Navigasyon için GoRouter 13.2.2 versiyonu ile declarative routing implementasyonu yaptık.

Kod kalitesi için Freezed ve JSON Serializable kullanarak immutable data classes oluşturduk. Bu sayede type-safe kod yazdık ve serialization işlemlerini otomatikleştirdik.

**Proje yapımız** feature-first architecture prensibine göre organize edildi. Her feature kendi domain, data ve presentation katmanlarına sahip. Core modülü ortak utility'ler, widget'lar ve constants için kullanıldı.

**Geliştirdiğimiz temel özellikler:**

**Authentication modülünde** FirebaseAuthService sınıfı ile email/password authentication implementasyonu yaptık. Kullanıcı kayıt ve giriş işlemleri, profil güncelleme fonksiyonları geliştirildi. UserRepository ile Firestore'da kullanıcı profilleri yönetiliyor.

**Found Items modülünde** FoundItemsRepository ile CRUD işlemleri gerçekleştirildi. watchAllItems metodu ile gerçek zamanlı eşya listesi, addItem metodu ile yeni eşya ekleme, updateItemStatus metodu ile durum güncelleme, deleteItem metodu ile silme işlemleri implementasyonu yapıldı.

**Photo Management** için ItemPhotosRepository geliştirildi. Firebase Storage'a fotoğraf yükleme, silme ve listeleme fonksiyonları eklendi. Her eşya için en fazla 3 fotoğraf sınırlaması uygulandı.

**Claims System** için ClaimsRepository ile talep oluşturma, listeleme, onaylama ve reddetme işlemleri geliştirildi. Talep durumları otomatik olarak güncelleniyor ve ilgili eşyanın durumu da buna göre değişiyor.

**Chat System** için ChatRepository ile gerçek zamanlı mesajlaşma implementasyonu yapıldı. sendMessage metodu ile mesaj gönderme, watchMessages metodu ile mesajları dinleme fonksiyonları eklendi. Her eşya için ayrı chat kanalı oluşturuluyor.

**Audit Logging** sistemi ile tüm önemli işlemler kayıt altına alınıyor: eşya oluşturma, güncelleme, talep gönderme, onaylama, reddetme ve teslim işlemleri.

**UI/UX geliştirmeleri** kapsamında Material Design 3 standartlarına uygun modern bir arayüz tasarlandı. PhotoCarousel widget'ı ile fotoğraf gösterimi, SearchField widget'ı ile arama özelliği, FilterChips widget'ı ile kategori filtreleme, StatusBadge widget'ı ile durum göstergeleri geliştirildi.

**Kod kalitesi** için best practice'ler uygulandı: Repository pattern ile data abstraction, Provider pattern ile dependency injection, Error handling ve validation mekanizmaları, Code generation ile boilerplate kod azaltıldı.

**Geliştirme metriklerimiz:** Toplam kod satırı 5000'in üzerinde. 7 ana feature modülü geliştirildi: auth, found_items, claims, chat, report_found, home ve settings. Her modül kendi domain, data ve presentation katmanlarına sahip. Unit testler ve widget testleri yazıldı.

Tüm geliştirme süreci boyunca version control ile kod takibi yapıldı ve code review süreçleri uygulandı. Şimdi test ve deployment sorumlumuz Zehra'ya geçiyoruz."

---

### English

**Speech Script:**

"Thank you, Esma. I am Tuana, and in the development phase, I implemented the system's coding. In this phase, we transformed design documents into a working application.

**Our technology stack** is as follows: We used Flutter 3.x framework with Dart 3.x programming language. For the backend, we preferred the Firebase ecosystem: Firebase Authentication for authentication, Cloud Firestore for the database, and Firebase Storage for photo storage.

For state management, we used Flutter Riverpod version 2.5.1. This enabled reactive programming and dependency injection. For navigation, we implemented declarative routing with GoRouter version 13.2.2.

For code quality, we created immutable data classes using Freezed and JSON Serializable. This allowed us to write type-safe code and automate serialization operations.

**Our project structure** is organized according to the feature-first architecture principle. Each feature has its own domain, data, and presentation layers. The Core module is used for common utilities, widgets, and constants.

**Key features we developed:**

**In the Authentication module**, we implemented email/password authentication with the FirebaseAuthService class. User registration and login operations, profile update functions were developed. User profiles are managed in Firestore with UserRepository.

**In the Found Items module**, CRUD operations were implemented with FoundItemsRepository. Real-time item list with watchAllItems method, adding new items with addItem method, status updates with updateItemStatus method, and deletion with deleteItem method were implemented.

**For Photo Management**, ItemPhotosRepository was developed. Functions for uploading, deleting, and listing photos to Firebase Storage were added. A limit of maximum 3 photos per item was applied.

**For the Claims System**, claim creation, listing, approval, and rejection operations were developed with ClaimsRepository. Claim statuses are automatically updated, and the status of the related item changes accordingly.

**For the Chat System**, real-time messaging was implemented with ChatRepository. Functions for sending messages with sendMessage method and listening to messages with watchMessages method were added. A separate chat channel is created for each item.

**The Audit Logging system** records all important operations: item creation, updates, claim submission, approval, rejection, and delivery operations.

**In UI/UX developments**, a modern interface was designed in accordance with Material Design 3 standards. PhotoCarousel widget for photo display, SearchField widget for search functionality, FilterChips widget for category filtering, and StatusBadge widget for status indicators were developed.

**For code quality**, best practices were applied: data abstraction with Repository pattern, dependency injection with Provider pattern, error handling and validation mechanisms, and boilerplate code reduction with code generation.

**Our development metrics:** Total lines of code exceed 5000. 7 main feature modules were developed: auth, found_items, claims, chat, report_found, home, and settings. Each module has its own domain, data, and presentation layers. Unit tests and widget tests were written.

Throughout the entire development process, code tracking was done with version control, and code review processes were applied. Now we move on to our testing and deployment lead, Zehra."

---

## 5. ZEHRA - TEST VE DEPLOYMENT FAZI / TESTING AND DEPLOYMENT PHASE

### Türkçe / Turkish

**Konuşma Metni:**

"Teşekkürler Tuana. Ben Zehra, test ve deployment fazını yönettim. Bu fazda, geliştirilen sistemin kalitesini garanti altına almak ve production'a hazır hale getirmek için çalıştık.

**Test stratejimiz** üç seviyede gerçekleştirildi:

**Unit testler** kapsamında, repository sınıflarının testlerini yazdık. FoundItemsRepository için addItem, getItemById, searchItems ve filterByCategory metodlarının doğru çalıştığını test ettik. ClaimsRepository için claim oluşturma, durum güncelleme işlemlerini test ettik. Utility fonksiyonlar için ID generator ve validator testleri yazıldı. Test coverage'ımız %70'in üzerinde.

**Widget testleri** ile UI component'lerinin doğru render edildiğini ve kullanıcı etkileşimlerinin beklendiği gibi çalıştığını doğruladık. Form validation testleri, navigation testleri ve state management testleri gerçekleştirildi.

**Entegrasyon testleri** ile sistemin bir bütün olarak çalıştığını doğruladık. Firebase bağlantı testleri, authentication flow testleri, CRUD işlem testleri ve end-to-end senaryolar test edildi.

**Deployment planımız** dört aşamadan oluşuyor:

**Hazırlık aşamasında**, Firebase projesi kurulumu yapıldı. Firestore Security Rules yapılandırıldı - sadece authenticated kullanıcılar veri okuyup yazabiliyor, kullanıcılar sadece kendi verilerini güncelleyebiliyor. Firebase Storage Rules ayarlandı - sadece authenticated kullanıcılar fotoğraf yükleyebiliyor ve dosya boyutu limitleri konuldu. Environment variables yapılandırıldı.

**Platform deployment** için Android platformu için APK ve AAB build'leri hazırlandı. Google Play Store'a yükleme için gerekli dokümantasyon tamamlandı. iOS için gelecekte App Store deployment planlandı. Web platformu için Firebase Hosting entegrasyonu planlandı.

**CI/CD Pipeline** kurulumu için GitHub Actions ile otomatik test süreci yapılandırıldı. Her commit'te otomatik testler çalışıyor. Automated build process ile release build'leri otomatik oluşturuluyor. Staging ve production environment'ları ayrıldı.

**Monitoring ve analytics** için Firebase Analytics entegrasyonu yapıldı. Kullanıcı davranışları, feature kullanım istatistikleri takip ediliyor. Firebase Crashlytics ile hata raporlama sistemi kuruldu. Performance monitoring ile uygulama performansı izleniyor.

**Gelecek geliştirmeler** olarak şunları planladık: Push notification sistemi ile kullanıcılara anlık bildirimler gönderilecek. Email bildirimleri ile talep durumları kullanıcılara email ile iletilecek. Gelişmiş arama algoritması ile daha akıllı arama sonuçları sağlanacak. Multi-language support ile çoklu dil desteği eklenecek. Offline mode desteği ile internet bağlantısı olmadan da temel özellikler kullanılabilecek.

**Deployment checklist'imiz** şu maddeleri içeriyor: Tüm testlerin başarılı olması, Firebase güvenlik kurallarının doğrulanması, Performance testlerinin tamamlanması, Dokümantasyonun güncellenmesi, Kullanıcı kılavuzunun hazırlanması.

Sonuç olarak, sistem production'a hazır durumda ve tüm testler başarıyla tamamlandı. Şimdi demo'ya geçebiliriz."

---

### English

**Speech Script:**

"Thank you, Tuana. I am Zehra, and I managed the testing and deployment phase. In this phase, we worked to guarantee the quality of the developed system and prepare it for production.

**Our testing strategy** was implemented at three levels:

**In unit tests**, we wrote tests for repository classes. We tested that FoundItemsRepository methods addItem, getItemById, searchItems, and filterByCategory work correctly. We tested claim creation and status update operations for ClaimsRepository. Tests were written for utility functions including ID generator and validators. Our test coverage is over 70%.

**With widget tests**, we verified that UI components render correctly and user interactions work as expected. Form validation tests, navigation tests, and state management tests were performed.

**With integration tests**, we verified that the system works as a whole. Firebase connection tests, authentication flow tests, CRUD operation tests, and end-to-end scenarios were tested.

**Our deployment plan** consists of four stages:

**In the preparation stage**, Firebase project setup was completed. Firestore Security Rules were configured - only authenticated users can read and write data, users can only update their own data. Firebase Storage Rules were set - only authenticated users can upload photos, and file size limits were set. Environment variables were configured.

**For platform deployment**, APK and AAB builds were prepared for the Android platform. Documentation required for Google Play Store upload was completed. App Store deployment for iOS is planned for the future. Firebase Hosting integration is planned for the web platform.

**For CI/CD Pipeline setup**, an automated testing process was configured with GitHub Actions. Automated tests run on every commit. Release builds are automatically created with the automated build process. Staging and production environments were separated.

**For monitoring and analytics**, Firebase Analytics integration was completed. User behaviors and feature usage statistics are tracked. An error reporting system was set up with Firebase Crashlytics. Application performance is monitored with performance monitoring.

**As future developments**, we have planned the following: A push notification system will send instant notifications to users. Email notifications will inform users of claim statuses via email. An advanced search algorithm will provide smarter search results. Multi-language support will add multilingual support. Offline mode support will allow basic features to be used without an internet connection.

**Our deployment checklist** includes the following items: All tests must be successful, Firebase security rules must be verified, performance tests must be completed, documentation must be updated, and user guide must be prepared.

In conclusion, the system is ready for production, and all tests have been successfully completed. Now we can proceed to the demo."

---

## 6. DEMO VE SONUÇ / DEMO AND CONCLUSION (ENTIRE TEAM)

### Türkçe / Turkish

**AHMET:** "Teşekkürler Zehra. Şimdi uygulamamızın canlı demo'sunu göstereceğiz. Demo sırasında tüm temel özellikleri göreceksiniz."

**Demo Senaryosu:**
1. Kullanıcı kaydı ve girişi gösterimi
2. Memur rolü ile eşya kaydetme (fotoğraf, kategori, konum seçimi)
3. Arama ve filtreleme özellikleri
4. Öğrenci rolü ile talep oluşturma
5. Memur rolü ile talep onaylama
6. Chat özelliği
7. QR kod görüntüleme

**AHMET (Sonuç):** "Projemiz, Software Development Life Cycle'ın tüm fazlarını başarıyla tamamladı. Planlama, gereksinim analizi, sistem tasarımı, geliştirme, test ve deployment fazlarını profesyonel standartlarda gerçekleştirdik."

**ALEYNA:** "Gereksinimler doğrultusunda tüm özellikler implement edildi ve kullanıcı ihtiyaçları karşılandı."

**ESMA:** "Modern mimari ve best practice'ler kullanılarak ölçeklenebilir ve bakımı kolay bir sistem tasarlandı."

**TUANA:** "Production-ready kod kalitesi ile geliştirildi ve tüm teknik standartlara uyuldu."

**ZEHRA:** "Kapsamlı test coverage ve deployment planı ile sistem production'a hazır hale getirildi."

**AHMET (Kapanış):** "Teşekkür ederiz. Sorularınızı bekliyoruz."

---

### English

**AHMET:** "Thank you, Zehra. Now we will show a live demo of our application. During the demo, you will see all the key features."

**Demo Scenario:**
1. User registration and login demonstration
2. Item registration with Officer role (photo, category, location selection)
3. Search and filtering features
4. Claim creation with Student role
5. Claim approval with Officer role
6. Chat feature
7. QR code display

**AHMET (Conclusion):** "Our project successfully completed all phases of the Software Development Life Cycle. We executed planning, requirements analysis, system design, development, testing, and deployment phases to professional standards."

**ALEYNA:** "All features were implemented in accordance with requirements, and user needs were met."

**ESMA:** "A scalable and maintainable system was designed using modern architecture and best practices."

**TUANA:** "It was developed with production-ready code quality and all technical standards were adhered to."

**ZEHRA:** "The system was prepared for production with comprehensive test coverage and a deployment plan."

**AHMET (Closing):** "Thank you. We look forward to your questions."

---

## NOTLAR / NOTES

- Her konuşma metni yaklaşık 2-3 dakika sürecek şekilde hazırlandı.
- Sunum sırasında doğal bir dil kullanılması ve slaytlarla desteklenmesi önerilir.
- Her kişi kendi bölümünü sunarken slaytları kullanarak görsel destek sağlamalıdır.

---

- Each speech script is prepared to last approximately 2-3 minutes.
- It is recommended to use natural language during the presentation and support it with slides.
- Each person should provide visual support using slides while presenting their section.
