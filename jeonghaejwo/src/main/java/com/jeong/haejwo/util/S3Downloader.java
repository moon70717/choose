package com.jeong.haejwo.util;

import java.io.File;
import java.text.DecimalFormat;

import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.event.ProgressEvent;
import com.amazonaws.event.ProgressListener;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.transfer.Download;
import com.amazonaws.services.s3.transfer.TransferManager;
 
public class S3Downloader {
    private AmazonS3 s3;
    private String bucketName;
    private Download download;
    private GetObjectRequest request = null;
    private static TransferManager tx;
    private double totalSize;
     
    public static void main(String[] args) {
        new S3Downloader();
    }
     
    public S3Downloader() {
         
        AWSCredentials credentials = new ProfileCredentialsProvider(".\\src\\main\\resources\\AWSCredentials.properties", "aws").getCredentials();
        s3 = new AmazonS3Client(credentials);
        Region region = Region.getRegion(Regions.AP_NORTHEAST_2);
        s3.setRegion(region);
         
        this.bucketName = "jeonghaejwo";
        this.tx = new TransferManager(s3);
         
        File file = new File("1.jpg");
        doDownload(file);
    }
 
    public void doDownload(File file) {
        // 디렉토리/디렉토리/파일명 으로 keyname을 주기위해 파일명을 제외한 디렉토리를 구한다.
        request = new GetObjectRequest(bucketName, "61ddac92b29b4377e4844a7aacbcd45abcdae8b374da03ca2e4ddd494b725304").withGeneralProgressListener(progressListener);
         
        download = this.tx.download(request, file);
        totalSize = download.getProgress().getTotalBytesToTransfer();
    }
 
    private String numberFormat(Object value) {
        DecimalFormat df = new DecimalFormat("#.##");
        return df.format( value );
    }
     
    int prevPer = -1;
    public ProgressListener progressListener = new ProgressListener() {
        double trans = 0;
        public void progressChanged(ProgressEvent progressEvent) {
            if (download == null) return;
 
            synchronized (this) {
                trans += progressEvent.getBytesTransferred();
                int currPer = (int)download.getProgress().getPercentTransferred();
                if(prevPer < currPer) {
                    System.out.println(request.getKey() + " - " + numberFormat(trans/1000) + " / " + numberFormat(totalSize/1000) + " : " + currPer + "%");
                }
                prevPer = currPer;
            }
             
            switch (progressEvent.getEventCode()) {
            case ProgressEvent.COMPLETED_EVENT_CODE:
                System.out.println("100%"); // 전송완료
                trans = 0;
                break;
            case ProgressEvent.FAILED_EVENT_CODE:
                try {
                    AmazonClientException e = download.waitForException();
                } catch (InterruptedException e) {}
                break;
            }
        }
    };
}