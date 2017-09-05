require 'test_helper'

class StandardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get standards_path
    assert_response :success
  end

    def test_should_successfully_import_csv
      students_csv_rows = <<-eos
        Barbara Geary,2,2,K,1
        Name2,K,1,2,2
        Name3,3,2,2,K
        eos

      domains_csv_rows = <<-eos
        K,RF,RL,RI
        1,RF,RL,RI
        2,W,WX,Y
        3,WX,YZ,Z
        eos


      domains_file = Tempfile.new('new_domains.csv')
      domains_file.write(domains_csv_rows)
      domains_file.rewind
      tests_file = Tempfile.new('new_tests.csv')
      tests_file.write(students_csv_rows)
      tests_file.rewind

      assert_difference "Standard.count", 1 do
        get standards_path, :file => Rack::Test::UploadedFile.new(domains_file, tests_file, 'text/csv')
      end

      assert_redirected_to your_path
      assert_equal "Successfully imported the CSV file.", flash[:notice]
    end

end
