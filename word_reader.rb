# encoding: utf-8
#
# Класс WordReader, отвечающий за чтение слова для игры.
class WordReader
  # Так как, подобно классу ResultPrinter, экземляр этого класса не хранит
  # в себе никаких данных, конструктор отсутствует.

  # Сохраним старую возможность читать слово из аргументов командной строки. В
  # качестве отедльного метода read_from_args для обратной совместимости.
  def read_from_args
    return ARGV[0]
  end

  # Метод read_from_file, возвращающий случайное слово, прочитанное из файла,
  # имя которого нужно передать методу в качестве единственного аргумента.
  def read_from_file(file_name)
    # Если файла не существует, сразу выходим из метода
    if !File.exist?(file_name)
      return nil
    end

    # Открываем файл, явно указывая его кодировку, читаем все строки в массив и
    # закрываем файл.
    file = File.new(file_name, "r:UTF-8")
    lines = file.readlines
    file.close

    # Возвращаем случайную строчку (слово) из прочитанного массива, не забывая
    # удалить в конце символ перевода строки методом chomp.
    return lines.sample.chomp.downcase
  end
end
