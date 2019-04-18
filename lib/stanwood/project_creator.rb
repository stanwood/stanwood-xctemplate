module Stanwood

  class ProjectCreator

    def execute(project_name, platform)
      case
      when platform == "--ios"
        puts "\n🚀🚀🚀 We are working on this awesome feature for iOS. Stay tuned!!! 🚀🚀🚀\n\n"
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
