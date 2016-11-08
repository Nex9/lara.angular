angular.module('app', [
  'angulartics'
  'angulartics.google.analytics'
  'angulartics.facebook.pixel'
  'ngAnimate'
  'ngTouch'
  'ui.router'
  'templatesApp'
  'angular-inview'
  'imago'
  'lodash'
  'ngSanitize'
  'monospaced.elastic'
  'duScroll'
  'ngtweet'
  'headroom'
  'com.2fdevs.videogular'
  'com.2fdevs.videogular.plugins.controls'
  'com.2fdevs.videogular.plugins.overlayplay'
  'com.2fdevs.videogular.plugins.poster'
]).value('duScrollOffset', 70)

class Setup extends Config

  constructor: ($httpProvider, $provide, $sceProvider, $locationProvider, $compileProvider, $stateProvider, $urlRouterProvider, $analyticsProvider, imagoModelProvider) ->

    $sceProvider.enabled false
    $httpProvider.useApplyAsync true

    $provide.decorator '$exceptionHandler', [
      '$delegate'
      '$window'
      ($delegate, $window) ->
        (exception, cause) ->
          if $window.trackJs
            $window.trackJs.track exception
          $delegate exception, cause
    ]

    if document.location.hostname is 'localhost'
      $analyticsProvider.developerMode true
    else
      $compileProvider.debugInfoEnabled false

    $analyticsProvider.firstPageview true
    $locationProvider.html5Mode true
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: '/app/home/home.html'
        controller: 'home as page'
        resolve:
          promiseData: (imagoModel) ->
            imagoModel.getData
              path: '/home'
              recursive: true



class Load extends Run

  constructor: ($rootScope, $state, $location, $timeout, tenantSettings, imagoUtils) ->
    document.documentElement.classList.remove('nojs')
    $timeout ->
      $rootScope.js = true
      $rootScope.mobile = imagoUtils.isMobile()
      $rootScope.mobileClass = if $rootScope.mobile then 'mobile' else 'desktop'
      FastClick.attach(document.body)

    $rootScope.toggleMenu = (status) ->
      if _.isUndefined status
        $rootScope.navActive = !$rootScope.navActive
      else
        $rootScope.navActive =  status

    # general code
    $rootScope.$on '$stateChangeSuccess', (evt) ->
      $rootScope.urlPath = $location.path()
      state = $state.current.name.split('.').join(' ')
      path  = $rootScope.urlPath.split('/').join(' ')
      path = 'home' if path is ' '
      $rootScope.state = state
      $rootScope.path  = path
      $rootScope.toggleMenu(false)

