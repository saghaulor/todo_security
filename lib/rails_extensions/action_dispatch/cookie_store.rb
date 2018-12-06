module InsecureCookieStore
  private
  def cookie_jar(request)
    request.cookie_jar
  end

  def unpacked_cookie_data(req)
    req.fetch_header("action_dispatch.request.unsigned_session_cookie") do |k|
      v = stale_session_check! do
        if data = get_cookie(req)
          data = ::ActiveSupport::JSON.decode(data.gsub("=>", ":"))
          data.stringify_keys!
        end
        data || {}
      end
      req.set_header k, v
    end
  end
end

::ActionDispatch::Session::CookieStore.prepend InsecureCookieStore
