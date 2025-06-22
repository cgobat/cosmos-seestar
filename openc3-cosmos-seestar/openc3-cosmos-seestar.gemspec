# encoding: ascii-8bit

# Create the overall gemspec
Gem::Specification.new do |s|
  s.name = 'openc3-cosmos-seestar'
  s.summary = 'OpenC3 COSMOS plugin for the ZWO Seestar telescope'
  s.description = <<-EOF
    Seestar (S50) plugin for deployment to OpenC3 COSMOS
  EOF
  s.license = 'MIT'
  s.authors = ['Caden Gobat']
  s.email = ['36030084+cgobat@users.noreply.github.com']
  s.homepage = 'https://github.com/cgobat/cosmos-seestar'
  s.platform = Gem::Platform::RUBY

  if ENV['VERSION']
    s.version = ENV['VERSION'].dup
  else
    time = Time.now.strftime("%Y%m%d%H%M%S")
    s.version = '0.0.0' + ".#{time}"
  end
  s.files = Dir.glob("{targets,lib,tools,microservices}/**/*") + %w(Rakefile README.md LICENSE.txt plugin.txt requirements.txt)
end
