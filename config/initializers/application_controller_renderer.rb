# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

# RuntimeError in PostImages#indexが表示されたときの対処方法
# エラー表示画面のRefile.secret_key部分をコピーし、config/initializers/application_controller_renderer.rbファイルに貼り付ける。

Refile.secret_key = '9bd5bd08db30d5b38f1b7902466b1b57db05d106e22412cbff54c7c35fcfef3c2687ad664d2f2da85fc724fbf9e097542481a775ab970a98412c457ab501104b'