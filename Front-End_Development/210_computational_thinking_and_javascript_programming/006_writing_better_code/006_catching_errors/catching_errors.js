// Catching Errors

var data = 'not valid JSON';

JSON.parse(data);               // throws SyntaxError: Unexpected token i in JSON at position 0

try {
  
  // Do something that might fail here and throw an Error.

} catch (error) {

  // If an Error is thrown, this code will run, and error will be set to the 
  // Error object that was thrown.

} finally {

  // This code is always run, regardless of whether an Error was thrown or not.

}

// Using the try/catch/finally statements

function parseJSON(data) {
  var result;

  try {                         // If an Error is thrown within the try block, program
                                // execution stops and...
    result = JSON.parse(data);

  } catch (e) {                 // ...the catch block will be invoked if it exists.
                                // The variable e will contain an Error object,
                                // which can be inspected by accessing certain
                                // properties on it:

    console.log('There was a', e.name, 'parsing JSON data:', e.message);
    result = null;

  } finally {                   // Any code within a finally block is executed
                                // last, regardless of whether an error was raised.

    console.log('Finished parsing data.');
  }

  return result;
}

var data = 'not valid JSON';

parseJSON(data);                // Logs "There was a SyntaxError parsing JSON data:
                                //       Unexpected token i in JSON at position 0"
                                // Logs "Finished parsing data."
                                // and returns null