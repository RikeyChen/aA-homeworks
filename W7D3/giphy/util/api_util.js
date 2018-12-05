const fetchSearchGiphys = () => (
  $.ajax({
    method: 'GET',
    url: 'http://api.giphy.com/v1/gifs/search?q=${search+term}&api_key=dc6zaTOxFJmzC&limit=2',
  })
);

export default fetchSearchGiphys;
