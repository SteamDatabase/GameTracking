#!/usr/bin/php
<?php
if( count( $argv ) !== 2 || !file_exists( $argv[ 1 ] ) )
{
	exit( 'Input file required' . PHP_EOL );
}

$fileName = $argv[ 1 ];

$file = fopen( $fileName, 'r' ) or exit( 'Unable to open file for reading' . PHP_EOL );
$text = fread( $file, 4 );
fclose( $file );

// detect and convert utf-16, utf-32 and convert to utf8
if      ($text               == "\x00\x00\xFE\xFF") convertFile( 'UTF-32BE' );
else if ($text               == "\xFF\xFE\x00\x00") convertFile( 'UTF-32LE' );
else if (substr($text, 0, 2) == "\xFE\xFF")         convertFile( 'UTF-16BE' );
else if (substr($text, 0, 2) == "\xFF\xFE")         convertFile( 'UTF-16LE' );

function convertFile( $encoding )
{
	global $fileName;
	
	echo ' > ' . $encoding . ' - ' . $fileName . PHP_EOL;
	
	$text = file_get_contents( $fileName );
	$text = mb_convert_encoding( $text, 'UTF-8', $encoding );
	$text = preg_replace( '/^[\xef\xbb\xbf\xff\xfe\xfe\xff]*/', '', $text );
	$text = trim( $text ) . PHP_EOL;
	
	file_put_contents( $fileName, $text );
}
