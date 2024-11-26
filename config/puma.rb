	try_filuma 설정 파일

	# 서버를 실행할 포트와 바인딩
	port ENV.fetch("PORT") { 3000 }
	#
	# # 프로덕션 환경에서는 UNIX 소켓을 사용할 수 있습니다.
	# # sock 파일을 사용하려면 아래 코드를 활성화하세요.
	# # bind "unix:///var/www/myapp/shared/tmp/sockets/puma.sock"
	#
	 environment ENV.fetch("RAILS_ENV") { "development" }
	#
	 workers ENV.fetch("WEB_CONCURRENCY") { 2 }
	 threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
	 threads threads_count, threads_count
	#
	 preload_app!
	#
	 on_worker_boot do
	   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
	  end
	#
