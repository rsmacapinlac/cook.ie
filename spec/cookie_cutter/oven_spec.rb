require 'spec_helper'

describe CookieCutter::Oven do
  let(:_config_file) { File.expand_path File.join('spec', 'example_template_dir', 'config.yml') }

  describe '#init' do
    it 'should not init without any parameters' do
      expect { CookieCutter::Oven.new() }.to raise_error(ArgumentError)
    end
    it 'should load the correct output directory' do
      c = CookieCutter::Oven.new('test-output', 'test1', _config_file)
      puts c.output_dir
    end
  end

  describe '#class_methods' do
    describe '.get_output_dir' do
      it 'should load the correct path' do
        tmp_dir = '.'
        expect(CookieCutter::Oven.get_output_dir(tmp_dir)).to eql(File.expand_path tmp_dir)
      end
    end

    describe '.load_config_file' do
      it 'should know how to load a config_path from a folder' do
        config_dir = File.expand_path File.join('spec', 'example_template_dir')
        expected_yml = YAML::load_file File.expand_path File.join('spec', 'example_template_dir', 'config.yml')
        expect(CookieCutter::Oven.load_config_file(config_dir)).to eql(expected_yml)
      end
      it 'should know how to load a config_path from a file' do
        config_file = File.expand_path File.join('spec', 'example_template_dir', 'config.yml')
        expected_yml = YAML::load_file File.expand_path File.join('spec', 'example_template_dir', 'config.yml')
        expect(CookieCutter::Oven.load_config_file(config_file)).to eql(expected_yml)
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
