package main.java.utils;

import java.util.Arrays;
import java.util.List;

// 获取全部的条数
// 获取全部的页数

public class  PageManager<E> {
    public void setSize(int size) {
        this.size = size;
    }

    private int size= 0;//容量
        private int totalPages;  //总页数
        private int totalElements;//总元素
        private int num;//第几页  前端传过来的
        private int numberOfElements;//当前页数有多少个元素
        private List<E> results;  //页面的所有元素

        public boolean isLast() {
            return this.num==totalPages;
        }

        public List<E> getResults() {
            return results;
        }

        @Override
        public String toString() {
            return "PageManager{" +
                    "size=" + size +
                    ", totalPages=" + totalPages +
                    ", totalElements=" + totalElements +
                    ", num=" + num +
                    ", numberOfElements=" + numberOfElements +
                    ", results=" + results +
                    '}';
        }

        public void setResults(List<E> results) {
            this.results = results;
        }

        public PageManager() {
        }

        public PageManager(int size, int totalPages, int totalElements, int num, boolean first, String[] sort, int numberOfElements, List<E> results, boolean last) {
            this.size = size;
            this.totalPages = totalPages;
            this.totalElements = totalElements;
            this.num = num;
            this.numberOfElements = numberOfElements;
            this.results = results;
        }



        public int getSize() {
            return size;
        }
        public int getTotalPages() {
            return totalPages;
        }

        public int getTotalElements() {
            return totalElements;
        }

        public void setTotalElementsAndTotalPages(int totalElements) {
            this.totalElements = totalElements;
            if (totalElements % size!=0){
                this.totalPages=totalElements/size+1;
            }else {
                this.totalPages=totalElements/size;
            }
        }

        public int getNum() {
            return num;
        }
        public boolean beforeLeastFive() {
//            这一页前面是否最少有五个页面
            return this.num-1>=5;
        }

        public boolean backLeastTwo () {
//            最后是否有两页
            return totalPages-num>=2;
        }

        public void setNum(int num) {
            this.num = num;
        }

        public boolean isFirst() {
            return this.num==1;
        }




        public int getNumberOfElements() {
            return numberOfElements;
        }

        public void setNumberOfElements(int numberOfElements) {
            this.numberOfElements = numberOfElements;
        }
    }

