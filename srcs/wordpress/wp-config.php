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
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wp_pass' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '>EOW1vL0YP?.]<naT*$>gE@Ylh{=-P0AqF6-<=@{xfk1_;b~oqX{x~|X-6}xMC1{');
define('SECURE_AUTH_KEY',  'EJ]{ !Z0-E;!nwv-+?g4`O]-lsEI@|G#z+&ULbQ$)!*+byzPc1n]3c4:a3,m| D;');
define('LOGGED_IN_KEY',    'oC@sv~+He+Wbg^/9)A]vx=$u#|~ld4m<Fi!e1}|21:<j,LgO7-$|rg+l$yMUqL7K');
define('NONCE_KEY',        'HC+E-H?&bWU7ZFQHM>9--?%8D_N1+GO};r%?_m~)(p&ABNFCPHPO!V%UHo4fBPBI');
define('AUTH_SALT',        '80u2/kK!.u`*+dt45HMS>`vmju]L+D)x<GV@zO|2~/_/#|RS+x)pu+;sJij[Zw30');
define('SECURE_AUTH_SALT', 'ng[CLFO([}k=e3%B|rL2U Kbg?vW@dd.V%=L*&9|s?&u]~pI&3{R+QG;,3u.P,K]');
define('LOGGED_IN_SALT',   '2.ppjj^AoZ%A00pkX-.L}qOTBiEJ(Cx?/[q5E~2<oZ>%=Q:r1+wPflWmhc|+@:?$');
define('NONCE_SALT',       'VJ.K]dN4rejk!S$BAvxu/faC7J|ccC)^VIcSTOy:=R+WW2&H3;2~;O).{vkO|0|0');

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
