package com.mycompany.project;

import java.io.IOException;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.mapreduce.Reducer;
 
public class LongSumReducer<KEY> extends Reducer<KEY, LongWritable,
                                                 KEY,LongWritable> {
  // output parameter
  private LongWritable result = new LongWritable();
 

  // this reduce method is called for each <key, list of values> pairs in the grouped inputs
  public void reduce(KEY key, Iterable<LongWritable> values,
                     Context context) throws IOException, InterruptedException {
    long sum = 0;
    for (LongWritable val : values) {
      sum += val.get();
    }
    result.set(sum);
    context.write(key, result);
  }
 
}
