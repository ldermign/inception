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
define( 'DB_NAME', $WP_NAME );

/** MySQL database username */
define( 'DB_USER', $MYSQL_USER );

/** MySQL database password */
define( 'DB_PASSWORD', $MYSQL_USER_PSWD );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb:3306' );

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
define('AUTH_KEY',         'Xg(<+W^)SLn$6~^{umubfdcOfN}*9L*ps+Tl_-xrw~cv8wRP<-B*V^[faO#(5kp`');
define('SECURE_AUTH_KEY',  '(f-9|B1IO9XSO%8-5{zUs=r4q>cezt{?+h/&aR[$h%ge1*w]:4Cp-kb| ^U71+;&');
define('LOGGED_IN_KEY',    '+};7EU2)^gH^nMPbfg(9);0a;[SHL%.SKTr(S.[BW)rcpqGa),^Pd`TV71Ux]FC]');
define('NONCE_KEY',        '-1ZSO:PNHCo^HeiF*N[+77NX/(I7r;myIB7,?DV{MPEg|VV+}GTM78)@z_+-Oz;^');
define('AUTH_SALT',        '2s6HL]*G7bRE! +jGLy+q&rgj^[Krz)3-8YVR(CMpIa*H:f&#Q+fUjfIH&ac.w_B');
define('SECURE_AUTH_SALT', 'Ziz]8)6AgxpAcXIFwV8-C*H^djj5``z|_eqv`zVx6Fva6[vnv]L jL_oi-zsp4G$');
define('LOGGED_IN_SALT',   '.-^JhY4Tp%F:`vazAL 3Wq9/;Qm($#CjU.-JWc-o!tac5RlO:>Cog9wua#thEm_c');
define('NONCE_SALT',       '4K/9.[;n<>L+1+wQH|?VRsX)i|_-QH:y8|X)T5)oa%pK?;ABuf{a> o8W~f4lAt?');

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
