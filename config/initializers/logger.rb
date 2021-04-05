logger = Ougai::Logger.new(
  Application.root.concat('/', Settings.logger.path),
  level: Settings.logger.level
)

logger.formatter = Ougai::Formatters::Readable.new if Application.environment == :development

logger.before_log = lambda do |data|
  data[:service] = {name: Settings.app.name}
  data[:request_id] = Thread.current[:request_id]
end

Application.logger = logger