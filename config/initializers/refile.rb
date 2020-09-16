Refile.backends['store'] = Refile::Backend::FileSystem.new('public/uploads/')
# Refile.mount_point = 'images'
# 移行する場合はtem/uploads/storeの画像をpublic/uploadsにそのままコピーすれば大丈夫