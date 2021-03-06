/**
 * 
 */
package com.baeldung.spring.dao;

import com.baeldung.spring.entity.JobApplication;
import com.baeldung.spring.entity.JobPosting;
import com.baeldung.spring.entity.JobSeeker;

/**
 * @author amayd
 *
 */
public interface JobApplicationDao {

	/**
	 * @param jobAppId
	 * @return True if the application was successfully cancelled
	 */
	boolean cancel(int jobAppId);

	/**
	 * @param jobseekerId
	 * @param jobId
	 * @param resumeFlag
	 * @param resumePath
	 * @return The newly created job application
	 */
	JobApplication apply(int jobseekerId, int jobId, boolean resumeFlag, String resumePath);
        
        void save(JobApplication jobApplication);

	/**
	 * @param jobAppId
	 * @return Required job application
	 */
	JobApplication getJobApplication(int jobAppId);
        
        
        JobApplication getApplicationBySeekerAndId(JobSeeker seeker, JobPosting jobId);

	/**
	 * @param state
	 * @return Modified job application
	 */
	JobApplication modifyJobApplicationStatus(int jobAppId, int state);
	
	/**
	 * @param ja
	 * @return Updated job application
	 */
	JobApplication updateApplication(JobApplication ja);

}
