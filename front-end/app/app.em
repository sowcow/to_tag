`import Resolver from 'resolver';`


class App extends Ember.Application
  LOG_ACTIVE_GENERATION: true
  LOG_MODULE_RESOLVER: true
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true

  modulePrefix: 'appkit' # TODO: loaded via config
  Resolver: Resolver['default']


`export default App;`
