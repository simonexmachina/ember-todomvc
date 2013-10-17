`import App from 'ynab/app'`
# `import {Adapter, Serializer} from 'ynab/adapters/local-storage'`
# `import {Adapter, Serializer} from 'ynab/adapters/fixture'`
`import {Adapter, Serializer} from 'ynab/adapters/orchestrate-io'`

App.ApplicationAdapter = Adapter
App.ApplicationSerializer = Serializer

`export default App.ApplicationAdapter`
