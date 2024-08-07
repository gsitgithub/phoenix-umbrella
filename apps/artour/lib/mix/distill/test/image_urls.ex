#run task with 'mix distill.test.image_urls'
defmodule Mix.Tasks.Distill.Test.ImageUrls do
    use Mix.Task

    @shortdoc "Checks that all image urls return HTTP 200 status code"
	def run([base_url]) do
        # disable logging of database queries
        Logger.configure(level: :error)
        #start app so repo is available
        Mix.Task.run "app.start", []

        #start HTTPoison
        HTTPoison.start

        #parallel map based on:
        #http://elixir-recipes.github.io/concurrency/parallel-map/
    	Grenadier.Repo.all(Artour.Image)
    		|> Enum.flat_map(fn image -> all_urls_for_image(image, base_url) end)
            |> Task.async_stream(&HTTPoison.head/1, max_concurrency: System.schedulers_online * 8, timeout: :infinity)
            |> Enum.each(&print_image_response/1)

    	IO.puts "\nAll image urls checked"
	end

    #task status and http status is ok, so do nothing
    def print_image_response({:ok, {:ok, %HTTPoison.Response{status_code: 200}}}) do
    end

    def print_image_response({:ok, {:ok, response}}) do
        IO.puts :stderr, "HTTP status code of " <> Integer.to_string(response.status_code) <> " for " <> response.request_url
    end

    #url sent no response
    def print_image_response({:ok, {:error, message}}) do
        IO.puts :stderr, message
    end

    #problem with running async task somehow
    def print_image_response({_task_status, {_httpoison_status, _message}}) do
        IO.puts :stderr, "Problem with image url async task"
    end

    def image_filenames(image) do
        [
            image.filename_thumbnail,
            image.filename_small,
            image.filename_medium,
            image.filename_large,
        ]
    end

	def url_for_image_filename(base_url, image_filename) do
        URI.merge(base_url, image_filename)
        |> to_string
    end

    def all_urls_for_image(image, base_url) do
        image_filenames(image)
        |> Enum.map(&(url_for_image_filename(base_url, &1)))
    end

end
