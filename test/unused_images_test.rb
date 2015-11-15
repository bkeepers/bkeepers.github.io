require "minitest/autorun"

describe "images" do
  Dir["images/**/*"].each do |path|
    it "references #{path}" do
      return unless File.file?(path)
      system "grep -r -m 1 #{path} _site > /dev/null" || fail("#{path} is unused")
    end
  end
end
