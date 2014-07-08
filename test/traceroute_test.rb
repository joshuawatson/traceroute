require_relative 'test_helper'

class TracerouteTest < Minitest::Test
  def setup
    @traceroute = Traceroute.new Rails.application
    @traceroute.load_everything!
  end

  def test_defined_action_methods
    assert_equal ['users#index', 'users#index2', 'users#show', 'admin/shops#index', 'admin/shops#create'], @traceroute.defined_action_methods.reject {|r| r.start_with? 'rails/'}
  end

  def test_routed_actions
    assert_empty @traceroute.routed_actions
  end
end
