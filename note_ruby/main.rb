require "csv"

select_menu = "0"
file_name = ""
check_file_name = true

while select_menu == "0" do
  puts "1(新規でメモを作成) 2(既存のメモを編集する)"
  select_menu = gets.chomp
  if select_menu != "1" && select_menu != "2"
    puts "半角英数字で1か2を入力してください"
    select_menu = "0"
  end 
end
  
while check_file_name do
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp
  if file_name.include?(".")
    puts "拡張子を除いてください"
  else
    check_file_name = false
    file_name = file_name + ".csv"
  end
end


if select_menu == "1"
  p "メモしたい内容を記入してください"  
  p "完了したらCtrl + Dを押してください"
  CSV.open(file_name, "w") do |contents|
    while select_menu == "1"
      content = gets
      if content != nil
        contents << [content.comp]
      else 
        break
    end
  end

elsif select_menu == "2" 
  p "追記したい内容を記入してください"
  p "完了したらCtrl + Dを押してください"
  CSV.open(file_name, "a") do |contents|
    while select_menu == "2"
      content = gets
      if content != nil
        contents << [content.comp]
      else
        break
    end
  end
end


