# 🌤️ MeteoDirect

MeteoDirect est une application mobile de prévision météorologique développée avec **Flutter** et **Dart**.

Elle permet de rechercher une ville et de consulter ses informations météorologiques en temps réel grâce à une API météo. L’application propose une interface moderne, des animations et une présentation claire des données.

## 📱 Aperçu

MeteoDirect permet notamment de consulter :

* 🌡️ La température actuelle
* 🌤️ La description du temps
* 🌡️ La température ressentie
* 💧 Le taux d’humidité
* 📊 La pression atmosphérique
* 💨 La vitesse et la direction du vent
* 👁️ La visibilité
* 🌅 L’heure du lever du soleil
* 🌇 L’heure du coucher du soleil
* 🔎 La recherche d’une ville
* 🕘 L’historique des villes recherchées

## ✨ Fonctionnalités

* Recherche météorologique par nom de ville
* Récupération des données depuis une API météo
* Affichage des icônes selon les conditions météorologiques
* Gestion des états de l’application :

  * État initial
  * Chargement
  * Succès
  * Erreur
* Affichage des informations météo sous forme de cartes
* Historique des recherches
* Interface responsive et adaptée aux appareils mobiles
* Animations et transitions visuelles
* Gestion des dates et heures en français
* Gestion des erreurs réseau et des réponses HTTP

## 🛠️ Technologies utilisées

| Technologie     | Utilisation                           |
| --------------- | ------------------------------------- |
| Flutter         | Développement de l’application mobile |
| Dart            | Langage de programmation              |
| Provider        | Gestion de l’état                     |
| HTTP            | Communication avec l’API météo        |
| Intl            | Formatage des dates et heures         |
| Flutter Animate | Animations de l’interface             |
| Material Design | Composants et icônes de l’interface   |

## 📂 Architecture du projet

```text
MeteoDirect/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── lib/
│   ├── controllers/
│   │   └── Gestion de l’état et de la logique de l’application
│   │
│   ├── models/
│   │   └── Modèles représentant les données météorologiques
│   │
│   ├── services/
│   │   └── Communication avec l’API météo
│   │
│   ├── utils/
│   │   └── Fonctions utilitaires et gestion des icônes
│   │
│   ├── views/
│   │   └── Écrans principaux de l’application
│   │
│   ├── widgets/
│   │   └── Composants réutilisables de l’interface
│   │
│   └── main.dart
│
├── test/
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

## ⚙️ Installation

### 1. Cloner le dépôt

```bash
git clone https://github.com/Epiphane-code/MeteoDirect.git
```

### 2. Accéder au dossier du projet

```bash
cd MeteoDirect
```

### 3. Installer les dépendances

```bash
flutter pub get
```

### 4. Vérifier la configuration Flutter

```bash
flutter doctor
```

### 5. Lancer l’application

```bash
flutter run
```

Vous pouvez également lancer l’application sur un appareil Android connecté ou sur un émulateur.

## 🔑 Configuration de la clé API

L’application utilise une API météorologique pour récupérer les données des villes.

Avant de lancer le projet, configurez votre clé API dans le service météo prévu à cet effet.

Exemple :

```dart
class MeteoService {
  final String apiKey = 'VOTRE_CLE_API';
}
```

> ⚠️ Ne publiez jamais votre véritable clé API dans un dépôt public. Pour un projet en production, utilisez plutôt une variable d’environnement ou un système sécurisé de gestion des secrets.

## 🔄 Fonctionnement de l’application

Le fonctionnement général de MeteoDirect est le suivant :

```text
L’utilisateur saisit une ville
            ↓
Le contrôleur reçoit la recherche
            ↓
Le service envoie une requête HTTP
            ↓
L’API retourne les données météo
            ↓
Les données JSON sont converties en modèle Dart
            ↓
Le contrôleur met à jour l’état
            ↓
L’interface affiche les informations météo
```

## 🧩 Gestion des états

L’application utilise plusieurs états pour améliorer l’expérience utilisateur :

```text
État initial
    ↓
Recherche d’une ville
    ↓
Chargement
    ↓
Succès ───────→ Affichage des données météo
    │
    └──────────→ Erreur ─────→ Message d’erreur
```

Les états permettent d’afficher un indicateur de chargement, les données météorologiques ou un message explicatif en cas de problème.

## 🌍 Données météorologiques

Les informations affichées sont récupérées depuis la réponse JSON de l’API, puis transformées en objet `Meteodata`.

Les principales données exploitées sont :

```dart
final String cityName;
final String country;
final double temperature;
final double feelsLike;
final double tempMin;
final double tempMax;
final int humidity;
final int pressure;
final double windSpeed;
final int windDegree;
final String description;
final String iconCode;
final int visibility;
final DateTime sunrise;
final DateTime sunset;
```

## 📦 Dépendances principales

Les dépendances utilisées dans le projet sont notamment :

```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.8
  http: ^1.6.0
  provider: ^6.1.5+1
  intl: ^0.20.3
  flutter_animate: ^4.5.2
```

## 🧪 Tests

Pour exécuter les tests Flutter :

```bash
flutter test
```

Pour analyser le code :

```bash
flutter analyze
```

## 🚀 Générer une version Android

Pour générer un fichier APK :

```bash
flutter build apk
```

Le fichier généré sera disponible dans :

```text
build/app/outputs/flutter-apk/app-release.apk
```

Pour générer une version optimisée :

```bash
flutter build apk --release
```

## 🔒 Bonnes pratiques

* Ne pas publier les clés API dans GitHub
* Vérifier les erreurs réseau
* Utiliser des modèles Dart pour structurer les données
* Séparer la logique métier de l’interface
* Réutiliser les widgets
* Éviter les appels API directement dans `build()`
* Utiliser `dispose()` pour libérer les contrôleurs
* Tester l’application sur plusieurs tailles d’écran

## 👨‍💻 Auteur

**Omar Epiphane Nicoué**

Développeur full-stack et mobile en formation.

* GitHub : [Epiphane-code](https://github.com/Epiphane-code)

## 📄 Licence

Ce projet est un projet d’apprentissage et de démonstration. Vous pouvez l’utiliser, l’améliorer et le modifier selon vos besoins.

---

⭐ Si ce projet vous est utile, vous pouvez lui attribuer une étoile sur GitHub.

**MeteoDirect — Consultez la météo, simplement et rapidement.** 🌤️
