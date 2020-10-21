class Entry < ApplicationRecord
has_one_attached :image
validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "画像フォーマットは,jpeg, gif, pngにしてください" },
                      size:       { less_than: 5.megabytes,
                                      message: "ファイル容量は5MB以下としてください" }

end
