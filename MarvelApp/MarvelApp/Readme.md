
Marvel API POC Description

Architecture:

  Used MVVM design pattern.
  
Coordinator:

  1. Parent Coordinator: Base coordinator class with Navigation Controller which is called in Scene Delegate method.
  2. Characters Coordinator: Characters Coordinator class is added as Child Coordinator class for Parent Coordinator class. It will invoke CharactersViewControllerClass.
  3. CharacterDetailCoordinator:Characters Coordinator class is added as Child Coordinator class for Parent Coordinator class. It will invoke CharactersDetailViewControllerClass.

NetworkManager:

   This class is used to call Marvel Api to get response from it.  
   formingUrlRequest method is used to form url request.
   NetworkManagerProtocol is used to get data from MarvelAPI.
   
ViewControllers

    CharactersViewController is acts as a mediator between CharactersViewModel and
    CharactersView.
    CharactersDetailViewController is acts as a mediator between CharactersDetailViewModel and 
    CharactersDetailView.
    
Model

    CharacterModel is a model class. 
    
ViewModel

    CharactersViewModel is used to get data from marvel Api, map it to model class and convey it
    to ViewControllers.
    
Helper

    ImageLoader Class is used to load the image. Used UUID to find the URLSession task and cancel the particalr task when the cells are reload.
    
Views

    Used xib files to desine custom cells and views.
    

    
