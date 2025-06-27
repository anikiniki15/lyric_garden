Rails.application.routes.draw do
  devise_for :users

  # :index を追加！
  resources :lyrics, only: [ :index, :new, :create, :show ]

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA関連
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # トップページは歌詞一覧
  root "lyrics#index"
end
