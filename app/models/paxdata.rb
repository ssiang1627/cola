class Paxdata < ActiveRecord::Base
  self.table_name = "a05b01_paxdata"

  def self.data_count
    query = <<-SQL
    select '男' Pax_Gender,count(Pax_Gender) as count_gender from loyal_customer where Pax_Gender in ('男') union select '女' Pax_Gender,count(Pax_Gender) as count_gender from loyal_customer where Pax_Gender in ('女');
    SQL

    data=Paxdata.find_by_sql(query)#.pluck("Service_id")
    data.map{|d| [d.Pax_Gender,d.count_gender]}
  end

   def self.data_count1
     query = <<-SQL
     select '成人'Pax_Type,count(Pax_Type) as count_type from loyal_customer where Pax_Type in ('大人') union select '小孩'Pax_Type,count(Pax_Type) as count_type from loyal_customer where Pax_Type in ('小孩加床','小孩佔床','小孩不佔','嬰兒');
     SQL

     data=Paxdata.find_by_sql(query)#.pluck("Service_id")
     data.map{|d| [d.Pax_Type,d.count_type]}
   end

   def self.data_count2
     query = <<-SQL
     select '1~10'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 1 and 10 union select '11~20'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 11 and 20 union select '21~30'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 21 and 30 union select '31~40'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 31 and 40 union select '41~50'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 41 and 50 union select '51~60'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 51 and 60 union select '61~70'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 61 and 70 union select '71~80'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age between 71 and 80 union select '81up'Pax_Age,count(Pax_Age) as count_age from loyal_customer where Pax_Age > 80;
     SQL

     data=Paxdata.find_by_sql(query)#.pluck("Service_id")
     data.map{|d| [d.Pax_Age.to_s,d.count_age]}
   end

end