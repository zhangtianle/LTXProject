package ltx.bg.support;

public class SavePathCount {
	public static int index=0;
	public static void addSavePath(){
		index++;
	}
	public static int getIndex(){
		return index;
	}
	public static void resetIndex(){
		index=0;
	}
	
}
