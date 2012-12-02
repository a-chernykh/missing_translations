module MissingTranslations
  class Railtie < ::Rails::Railtie
    rake_tasks do
      require "tasks/missing_translations"
    end
  end
end
