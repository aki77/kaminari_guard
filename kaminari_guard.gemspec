# frozen_string_literal: true

require_relative "lib/kaminari_guard/version"

Gem::Specification.new do |spec|
  spec.name = "kaminari_guard"
  spec.version = KaminariGuard::VERSION
  spec.authors = ["aki77"]
  spec.email = ["aki77@users.noreply.github.com"]

  spec.summary = "A gem to detect missing paginate method calls in Kaminari."
  spec.description = "KaminariGuard is a gem that helps you detect missing paginate method calls in Kaminari, ensuring that your pagination works correctly." # rubocop:disable Layout/LineLength
  spec.homepage = "https://github.com/aki77/kaminari_guard"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/aki77/kaminari_guard/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "kaminari"
  spec.add_dependency "rails", ">= 7.1.4"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
