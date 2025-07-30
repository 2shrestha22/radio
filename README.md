# Radio NP

<img src="assets/images/radio-np.png" width="120">

Radio NP is a free and open source online radio app that provides access to all Nepali radio stations with a convenient favorite feature to save your preferred stations.

[![GitHub Release](https://img.shields.io/github/v/release/2shrestha22/radio)](https://github.com/2shrestha22/radio/releases/latest)

[<img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
    alt="Get it on Google Play"
    height="80">](https://play.google.com/store/apps/details?id=np.com.sargam.radio)

iOS? Apple does not allow streaming apps unless I obtain written permission from each station, which is literally impossible for me

## Screenshots

<img src="screenshots/screenshot1.png" width="300"> <img src="screenshots/screenshot2.png" width="300">

## Development

1. **Clone the repository**
   ```sh
   git clone https://github.com/2shrestha22/radio.git
   cd radio
   fluter run
   ```

## Radio Stations

Some radio stations are available with https connection and some don't. For mobile app both http and https connections can play well. But for web only https connection is allowed. So http radio station will not work in web.

Note: When updating `radio_list.json` pick either http or https url which works on mobile device since browser always going to use https anyway.
