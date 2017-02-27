public long Stopp(System.Diagnostics.Stopwatch watch,
  string messwert, int lauf)
{
  watch.Stop();
  var elapsedMs = watch.ElapsedMilliseconds;
  string dateiname = speicherort;
  string neueZeile = messwert + ": " + elapsedMs + ", "
    + lauf + "\r\n";
  Append(dateiname, neueZeile);
  return elapsedMs;
}
