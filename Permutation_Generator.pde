class Permutation_Generator {
    private int[] array;
    private int firstNum;
    private boolean firstReady = false;
 
    public Permutation_Generator(int n, int firstNum_) {
        if (n < 1) {
            throw new IllegalArgumentException("The n must be min. 1");
        }
        firstNum = firstNum_;
        array = new int[n];
        reset();
    }
 
    public void reset() {
        for (int i = 0; i < array.length; i++) {
            array[i] = i + firstNum;
        }
        firstReady = false;
    }
 
    public boolean hasMore() {
        boolean end = firstReady;
        for (int i = 1; i < array.length; i++) {
            end = end && array[i] < array[i-1];
        }
        return !end;
    }
 
    public int[] getNext() {
 
        if (!firstReady) {
            firstReady = true;
            return array;
        }
 
        int temp;
        int j = array.length - 2;
        int k = array.length - 1;
 
        for (;array[j] > array[j+1]; j--);
        for (;array[j] > array[k]; k--);

        temp = array[k];
        array[k] = array[j];
        array[j] = temp;
 
        int r = array.length - 1;
        int s = j + 1;
 
        while (r > s) {
            temp = array[s];
            array[s++] = array[r];
            array[r--] = temp;
        }
 
        return array;
    } 

} 
