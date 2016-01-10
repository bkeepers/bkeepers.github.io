require "minitest/autorun"
require "yaml"

describe "tags" do
  TAGS = YAML.load_file("_data/tags.yml")

  Dir["_posts/**/*.*"].each do |file|
    next unless File.read(file).match(/^---/)

    describe file do
      before do
        @tags = Array(YAML.load_file(file)["tags"])
      end

      it "unknown tags" do
        @tags.each do |tag|
          fail "unknown tag #{tag.inspect} in #{file}" unless TAGS.include?(tag)
        end
      end

      it "duplicate tags" do
        assert_equal @tags, @tags.uniq
      end
    end
  end
end
