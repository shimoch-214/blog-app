module MarkdownHelper
  def markdown(text)
    unless @markdown
      options = {
        # filter_html: true,
        # excape_html: :image,
        # 公式によるとこの辺のoptionはほとんど聴いていない。
        hard_wrap: true,
        xhtml: true,
        prettify: true,
        lax_space: true,
        lax_html_blocks: true,
        strikethrough: true
      }
      extensions = {
        space_after_headers: true,
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        tables: true,
      }
      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(text).html_safe
  end
end