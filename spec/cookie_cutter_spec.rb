require 'spec_helper'

describe CookieCutter do
  it 'has a version number' do
    expect(CookieCutter::VERSION).not_to be nil
  end

  it 'has a logger' do
    expect(CookieCutter.logger).not_to be nil
  end
end
