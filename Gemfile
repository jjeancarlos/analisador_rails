source "https://rubygems.org"

# Gem principal do Rails
gem "rails", "~> 8.0.3"

# Para requisitar APIs REST (VirusTotal)
gem "httparty"

# Propshaft: Asset pipeline moderno
gem "propshaft"

# Banco de dados PostgreSQL
gem "pg", "~> 1.1"

# Servidor Web
gem "puma", ">= 5.0"

# JavaScript e Frontend
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

# Utilitários de fuso horário (necessário para Windows)
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Backends de banco de dados para Cache, Jobs e Cable (Padrão Rails 8)
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Otimização de boot
gem "bootsnap", require: false

# Deploy com Docker
gem "kamal", require: false

# Aceleração de assets para o Puma
gem "thruster", require: false

# --- GRUPO DE DESENVOLVIMENTO E TESTE ---
group :development, :test do
  # Debugger
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  
  # Análise de segurança
  gem "brakeman", require: false
  
  # Linter de estilo (Rubocop)
  gem "rubocop-rails-omakase", require: false

  # IMPORTANTE: Carrega as variáveis do arquivo .env
  gem "dotenv-rails", "~> 3.2"
  
  # IMPORTANTE: Corrige o erro do VS Code e melhora a inteligência do editor
  gem "ruby-lsp", require: false
end

# --- APENAS DESENVOLVIMENTO ---
group :development do
  gem "web-console"
end

# --- APENAS TESTES ---
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end