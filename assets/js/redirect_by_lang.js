(function () {
	// check URL (return if match /[lang]/)
	var path = location.pathname;
	if (!path || path.match(/\/(?:ja|jp|en|de)\//i)) return;

	// get user language
	var nav = window.navigator;
	var lang = (nav.languages && nav.languages[0]) ||
				nav.browserLanguage || nav.language || nav.userLanguage || '';

	// add any directory to path by language
	var new_path = (lang.match(/^ja/) ? '/jp/' : '/en/') + path.replace(/^[\/]/, '');

	// output to console
	if (window.console) {
		console.log('redirect: ', path, ' -> ', new_path, ' ... by lang: ',
				nav.languages, nav.browserLanguage, nav.language, nav.userLanguage);
	}
	// redirect to multi lang page by user language
	if (path != new_path) location.href = new_path;
})();
