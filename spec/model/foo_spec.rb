require 'spec_helper'

describe Foo do
  describe 'deprecate' do
    before do
      STDERR.should_receive(:puts).with("Warning: calling deprecated method \
Foo.foo. This method will be removed in a future release.")
      STDOUT.should_receive(:puts).with("in the foo method")
    end
    subject { Foo.new.foo }
    specify { expect { subject }.not_to raise_error }
  end
end
