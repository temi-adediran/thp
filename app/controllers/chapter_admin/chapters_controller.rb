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


    def show
      return redirect_to chapter_admin_root_path unless requested_resource == current_user.chapter

      render locals: {
        page: Administrate::Page::Show.new(dashboard, requested_resource),
      }
    end

    def valid_action?(name, resource = resource_class)
      %w[edit show].include?(name.to_s) && super
    end
  end
end
