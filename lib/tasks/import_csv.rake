require 'csv'

namespace :import_csv do
  desc 'CSVデータをインポート'

  task stores: :environment do
    Store.import_csv("db/30chokubaijo_map.csv")
  end
end
