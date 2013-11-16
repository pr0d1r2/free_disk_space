require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe FreeDiskSpace do

  let(:dir) { '/' }
  let(:the_object) { FreeDiskSpace.new(dir) }
  let(:blocks_available) { 3000 }
  let(:filesystem_stat) do
    double('filesystem_stat', :block_size => 1024, :blocks_available => blocks_available)
  end
  subject { the_object }

  its(:dir) { should == dir }

  describe 'class method' do
    before do
      the_object.stub(:filesystem_stat => filesystem_stat)
      described_class.should_receive(:new).with(dir).and_return(the_object)
    end
    subject { described_class.send(expected_method, dir) }

    describe '.terabytes' do
      let(:expected_method) { :terabytes }
      let(:blocks_available) { 30000000 }

      it { should == 0.027939677238464355 }
    end

    describe '.gigabytes' do
      let(:expected_method) { :gigabytes }

      it { should == 0.00286102294921875 }
    end

    describe '.megabytes' do
      let(:expected_method) { :megabytes }

      it { should == 2.9296875 }
    end

    describe '.kilobytes' do
      let(:expected_method) { :kilobytes }

      it { should == 3000.0 }
    end

    describe '.bytes' do
      let(:expected_method) { :bytes }

      it { should == 3072000.0 }
    end
  end

  describe 'instance method' do
    before { the_object.stub(:filesystem_stat => filesystem_stat) }

    describe '#terabytes' do
      let(:blocks_available) { 30000000 }

      its(:terabytes) { should == 0.027939677238464355 }
    end

    describe '#gigabytes' do
      its(:gigabytes) { should == 0.00286102294921875 }
    end

    describe '#megabytes' do
      its(:megabytes) { should == 2.9296875 }
    end

    describe '#kilobytes' do
      its(:kilobytes) { should == 3000.0 }
    end

    describe '#bytes' do
      its(:bytes) { should == 3072000.0 }
    end
  end

  describe '#filesystem_stat' do
    before do
      Sys::Filesystem.should_receive(:stat).with(dir).and_return(filesystem_stat)
    end

    its(:filesystem_stat) { should == filesystem_stat }
  end

end
