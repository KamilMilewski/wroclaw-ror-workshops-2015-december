class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    return '0.00' if (count = subject_item.subject_item_notes.count).zero?
    sum = subject_item.subject_item_notes.map(&:value).inject(:+).to_f
    format '%.2f', sum / count
  end
end
