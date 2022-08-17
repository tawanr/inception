<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'inception' );

/** Database password */
define( 'DB_PASSWORD', 'inception' );

/** Database hostname */
define( 'DB_HOST', '172.17.0.3' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_general_ci' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '+Ey :S3}di|RyfP{SNt+lM#Yf)=yy|-A^Df@>S[Q,63Ow`y51`BE%^OApo~}<q:K' );
define( 'SECURE_AUTH_KEY',   '*z!Jks6~bcBJRaQn[D3hYwL76hnvG#M<[l}53.Kt(&BU9=3PTH?Ix/9FZhtz#*n!' );
define( 'LOGGED_IN_KEY',     '6g7{Vd*kb?@on(T&2Xns]E*>b;;Ld)|z5^jj5]nHj3y<i.yS*%b>QgV8ogIf00xt' );
define( 'NONCE_KEY',         'q%qG#CqhqYnqa)(?6,$u[&&6OhLOYiL`CC34&4,Bl`zg,l8ee1SLrUJ[TBk&SJIB' );
define( 'AUTH_SALT',         '?t_A&ldqTL#7Pxv`R}&K9SAen40WX2IqzVN38DVtY+sMy5E0x$|+d4p.ii.Xh~1y' );
define( 'SECURE_AUTH_SALT',  '-h~Z_*[yi}8m&VRl $DP|R7kGr9cUCDR%g0e~v^ph+R92K7I1cJ-Jko_Utj|85,<' );
define( 'LOGGED_IN_SALT',    'l2=*xX=T$*GslaCJ QVVFXKm]8>@-A6yHwPw#:gG?Ap-!poeYM>d:Shw(rF2^Jse' );
define( 'NONCE_SALT',        '9>?.7sQDg(=a1ouTbbyB<LKQd=6X,t2s1 YpVCMtgJggyNr<m_<qSv->w}wrx$LC' );
define( 'WP_CACHE_KEY_SALT', '}^J%<G!)iX%CfZ|P3Vm&41dt9jI9h!%|kj,=:n=q%xUxY91qF=G#y5[(?!$+wD~ ' );


/**#@-*/

/**
 * WordPress database table prefix.
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


/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

define('WP_HOME','http://tratanat.42.fr');
define('WP_SITEURL','http://tratanat.42.fr');
