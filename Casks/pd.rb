cask "pd" do
  version "0.52-1"
  version_name "really"
  sha256 "c8721aa1ec3d433d28e055bd6a64559723d28e0eb49c0ac1401d6ae46621e4db"

  url "http://msp.ucsd.edu/Software/pd-#{version}.macos.zip"
  name "Pd"
  desc "Visual programming language for multimedia"
  homepage "http://msp.ucsd.edu/software.html"

  livecheck do
    url "http://msp.ucsd.edu/software.html"
    strategy :page_match
    regex(%r{href=.*?/pd-(\d+(?:\.\d+)*-\d+)\.mac\.tar\.gz}i)
  end

  app "Pd-#{version}-#{version_name}.app"

  postflight do
    set_permissions "#{appdir}/Pd-#{version}-#{version_name}.app", "u+w"
  end

  zap trash: [
    "~/Library/Preferences/org.puredata.pd.pd-gui.plist",
    "~/Library/Saved Application State/org.puredata.pd.pd-gui.savedState",
  ]
end
