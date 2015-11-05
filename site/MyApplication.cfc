component extends="framework.one" {

    function init() {
        super.init(argumentCollection=arguments);
        return this;
    }

    function getEnvironment() {
        return "local";
    }

    function setupEnvironment( env ) {
    }

    function setupApplication() {
    }

    function setupSession() { }

    function onRequestStart( targetPath ) {
        return super.onRequestStart( arguments.targetPath );
    }

    function onRequestEnd( targetPath ) {
        return super.onRequestEnd( arguments.targetPath );
    }

    function setupSubsystem( module ) { }

    function setupRequest() {
    }

    function setupView( rc ) { }

    function before() { }

    function after() { }

    function setupResponse( rc ) { }

    function onMissingView( rc ) {
        return view( 'main/404' );
    }

    function onError( exception, event ) {
        return super.onError( arguments.exception, arguments.event );
    }
}