module Authlogic
  module CryptoProviders
    autoload :MD5,    "authlogic/crypto_providers/md5"
    autoload :Sha1,   "authlogic/crypto_providers/sha1"
    autoload :Sha256, "authlogic/crypto_providers/sha256"
    autoload :Sha512, "authlogic/crypto_providers/sha512"
    autoload :BCrypt, "authlogic/crypto_providers/bcrypt"
    autoload :AES256, "authlogic/crypto_providers/aes256"
    autoload :SCrypt, "authlogic/crypto_providers/scrypt"

    def self.crypto_provider_from(value)
      value.is_a?(String) ? value.constantize : value
    end

    def self.crypto_providers_from(value)
      return value.map { |provider| CryptoProviders.crypto_provider_from(provider) } if value.is_a?(Array)
      CryptoProviders.crypto_provider_from(value)
    end
  end
end
