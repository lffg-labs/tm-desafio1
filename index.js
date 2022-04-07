'use strict';

/**
 * @param {import('express').Request} req
 * @param {import('express').Response} res
 */
async function myFirstFn(req, res) {
  // :)
  await new Promise((r) => setTimeout(r, 1000));
  
  res.status(200).json({
    headersString: JSON.stringify(req.headers),
    foo: "bar"
  });
}

module.exports = {
    myFirstFn
};