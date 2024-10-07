module SolidQueueDashboard
  module PaginationHelper
    def paginate(scope, page:, per_page:)
      page = [ page.to_i, 1 ].max
      per_page = per_page.zero? ? 25 : [ per_page.to_i, 1 ].max

      offset = (page - 1) * per_page

      records = scope.offset(offset).limit(per_page)
      total_count = scope.count
      total_pages = (total_count.to_f / per_page).ceil

      {
        records: records,
        current_page: page,
        per_page: per_page,
        total_pages: total_pages,
        total_count: total_count
      }
    end

    def page_range(current_page, total_pages, window: 2)
      if total_pages <= 7
        (1..total_pages).to_a
      else
        [
          1,
          (current_page - window..current_page + window).to_a,
          total_pages
        ].flatten.uniq.sort.reject { |p| p < 1 || p > total_pages }.tap do |range|
          range.each_cons(2) do |a, b|
            range.insert(range.index(b), :gap) if b - a > 1
          end
        end
      end
    end
  end
end
