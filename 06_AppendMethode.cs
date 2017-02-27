public void Append(string sFilename, string sLines)
{
  StreamWriter myFile = new StreamWriter(sFilename,
    true);
  myFile.Write(sLines);
  myFile.Close();
}
