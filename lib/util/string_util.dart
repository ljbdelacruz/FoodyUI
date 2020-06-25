

class StringUtil {
  static String stringWithHellip(String text, int limit){
    if(limit == null){
      return text;
    }
    if(text.length > limit){
      return text=text.substring(0,limit)+"...";
    }
    return text;
  }
}