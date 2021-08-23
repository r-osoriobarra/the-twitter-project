module ApplicationHelper
    def svg(name)
        file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
        return File.read(file_path).html_safe
    end
end
