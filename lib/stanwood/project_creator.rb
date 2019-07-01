module Stanwood

  class ProjectCreator

    def execute(project_name, platform)
      case
      when platform == "--ios"
        puts "\n🚀🚀🚀"
        path = File.join(__dir__, 'create.sh')
        system("sh " + path + " " + project_name)
        puts "\n🚀🚀🚀"
        exit
      when platform == "--backend"
        puts "\n🚀🚀🚀 We are working on this awesome feature for Backend. Stay tuned!!! 🚀🚀🚀\n\n"
        exit
      when platform == "--android"
        puts "\n🚀🚀🚀 We are working on this awesome feature for Android. Stay tuned!!! 🚀🚀🚀\n\n"
        exit
      end
    end

    def executeTemplates(platform)
      case
      when platform == "--ios"
        system("curl \"https://raw.githubusercontent.com/stanwood/Xcode_Templates_iOS/master/Script/install.sh\" | sudo bash")
        exit
      when platform == "--backend"
        puts "\n🚀🚀🚀 We are working on this awesome feature for Backend. Stay tuned!!! 🚀🚀🚀\n\n"
        exit
      when platform == "--android"
        puts "\n🚀🚀🚀 We are working on this awesome feature for Android. Stay tuned!!! 🚀🚀🚀\n\n"
        exit
      end
    end
  end
end
