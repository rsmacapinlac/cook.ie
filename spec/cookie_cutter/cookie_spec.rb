require 'spec_helper'

describe CookieCutter::Cookie do
  let(:test_config_dir) { File.expand_path(File.join('spec', 'test_config')) }
  let(:expected_yml) { YAML::load_file File.join(test_config_dir, CookieCutter::Recipe::DEFAULT_CONFIG_FILENAME) }
  let(:template_config) {
      expected_yml['test-output'][CookieCutter::Recipe::CONFIG_PATH] = test_config_dir
      expected_yml['test-output']
  }

  it 'should blah' do
    c = CookieCutter::Cookie.new('test', template_config)
    puts c.where_to_save
    puts template_config
  end

  it 'should know where the template is' do
    path = File.expand_path File.join(test_config_dir, template_config[CookieCutter::Cookie::TEMPLATE_NAME])
    c = CookieCutter::Cookie.new('test-output', template_config)
    expect(c.template_path).to eql(path)
  end

  it 'should know where to save itself' do
    output_dir = template_config[CookieCutter::Cookie::OUTPUT_DIR]
    c = CookieCutter::Cookie.new('test-output', template_config)
    expect(c.where_to_save).to eql(File.expand_path(output_dir, Dir.pwd))
  end
end
