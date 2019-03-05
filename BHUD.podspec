Pod::Spec.new do |spec|
    spec.name         = 'BHUD'
    spec.version      = '1.0.4'
    spec.summary      = 'hud'
    spec.homepage     = 'https://github.com/february29/BHUD'
    spec.license      = 'MIT'
    spec.authors      = {'february29' => 'pengyou_byh@163.com'}
    spec.platform     = :ios, '7.0'
    spec.source       = {:git => 'https://github.com/february29/BHUD.git', :tag => spec.version}

    #spec.resource_bundles     = ['BHUD/images/*']
    spec.resource_bundles = {'BHUDImagesBundle' => ['BHUD/images/*.png']}

    spec.source_files = ['BHUD/*.{h,m}','BHUD/HudIndicatorViewStyle/*.{h,m}']

    spec.requires_arc = true
end
