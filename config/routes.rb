Rails.application.routes.draw do
  devise_for :users

  resources :lyrics, only: [:index, :show, :new, :create, :edit, :update]

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA関連
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # トップページは歌詞一覧
  root "lyrics#index"
end
