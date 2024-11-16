require 'minitest/autorun'
require 'minitest/reporters'
require "minitest/spec"
require_relative '../app/student'

Minitest::Reporters.use! [
                           # Minitest::Reporters::SpecReporter.new,
                           Minitest::Reporters::HtmlReporter.new(
                             reports_dir: 'test/reports',
                             report_filename: 'test_results.html',
                             # clean: true,
                             add_timestamp: true
                           )
                         ]

class TestStudent < Minitest::Test
  # def test_

end