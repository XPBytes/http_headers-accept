require 'test_helper'

module HttpHeaders
  class AcceptTest < Minitest::Test
    def test_that_it_has_a_version_number
      refute_nil ::HttpHeaders::Accept::VERSION
    end

    def test_it_parses_empty
      Accept.new('')
      pass 'did not break'
    end

    def test_it_parses_one
      list = Accept.new('application/json')
      assert_equal 1, list.length
      assert_equal 'application/json', list.first.to_s
    end

    def test_it_parses_parameters
      list = Accept.new('application/json; foo=bar; q=0.5')
      assert_equal 1, list.length
      assert_equal 'bar', list.first[:foo]
      assert_equal 0.5, list.first.q
    end

    def test_it_parses_multiple_lines
      list = Accept.new(['*/*; q=0.1', 'application/json, text/html; q=0.8'])
      assert_equal 3, list.length
      assert_equal 'application/json', list.first.to_s
      assert_equal '*/*; q=0.1', list.last.to_s
      assert_equal 0.8, list[1].q
    end
  end
end
