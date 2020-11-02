<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'pako' );

/** MySQL database password */
define( 'DB_PASSWORD', 'patata' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_unicode_ci' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         ' {-d(ln9TGn4074}a|Pe g6Y+9AJP3[><L#K,(BO1H^Lf(eR`eg;z_UG,:/Oed+Y');
define('SECURE_AUTH_KEY',  'B(r]0|lkAm+07tup_Wj78pNgA>|UytIJ g]^Br:A(O54;$p2[GF6I=$mtG@`zj=V');
define('LOGGED_IN_KEY',    'nDvV?+KA+9j.=6|LCT+3n^7W8p,__^hn[`O>nY bmFiFvi;cath1-S|]+0+Q(sW!');
define('NONCE_KEY',        'X^!_LRC&`P_,03h)ZGB4<-guNUo$5[~Tj7t+MB*ho/e8q^Q~)+?e.iD6.r+{lbi6');
define('AUTH_SALT',        '3oDaF*+FrTvyN|=SJq9M(5O(p1cc|l>x(FNHMM-Q4W@YsDRW1{#KsP?)EK0GFLyi');
define('SECURE_AUTH_SALT', 'i=IYO8@FZUCQR|>xEH0<Vr/0hA(>i|,/>lm(<.3$bM@Y)N$Bx}oGI+Z9Zv,sjXB/');
define('LOGGED_IN_SALT',   'NHbU]Dq!+h>|I}lg/eWsBkzticcXa^x`|il;H)AV7zv[c=Yv_~d+$yMe$1+f6SD ');
define('NONCE_SALT',       'QWu3-&p*|i O?y?|/&j~f%WZWTDypa:>>sz}YzDGO8+O+ x,@-TOBB{&UI`.pa65');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
