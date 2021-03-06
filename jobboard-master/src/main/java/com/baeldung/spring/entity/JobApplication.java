/**
 * 
 */
package com.baeldung.spring.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import java.util.Date;

/**
 * @author amayd
 *
 */
@Entity
@Table(name = "jobapplication")
public class JobApplication {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "appId", unique = true, nullable = false)
	private int appId;
	
	@ManyToOne
	@JoinColumn(name="jobId")
	private JobPosting jobposting;
	
	@ManyToOne
	@JoinColumn(name="jobSeekerId")
	@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class, property="jobSeekerId")
	private JobSeeker jobSeeker;
	
	@Column(name="resume")
	private boolean resume;
	
	@Column(name="resumePath")
	private String resumePath;
        
        @Column(name="shortListed")
        private Boolean shortListed;
	
	@Column(name="state")
	private int state;
	
	@Column(name="interviewFlag")
	private boolean interviewFlag;
	
	@Column(name="interviewLocation")
	private String interviewLocation;
	
	@Column(name="interviewTime")
	private Date interviewTime;
	
	@Column(name="interviewAccepted")
	private boolean interviewAccepted;
        
        private int interviewTotal;
        private int interviewResult = 0;
        private Date finishTime;

        public JobPosting getJobposting() {
            return jobposting;
        }

        public void setJobposting(JobPosting jobposting) {
            this.jobposting = jobposting;
        }

        public Date getFinishTime() {
            return finishTime;
        }

        public void setFinishTime(Date finishTime) {
            this.finishTime = finishTime;
        }

        public int getInterviewTotal() {
            return interviewTotal;
        }

        public void setInterviewTotal(int interviewTotal) {
            this.interviewTotal = interviewTotal;
        }

        public int getInterviewResult() {
            return interviewResult;
        }

        public void setInterviewResult(int interviewResult) {
            this.interviewResult = interviewResult;
        }

	/**
	 * @return Application ID
	 */
	public int getAppId() {
		return appId;
	}

	/**
	 * @param appId
	 */
	public void setAppId(int appId) {
		this.appId = appId;
	}

	/**
	 * @return Job Posting
	 */
	public JobPosting getJobPosting() {
		return jobposting;
	}

	/**
	 * @param jobPosting
	 */
	public void setJobPosting(JobPosting jobPosting) {
		this.jobposting = jobPosting;
	}

        public Boolean getShortListed() {
            return shortListed;
        }

        public void setShortListed(Boolean shortListed) {
            this.shortListed = shortListed;
        }

	/**
	 * @return JobSeeker
	 */
	@JsonProperty
	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	/**
	 * @param jobSeeker
	 */
	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	/**
	 * @return True if applied through resume
	 */
	public boolean isResume() {
		return resume;
	}

	/**
	 * @param resume
	 */
	public void setResume(boolean resume) {
		this.resume = resume;
	}

	/**
	 * @return Resume path
	 */
	public String getResumePath() {
		return resumePath;
	}

	/**
	 * @param resumePath
	 */
	public void setResumePath(String resumePath) {
		this.resumePath = resumePath;
	}

	/**
	 * @return State of the application
	 */
	public int getState() {
		return state;
	}

	/**
	 * @param state
	 */
	public void setState(int state) {
		this.state = state;
	}

	public boolean isInterviewFlag() {
		return interviewFlag;
	}

	public void setInterviewFlag(boolean interviewFlag) {
		this.interviewFlag = interviewFlag;
	}

	public String getInterviewLocation() {
		return interviewLocation;
	}

	public void setInterviewLocation(String interviewLocation) {
		this.interviewLocation = interviewLocation;
	}

	public Date getInterviewTime() {
		return interviewTime;
	}

	public void setInterviewTime(Date interviewTime) {
		this.interviewTime = interviewTime;
	}

	public boolean isInterviewAccepted() {
		return interviewAccepted;
	}

	public void setInterviewAccepted(boolean interviewAccepted) {
		this.interviewAccepted = interviewAccepted;
	}

}
