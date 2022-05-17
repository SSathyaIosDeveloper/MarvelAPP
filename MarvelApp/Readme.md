<h1 align="center">Marvel API POC Description</h1>
<h3 align="center">An iOS application to display list of Marvel characters and its descriptions.</h3>
<p>
This  repository includes an iOS application to display the list of Marvel charcaters and character in detail.

**Characters Screen** Displays list of characters with their thumbnails and names.

**Character Detail Info Screen** Displays picture of a character, name, and it's full description.

**Architecture**

     This application has been developed using a MVVM architectural pattern. 
     
**Coordinator**

  Parent Coordinator: Base coordinator class with Navigation Controller which is called in Scene Delegate method.
  
  Characters Coordinator: Characters Coordinator class is added as Child Coordinator class for Parent Coordinator class. 
  It will invoke CharactersViewControllerClass.
  
  CharacterDetailCoordinator:Characters Coordinator class is added as Child Coordinator class for Parent Coordinator class. 
  It will invoke CharactersDetailViewControllerClass.

**NetworkManager**

   This class is used to call Marvel Api to get response from it.  
   formingUrlRequest method is used to form url request.
   NetworkManagerProtocol is used to get data from MarvelAPI.
   
**ViewControllers**

    CharactersViewController is acts as a mediator between CharactersViewModel and
    CharactersView.
    CharactersDetailViewController is acts as a mediator between CharactersDetailViewModel and 
    CharactersDetailView.
    
**Model**

    Character is a model class. 
    
**ViewModel**

    CharactersViewModel is used to get data from marvel Api, map it to model class and convey it
    to ViewControllers.
    
**Helper**

    ImageLoader Class is used to load the image. Used UUID to find the URLSession task and cancel 
    the particalr task when the cells are reused.
    
**Views**

    Used xib files to desine custom cells and views.

**MarvelAppTests**

    This folder is used to write unit test cases. Its Code coverage is 57.3% 
    
**Config** 

    This file is used to add API keys. Using Info plist, we can access this values. 
    This file is added in .gitignore to ignore in git repository.
</p>





  
