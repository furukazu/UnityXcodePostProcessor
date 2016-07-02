require 'UnityXcodePostProcessor'
require 'thor'
require 'xcodeproj' # http://www.rubydoc.info/gems/xcodeproj
#require 'plist' # https://rubygems.org/gems/plist/versions/3.2.0
#require 'yaml'​

module UnityXcodePostProcessor
  class CLI < Thor

    #class_option :s, :default => File.join(File.expand_path("~"),".UnityXcodePostProcessor")

    desc "localize","process"
    def localize
        #load_config(options[:s])
    
        #root = @config["main"]["target_project_root"]
        #locs = @config["localize"]
        # 対象となるプロジェクトの出力先
        root = '/Users/user/Documents/Program/Unity/local/Build/ios_e/Unity-iPhone.xcodeproj/'

        project = Xcodeproj::Project.open(root)

        # 新しく Variant Group として InfoPlist.strings をつくる
        infoplist_ref = project.main_group.new_variant_group("InfoPlist.strings")
        
        # 英語版の登録
        en_ref = infoplist_ref.new_file("en.lproj/InfoPlist.strings")
        en_ref.name = "en"
        
        # 日本語版の登録
        ja_ref = infoplist_ref.new_file("ja.lproj/InfoPlist.strings")
        ja_ref.name = "ja"
        
        # それを参照で登録
        buildfile_ref = project.new(Xcodeproj::Project::PBXBuildFile)
        buildfile_ref.file_ref = infoplist_ref
        # Unity-iPhone ってターゲットの Resources Build Phase の対象として追加
        phase = project.native_targets.find { |e| e.name == "Unity-iPhone" }.build_phases.find{ |e| e.isa == "PBXResourcesBuildPhase" }
        phase.files << buildfile_ref
        
        # プロジェクトを保存
        project.save
        
        # プロジェクトの情報を変更しただけで、実際のファイルはまだ用意してないのでこれから準備する
        
        # 保存フォルダの準備
        FileUtils.mkdir_p(root + '../en.lproj' )
        FileUtils.mkdir_p(root + '../ja.lproj' )
        
        # とりあえず CFBundleDisplayName だけ設定する
        File.write(root + '../en.lproj/InfoPlist.strings', "CFBundleDisplayName = \"English\";")
        File.write(root + '../ja.lproj/InfoPlist.strings', "CFBundleDisplayName = \"日本語\";")
        
    end
    
  end
  
end