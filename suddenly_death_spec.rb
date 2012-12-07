# -*- coding: utf-8 -*-
require 'rspec'
require './suddenly_death_module.rb'

class WrapTest
  include SuddenlyDeath
end

describe SuddenlyDeath do
  subject { WrapTest.new }
  context '#to_hex' do
    it { subject.to_oct("a").should eq 'a'.bytes.first }
    it { subject.to_oct("ｱ").should eq 0xefbdb1 }
  end
  context '#byte_size' do 
    it { subject.byte_size('SUD+').should eq 4 }
    it { subject.byte_size('突然ﾉ死').should eq 7 }
  end
  context '#wrap' do
    it { subject.wrap('突然ﾉ死').should eq "＿人人人人人＿\n＞　突然ﾉ死　＜\n￣^Y^Y^Y^￣" }
  end
end
