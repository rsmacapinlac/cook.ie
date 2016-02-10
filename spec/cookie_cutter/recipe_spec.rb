require 'spec_helper'

describe CookieCutter::Recipe do
  let(:example_template_dir) { File.expand_path(File.join('spec', 'test_config')) }
  let(:expected_yml) { YAML::load_file File.join(example_template_dir, CookieCutter::Recipe::DEFAULT_CONFIG_FILENAME) }

  describe '#initialize' do
    it 'should have at least one attribute' do
      expect{ CookieCutter::Recipe.new() }.to raise_error(ArgumentError)
    end
    it 'should initialize the correct config file' do
      c = CookieCutter::Recipe.new(example_template_dir)
      expected_yml = YAML::load_file File.join(example_template_dir, CookieCutter::Recipe::DEFAULT_CONFIG_FILENAME)
      expect(c.config).to eql(expected_yml)
    end
  end

  describe '#class_methods' do
    describe '.load_config_file' do
      it 'should know how to load a config_path from a folder' do
        config_dir = File.expand_path File.join('spec', 'test_config')
        expect(CookieCutter::Oven.load_config_file(config_dir)).to eql(expected_yml)
      end
      it 'should know how to load a config_path from a file' do
        config_file = File.expand_path File.join('spec', 'test_config', 'my-own-config.yml')

        _expected_yml = YAML::load_file File.join(example_template_dir, 'my-own-config.yml')
        expect(CookieCutter::Oven.load_config_file(config_file)).to eql(_expected_yml)
      end
    end

    describe '.config_is_dir' do
      it 'should know if config_path is a folder' do
        path = '~'
        expect(CookieCutter::Oven.config_is_dir(path)).to be true
      end
    end
  end
end
