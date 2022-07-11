class AppName

    def initiialize(app)

        @app = app

    end

    def call(env)

        if (env["ORIGINAL_FULLPATH"] == "/")
            
            ['200', {'Content-Type' => 'text/html'}, ['Hello World']]

        else
        
            status, headers, response = @app.call(env)
            headers.merge!({'X-App-Name' => 'Notebook API'})
            [status, headers, [response.body]]

        end

    end

end