# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ISO3166TW = {
  "CHA": "彰化縣",
  "CYI": "嘉義市",
  "CYQ": "嘉義縣",
  "HSQ": "新竹縣",
  "HSZ": "新竹市",
  "HUA": "花蓮縣",
  "ILA": "宜蘭縣",
  "KEE": "基隆市",
  "KHH": "高雄市",
  "KHQ": "高雄縣",
  "MIA": "苗栗縣",
  "NAN": "南投縣",
  "PEN": "澎湖縣",
  "PIF": "屏東縣",
  "TAO": "桃園縣",
  "TNN": "臺南市",
  "TNQ": "臺南縣",
  "TPE": "臺北市",
  "TPQ": "新北市",
  "TTT": "臺東縣",
  "TXG": "臺中市",
  "TXQ": "臺中縣",
  "YUN": "雲林縣",
  "JME": "金門縣",
  "LJF": "連江縣"
}

def constituency_parser(constituency)
  case (constituency[0])
  when 'proportional'
    return '全國不分區'
  when 'aborigine'
    if constituency[1] == 'lowland'
      return '平地原住民'
    elsif constituency[1] == 'highland'
      return '山地原住民'
    end
  when 'foreign'
    return '僑居國外國民'
  else
    if ISO3166TW[constituency[0]]
      if (constituency[1] == 0)
        result = ISO3166TW[constituency[0]]
      else
        result = ISO3166TW[constituency[0]] + '第' + constituency[1].to_s + '選區'
      end
    end
    return result
  end
end

committees = [
  { id: 1, name: '內政委員會', kind: 'sc'},
  { id: 5, name: '經濟委員會', kind: 'sc'},
  { id: 6, name: '財政委員會', kind: 'sc'},
  { id: 8, name: '教育及文化委員會', kind: 'sc'},
  { id: 9, name: '交通委員會', kind: 'sc'},
  { id: 12, name: '社會福利及衛生環境委員會', kind: 'sc'},
  { id: 13, name: '程序委員會', kind: 'ac'},
  { id: 17, name: '外交及國防委員會', kind: 'sc'},
  { id: 18, name: '司法及法制委員會', kind: 'sc'},
  { id: 19, name: '院會', kind: 'yc'},
  { id: 28, name: '紀律委員會', kind: 'ac'},
  { id: 15, name: '修憲委員會', kind: 'ac'},
  { id: 30, name: '經費稽核委員會', kind: 'ac'},
  { id: 41, name: '全院委員會', kind: 'ac'}
]

Committee.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Committee.table_name)

committees.each do |c|
  committee = Committee.new()
  committee.id = c[:id]
  committee.name = c[:name]
  committee.kind = c[:kind]
  committee.save
end

County.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(County.table_name)

counties = [{ id: 1, name: "全國不分區" },
  { id: 2, name: "基隆市" },
  { id: 3, name: "臺北市" },
  { id: 4, name: "新北市" },
  { id: 5, name: "桃園市" },
  { id: 6, name: "新竹市" },
  { id: 7, name: "新竹縣" },
  { id: 8, name: "苗栗縣" },
  { id: 9, name: "臺中市" },
  { id: 10, name: "彰化縣" },
  { id: 11, name: "南投縣" },
  { id: 12, name: "雲林縣" },
  { id: 13, name: "嘉義市" },
  { id: 14, name: "嘉義縣" },
  { id: 15, name: "臺南市" },
  { id: 16, name: "高雄市" },
  { id: 17, name: "屏東縣" },
  { id: 18, name: "臺東縣" },
  { id: 19, name: "花蓮縣" },
  { id: 20, name: "宜蘭縣" },
  { id: 21, name: "澎湖縣" },
  { id: 22, name: "金門縣" },
  { id: 23, name: "連江縣" },
  { id: 24, name: "平地原住民" },
  { id: 25, name: "山地原住民" },
  { id: 26, name: "僑居國外國民" }
]

counties.each do |c|
  county = County.new()
  county.id = c[:id]
  county.name = c[:name]
  county.save
end
ActiveRecord::Base.connection.reset_pk_sequence!(County.table_name)

Party.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!(Party.table_name)

parties = [
  { id:1, name: "無黨籍", abbreviation: nil, short_name: "無黨籍" },
  { id:2, name: "中國國民黨", abbreviation: "KMT", short_name: "國民黨" },
  { id:3, name: "民主進步黨", abbreviation: "DPP", short_name: "民進黨" },
  { id:4, name: "親民黨", abbreviation: "PFP", short_name: "親民黨" },
  { id:5, name: "無黨團結聯盟", abbreviation: "NSU", short_name: "無黨團結聯盟" },
  { id:6, name: "台灣團結聯盟", abbreviation: "TSU", short_name: "台聯" },
  { id:7, name: "民國黨", abbreviation: "MKT", short_name: "民國黨" }
]

parties.each do |p|
  party = Party.new(p)
  party.id = p['id']
  party.save
end


ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end