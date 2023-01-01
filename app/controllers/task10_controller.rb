# frozen_string_literal: true

# class for calc
class Task10Controller < ApplicationController
  def input; end

  def output
    # @digits = find_armstrongs(params[:digit].to_i)
    @digits = []
    find_armstrongs(params[:digit].to_i).each_with_index { |val, indx| @digits.append([number: val, index: indx + 1]) }
    respond_to do |format|
      format.xml { render xml: @digits.to_xml }
      format.rss { render xml: @digits.to_xml }
    end
  end

  private

  def find_armstrongs(number)
    (1..Float::INFINITY).lazy.drop_while { |x| x.digits.size < number }
                        .take_while { |x| x.digits.size == number }
                        .select { |x| armstrong?(x) }.force
  end

  def armstrong?(number)
    number.digits.sum { |x| x**number.digits.size } == number
  end
end
