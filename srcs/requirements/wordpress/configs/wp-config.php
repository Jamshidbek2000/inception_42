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
define( 'DB_NAME', '${DB_NAME}' );

/** MySQL database username */
define( 'DB_USER', '${DB_USER}' );

/** MySQL database password */
define( 'DB_PASSWORD', '${DB_USER_PWD}' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE',  '');

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
define('AUTH_KEY',         'Qy]Qf_$^r%5X(/t3@In0O^cU|+g(3VCVv$4bgNr~r2ji0(>kQj17_N*(p~ITFu1x');
define('SECURE_AUTH_KEY',  ';*)^/&>+BWy8S,Xf=}Ib}E<eSBx12u5L5|5_V`AGo0;;W^^s]v!#*+2]/yB0WcQ+');
define('LOGGED_IN_KEY',    '/HAJ1Rr,Qa,.#+4*]?Ow,Mo#aScbz.OQw`Gv5^rynRQF.VH`H)]4L2)-|%4U6UFQ');
define('NONCE_KEY',        '(XV2l0|1rqSNJyD!cfdNuR/u=F/Ddgz+kEF31(`U*b;EM@WCoTfk=Nt>a 9WzKZ;');
define('AUTH_SALT',        'j?E+Q@Uo[L!/pw0;VWW^]:UA-$~_HMV_sK+X C*4/tn|!C1 )T|JGWd,Q`#<euu@');
define('SECURE_AUTH_SALT', 'Ic4J|I*tPtqy`w9H!-6!g|k&P1dw.vSM`;AkCF[td+]:&-RbfuZgUv%j6-x(o4vy');
define('LOGGED_IN_SALT',   ']KP=%.)v`WvBZ&VGxJ62D4al%5/{Uq>lHz1kHO>QA6h4p]5U13vh$:$)J2 2 |qW');
define('NONCE_SALT',       'O+]&Y*38[S-K/J}K#6N. pg=-bs+Sl#WqBT!J7q>BN8q@wx%d>AZ`+c?,aGnfA<h');


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
