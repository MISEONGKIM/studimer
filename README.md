# studimer

hc를 위한 프로젝트

## folder structure

(출처 : https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)

- lib
  - src
    - config
    - core
    - data
      - datasources
        - local : sqlite, hive...
        - remote : REST API
      - models
      - repositories
    - domain
      - entities
      - repositories
      - usecases
    - presentation
      - blocs
      - views
      - widgets
