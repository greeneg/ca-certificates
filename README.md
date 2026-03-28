# ca-certificates - Utilities for system wide CA certificate installation

The update-ca-certificates command and its plugins are intended to keep the certificate stores of various components in sync with the system CA certificates.

The canonical source of CA certificates is normally managed by `p11-kit`. By default `p11-kit` looks in /usr/share/pki/trust/ and /etc/pki/trust/ for root trust certificate anchors, however there could be other plugins that serve as source for certificates as well.

## Supported Certificate Stores

The update-ca-certificates command supports a number of legacy certificate stores for applications that don't integrate with `p11-kit` directly yet. It does so by generating the certificate stores in /var/lib/ca-certificates and generating filesystem symbolic links in the locations where applications expect those files to exist.

- `/etc/ssl/certs`: Hashed directory readable by OpenSSL. Only for legacy applications. Only contains CA certificates for server identification purposes. Avoid using this within new applications.
- `/etc/ssl/ca-bundle.pem`: Concatenated bundle of CA certificates for server identification purposes. Avoid using this in new applications.
- java-cacerts: Key store fore Java. Only filled with CA certificates with purpose server identification.
- openssl: hashed directory with CA certificates of all purposes. Your system openSSL knows how to read that, don't hardcode the path! Call `SSL_CTX_set_default_verify_paths()` instead within your application.

## Plugins

This version of the update-ca-certificates command uses plugins instead of shell "hooks". These plugins take JSON data in via `stdin` for configuration information. The JSON structure is shown below as an example:

```json
{
  "verbose": true,
  "fresh": false,
  "root": "/",
  "statedir": "var/lib/ca-certificates"
}
```

All plugins send their output to log files in `/var/log/update-ca-certificates` and to the host's syslog facility.

## Differences between MidgardOS and openSUSE

- Rewritten in Golang for better performance.
- Hooks are all reworked as plugin executables that use JSON to pass configuration data.
- Packages are expected to install their CA certificates in `/usr/share/pki/trust/anchors` or `/usr/share/pki/trust` (no extra subdir) instead of the deprecated `/usr/share/ca-certificates/<vendor>` now. The anchors subdirectory is for regular pem files, the directory one above for pem files in openssl's 'trusted' format.
- The older configuration file from Debian, `/etc/ca-certificates.conf` is no longer supported. To block the use of certificates you don't want to use, create a filesystem symbplic link to the certificates you don't want in `/etc/pki/trust/blocklist`.

## Differences to Debian

- The `/etc/ca-certificates.conf` configuration file is not supported.
- Plugins don't receive the list of changed certificates on `stdin`, as it is now used to pass configuration data to the plugin.
- The command line arguments are passed as JSON data to the plugin at execution time.
- All stores are created via plugins.
