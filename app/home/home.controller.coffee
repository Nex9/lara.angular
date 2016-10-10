class Home extends Controller

  constructor: (promiseData) ->
    @accordion = 'bio'
    for asset in promiseData
      @data = asset
      break
