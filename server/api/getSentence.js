const axios = require("axios");

const getSentence = async () => {
  // const jokeData = await axios.get("https://api.quotable.io/random");
  const jokeData = await axios.get("https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en");

  // return jokeData.data.content.split(" ");
  return jokeData.data.quoteText.split(" ");
};

module.exports = getSentence;
