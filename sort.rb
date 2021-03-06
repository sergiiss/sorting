class Sort
  attr_reader :numbers, :continue, :repeats

  def initialize(numbers)
    @numbers = numbers
    @continue = true
    @repeats = 0
  end

  REDUCTION_FACTOR = 1.247

  def stupid_sorting
    index = 0

    while index < numbers.size - 1
      @repeats += 1

      if numbers[index] > numbers[index + 1]
        change_number = numbers[index]
        @numbers[index] = numbers[index + 1]
        @numbers[index + 1] = change_number
        index = 0
      else
        index += 1
      end
    end

    puts repeats
    numbers
  end

  def bubble_sorting
    while continue
      @repeats += 1
      @continue = false
      index = 0

      while index < numbers.size - 1
        @repeats += 1

        if numbers[index] > numbers[index + 1]
          change_number = numbers[index]
          @numbers[index] = numbers[index + 1]
          @numbers[index + 1] = change_number
          @continue = true
        else
          index += 1
        end
      end
    end

    puts repeats
    numbers
  end

  def sorting_a_comb
    increment = ((numbers.size) / REDUCTION_FACTOR).round
    comb = true

    while comb
      @repeats += 1
      index = 0
      comb = false if increment == 1

      while (index + increment) < numbers.size
        @repeats += 1
        if numbers[index] > numbers[index + increment]
          change_number = numbers[index]
          @numbers[index] = numbers[index + increment]
          @numbers[index + increment] = change_number
        else
          index += 1
        end
      end

      if increment <= 2
        increment = 1
      else
        increment = (increment / REDUCTION_FACTOR).round
        comb = true
      end
    end

    bubble_sorting

    numbers
  end
end

sort = Sort.new(%w[a s d r t g u t t b nu y y i8])
sort.sorting_a_comb
