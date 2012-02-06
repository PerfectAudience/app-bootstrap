# App Bootstrap #

App Bootstrap is meant to be a starting point for nowspots app development that provides a minimum amount of code to create an app.

## Environments ##

### Production ###

put the production url here.

### Staging ###

put the staging url here.

### GET /serve ###

Serves up the customizable widget.

### GET /setting.json ###

Serves the json that defines the configuration parameters.  The Nowspots.com UI uses this to create a configuration form for the app.

#### Application parameters: ####

    spot            - Str  - required       - NowSpots Spot id
    app             - Str  - required       - NowSpots SpotApp id
    destination_url - Str  - required       - Any clicks not explicitly tracked will fall through to this URL
    source          - Str  - required       - Configure the app to draw information from a source.
    preview         - Bool - default: true  - If true, no event tracking will take place. Valid values: true, false

By default, all apps are served in `preview` mode. In `preview` mode, only the `username` is required to serve the app.

If you wish to enable event tracking, make sure to explicitly set `preview` to `false`.

#### Customization parameters ####

    height                 - Int  - default: 250            - Height of the widget, in pixels
    width                  - Int  - default: 300            - Width of the widget, in pixels

