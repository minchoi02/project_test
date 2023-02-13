<<<<<<< HEAD
package kr.co.o2i.controller.user;

import java.io.File;
import java.io.FileInputStream;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;


public class BtsFireBase {

 
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        initialize();


        try {
            //삽입 
            //BtsVideoVO btsVideoVO = new BtsVideoVO();
            //btsVideoVO.setAge(1);
            //btsVideoVO.setId("test");
            //btsVideoVO.setName("testName");
            //btsVideoVO.setTel("010-1234-1234");
            //insertMember(btsVideoVO);

            //호출
            getMemberDetail("test");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void initialize() {

        try {
            String path = BtsFireBase.class.getResource("").getPath();
            FileInputStream serviceAccount = new FileInputStream(path+"serviceAccountKey.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                                            .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                                            .setDatabaseUrl("FireBase Console에 사용자 계정에서 가린 DataBase URL삽입")
                                            .build();
            FirebaseApp.initializeApp(options);
            System.out.println("성공");

            } catch (Exception e) {
                e.printStackTrace();
            }
    }

    public static final String COLLECTION_NAME="member";
    public static String insertMember(BtsVideoVO member) throws Exception {

           Firestore firestore = FirestoreClient.getFirestore();
           ApiFuture<WriteResult> apiFuture = firestore.collection(COLLECTION_NAME).document(member.getIdx()).set(member);

           return apiFuture.get().getUpdateTime().toString();

 

    }

 

    public static void getMemberDetail(String id) throws Exception {

        Firestore firestore = FirestoreClient.getFirestore();
        DocumentReference documentReference = firestore.collection(COLLECTION_NAME).document(id);
        ApiFuture<DocumentSnapshot> apiFuture = documentReference.get();
        DocumentSnapshot documentSnapshot = apiFuture.get();
        //System.out.println(documentSnapshot.toString());


        BtsVideoVO member = null;

        if(documentSnapshot.exists()) {

                member = documentSnapshot.toObject(BtsVideoVO.class);
                System.out.println(member.toString());
        } else {

        }

 }

 

}

=======
package kr.co.o2i.controller.user;

import java.io.File;
import java.io.FileInputStream;
import com.google.api.core.ApiFuture;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.WriteResult;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;


public class BtsFireBase {

 
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        initialize();


        try {
            //삽입 
            //BtsVideoVO btsVideoVO = new BtsVideoVO();
            //btsVideoVO.setAge(1);
            //btsVideoVO.setId("test");
            //btsVideoVO.setName("testName");
            //btsVideoVO.setTel("010-1234-1234");
            //insertMember(btsVideoVO);

            //호출
            getMemberDetail("test");

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void initialize() {

        try {
            String path = BtsFireBase.class.getResource("").getPath();
            FileInputStream serviceAccount = new FileInputStream(path+"serviceAccountKey.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                                            .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                                            .setDatabaseUrl("FireBase Console에 사용자 계정에서 가린 DataBase URL삽입")
                                            .build();
            FirebaseApp.initializeApp(options);
            System.out.println("성공");

            } catch (Exception e) {
                e.printStackTrace();
            }
    }

    public static final String COLLECTION_NAME="member";
    public static String insertMember(BtsVideoVO member) throws Exception {

           Firestore firestore = FirestoreClient.getFirestore();
           ApiFuture<WriteResult> apiFuture = firestore.collection(COLLECTION_NAME).document(member.getIdx()).set(member);

           return apiFuture.get().getUpdateTime().toString();

 

    }

 

    public static void getMemberDetail(String id) throws Exception {

        Firestore firestore = FirestoreClient.getFirestore();
        DocumentReference documentReference = firestore.collection(COLLECTION_NAME).document(id);
        ApiFuture<DocumentSnapshot> apiFuture = documentReference.get();
        DocumentSnapshot documentSnapshot = apiFuture.get();
        //System.out.println(documentSnapshot.toString());


        BtsVideoVO member = null;

        if(documentSnapshot.exists()) {

                member = documentSnapshot.toObject(BtsVideoVO.class);
                System.out.println(member.toString());
        } else {

        }

 }

 

}

>>>>>>> refs/heads/202204
