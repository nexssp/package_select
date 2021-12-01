const {
  nxsError,
  nxsInfo,
  nxsWarn,
} = require(`${process.env.NEXSS_PACKAGES_PATH}/Nexss/Lib/NexssLog.js`);

const cheerio = require("cheerio");

const NexssIn = require(`${process.env.NEXSS_PACKAGES_PATH}/Nexss/Lib/NexssIn.js`);
let NexssStdout = NexssIn();
const example = ` eg. nexss Select/Dom "<body>
<footer id='footer__bootom'>myfooter</footer__bottom>
</body>" --_selector="#footer__bottom" --_command="$('title')"`;

// --Selector = "#footer" or "links" or ""
if (
  (!NexssStdout.nxsIn || NexssStdout.nxsIn === "undefined") &&
  !NexssStdout["_dom"]
) {
  nxsError(`Enter dom selector\n${example}`);
  process.stdout.write(JSON.stringify(NexssStdout));
  process.exit(1);
}

if (!NexssStdout.nxsIn) NexssStdout.nxsIn = NexssStdout["_dom"];
let $;
try {
  $ = cheerio.load(NexssStdout.nxsIn);
} catch (error) {
  nxsError(error);
  nxsError("Cannot load DOM parser on your input.");
  process.exit(1);
}

if (!NexssStdout._selector) {
  nxsError("Specify selector. For all elements use *");
  process.exit(1);
} else {
  const foundElements = $(NexssStdout._selector);
  // nxsInfo(NexssStdout.nxsIn, foundElements.length, NexssStdout._selector);
  let elements = [];
  foundElements.each(function (i, e) {
    elements.push($(this).text().trim());
  });

  if (!elements.length) {
    nxsError(
      "Selector NexssStdout._selector not contain any text. Check if the selector is properly setup or if the dom elements are empty."
    );
  }
  NexssStdout[NexssStdout.resultField_1] = elements;
}

delete NexssStdout.nxsIn;
delete NexssStdout.resultField_1;
process.stdout.write(JSON.stringify(NexssStdout));
