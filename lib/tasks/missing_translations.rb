require 'rake_task'

desc 'Shows I18n translation keys which are missing (according to view parsing)'
task :missing_translations do
  rake_task = MissingTranslations::RakeTask.new
  missing_keys = rake_task.missing_keys

  if missing_keys.any?
    puts 'Missing translations'
    puts missing_keys
  else
    puts 'You have no missing translations'
  end
end
