module Stanwood

  class ProjectCreator

    def execute(project_name, platform)
      case
      when platform == "--ios"
        puts "\n🚀🚀🚀"
        system("ls")
        system("sh /Users/talzion/Stanwood/stanwood-xctemplate/lib/stanwood/create.sh " + project_name)
        # system("git clone git@github.com:stanwood/Xcode_Templates_iOS.git /echo tmp/xcode_template")
        #
        # system("Running...")
        # system("chmod +x ruby /tmp/xcode_template/Template/configure ", project_name)
        #
        # system("echo Finishing installation")
        # system("rm -rf /tmp/xcode_template")
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
