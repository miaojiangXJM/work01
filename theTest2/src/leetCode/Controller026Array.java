package leetCode;

import org.junit.jupiter.api.Test;

public class Controller026Array {
/*删除重复项*/
	@Test
	public void deleteSS() {
		int[] nums = new int[]{1,1,2,3,3,3,4};
		int a = 0;
		for(int i = 1;i<nums.length;i++) {
			if(nums[a]!=nums[i]) {
				a++;
				nums[a]=nums[i];
			}
		}
		System.out.println(a+1);
	}
}
