module ChapterAdmin
  class ChaptersController < ChapterAdmin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   foo = Foo.find(params[:id])
    #   foo.update(params[:foo])
    #   send_foo_updated_email
    # end

    def index
      redirect_to chapter_admin_chapter_path(current_user.chapter)
    end

    def valid_action?(name, resource = resource_class)
      %w[edit show].include?(name.to_s) && super
    end
  end
end
