component accessors="true" {
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 1, 0, 0 );
	this.sessionManagement = false;
	this.mappings[ '/framework' ] = expandPath( '../lib/fw1/v3_5_0/framework' );

	public function _get_framework_one() {
		if ( !structKeyExists( request, '_framework_one' ) ) {
			request._framework_one = new MyApplication({
				action = 'action',
				usingSubsystems = false,
				defaultSubsystem = 'home',
				defaultSection = 'main',
				defaultItem = 'default',
				subsystemDelimiter = ':',
				siteWideLayoutSubsystem = 'common',
				subsystems = { },
				home = 'main.default', // defaultSection & '.' & defaultItem
				// or: defaultSubsystem & subsystemDelimiter & defaultSection & '.' & defaultItem
				error = 'main.error', // defaultSection & '.error'
				// or: defaultSubsystem & subsystemDelimiter & defaultSection & '.error'
				reload = 'reload',
				password = 'true',
				reloadApplicationOnEveryRequest = false,
				preserveKeyURLKey = 'fw1pk',
				maxNumContextsPreserved = 10,
				baseURL = 'useCgiScriptName', // useCgiScriptName or useRequestURI
				generateSES = false,
				SESOmitIndex = false,
				// base = omitted so that the framework calculates a sensible default
				// cfcbase = omitted so that the framework calculates a sensible default
				unhandledExtensions = 'cfc,lc,lucee',
				unhandledPaths = '/flex2gateway',
				unhandledErrorCaught = false,
				// applicationKey = 'framework.one',
				cacheFileExists = false,
				routes = [ ],
				// resourceRouteTemplates - see routes documentation
				routesCaseSensitive = true,
				noLowerCase = false,
				trace = false,
				controllersFolder = "controllers",
				layoutsFolder = "layouts",
				subsystemsFolder = "subsystems",
				viewsFolder = "views",
				diOverrideAllowed = false,
				diEngine = "custom", // none, di1, aop1, wirebox, custom
				diLocations = [ "model", "services", "controllers" ],
				diConfig = {
					constants = {
						querycache = CreateTimeSpan(0, 0, 5, 0)
					}
				},
				diComponent = "framework.ioc",
				environments = {
					local = { reloadApplicationOnEveryRequest = true },
					development = { reloadApplicationOnEveryRequest = false },
					staging = { reloadApplicationOnEveryRequest = false },
					production = { reloadApplicationOnEveryRequest = false }
				}
			});
		}
		return request._framework_one;
	}

    // delegation of lifecycle methods to FW/1:
	function onApplicationStart() {
		return _get_framework_one().onApplicationStart();
	}
	function onError( exception, event ) {
		return _get_framework_one().onError( exception, event );
	}
	function onRequest( targetPath ) {
		return _get_framework_one().onRequest( targetPath );
	}
	function onRequestEnd( targetPath ) {
		return _get_framework_one().onRequestEnd( targetPath );
	}
	function onRequestStart( targetPath ) {
		return _get_framework_one().onRequestStart( targetPath );
	}
	function onSessionStart() {
		return _get_framework_one().onSessionStart();
	}
}