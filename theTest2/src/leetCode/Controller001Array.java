package leetCode;

import java.util.Arrays;

import org.junit.jupiter.api.Test;

public class Controller001Array {
	
	/*两数之和，给定数组和返回值进行判断*/
	@Test
	public void LiangShuZhiHe() {
		int[] nums = new int[]{2,7,11,15}; 
		int target = 9;
		for(int i = 0;i<nums.length;i++) {
			for(int j = i+1;j<nums.length;j++) {
				if(nums[i] + nums[j] == target) {
					System.out.println(Arrays.toString(new int[]{i,j}));
				}
			}
		}
	}
}