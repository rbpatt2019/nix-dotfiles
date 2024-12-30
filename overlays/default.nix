_: {
  # This one brings our custom packages from the 'pkgs' directory
  default =
    final: _prev:
    import ../pkgs {
      pkgs = final;
    };
}
