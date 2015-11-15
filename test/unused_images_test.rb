require "minitest/autorun"

describe "images" do
  Dir["images/**/*"].each do |path|
    it "references #{path}" do
      return unless File.file?(path)
      system("grep -rq #{path} _site") || fail("#{path} is unused")
    end
  end
end
