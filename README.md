# stat19_app_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [first install Flutter sdk, place the folder somewhere safe, 
   and add your path to the the subfolder /bin to env $PATH](https://flutter.dev/docs/get-started/install/),
   regarder la section concernant "Get the Flutter SDK" et "Android studio", for WINDOWS users, 
   "Get the Flutter SDK"  and "xcode" for mac user for MAC users (for MAC, i recommendend to run
   on VScode and execute on xcode simulator).
- To install dart require [Chocolatey for WINDOWS users using Powershell ](https://chocolatey.org/install),
   require [Homebrew for MAC users](https://docs.brew.sh/FAQ).
- [Then install dart](https://dart.dev/get-dart), place the folder somewhere safe, 
    and add the path of your subfolder /bin to env $PATH.
- install flutter and dart plugins in your IDE.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to start
- Presentation: Configuration pré-existantantes.
    * lib/: dossier pour developper en flutter et dart.
    * lib/main.dart est le fichier ou s'exécute le programme.
    * android/ et ios/ est le code généré pour android et ios.
    * _pubspec.yaml_: est le fichier ou mettre les dépendances et d'autres propriétés d'un projet flutter.
    
- Presentation: Configuration rajouté.
    * [Images](/images): rajouter une image de preference "jpg", "svg" ou "ico", ensuite rajouter l'image
    dans _pubspec.yaml_ pour la propriété le chemin vers image (ex:"images/image.jpg");
    * [Ressources theme(style, couleur, animation) et contantes](/lib/ressource): pour mettre les valeurs constantes re-utilisable ou long; _.../themes.dart_ pour 
     le style et _.../value.dart_ pour valeur en dur.
    * [Mini ou bloc de Composants intégrable](/lib/components)
    * [Model d'objet pour manipuler des données](/lib/models)
    * [Services lier l'api ou autres](/lib/services)
    * [Les écran principaux et vus](/lib/views)
    
- Check if everything is well install to developp a flutter project with 
> flutter doctor
- To run, go to the terminal of your project and do 
> flutter run 

## How to Install new dependencies in your project??
[Dependancies are locate here =>](https://pub.dev):
1- Edit in _lib/pubspec.yaml_ :
    dependecies:
        - dependencyName: <version>
        
2- In the commend line, under your projet path:
>flutter pub get
    or
>pub get 

## Connect to api locally
///To connect you Backend on LOCAL, put the IPv4 Adress of your pc in the variable here [PC_HOST](/lib/services/api-services.dart)
///And de-comment "static const [FINAL_API_START_ENDPOINT] = LOCAL_API_START_ENDPOINT"
