package net.birdirbir.admobrewarded;

import org.appcelerator.kroll.KrollDict;
import org.appcelerator.kroll.KrollProxy;
import org.appcelerator.kroll.annotations.Kroll;
import org.appcelerator.kroll.common.Log;

import android.content.Context;

import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.ads.reward.RewardedVideoAd;
import com.google.android.gms.ads.reward.RewardedVideoAdListener;

@Kroll.proxy
public class RewardedVideoProxy extends KrollProxy implements
		RewardedVideoAdListener {

	private RewardedVideoAd ad;
	private String adUnitID;
	private Context context;

	public void onRewarded(RewardItem item) {
		Log.d(AdmobrewardedModule.LCAT, "onRewarded()");
		KrollDict dict = new KrollDict();
		dict.put("rewardAmount", item.getAmount());
		dict.put("rewardType", item.getType());
		this.fireEvent(AdmobrewardedModule.AD_REWARDED, dict);
	}

	public void onRewardedVideoAdClosed() {
		Log.d(AdmobrewardedModule.LCAT, "onRewardedVideoAdClosed()");
		this.fireEvent(AdmobrewardedModule.AD_REWARDED_VIDEO_AD_CLOSED,
				new KrollDict());
	}

	public void onRewardedVideoAdFailedToLoad(int errorCode) {
		Log.d(AdmobrewardedModule.LCAT, "onRewardedVideoAdFailedToLoad()");
		KrollDict dict = new KrollDict();
		dict.put("errorCode", errorCode);
		this.fireEvent(AdmobrewardedModule.AD_REWARDED_VIDEO_FAILED_TO_LOAD,
				dict);
	}

	public void onRewardedVideoAdLeftApplication() {
		Log.d(AdmobrewardedModule.LCAT, "onRewardedVideoAdLeftApplication()");
		this.fireEvent(AdmobrewardedModule.AD_REWARDED_VIDEO_LEFT_APPLICATION,
				new KrollDict());
	}

	public void onRewardedVideoAdLoaded() {
		Log.d(AdmobrewardedModule.LCAT, "onRewardedVideoAdLoaded()");
		this.fireEvent(AdmobrewardedModule.AD_REWARDED_VIDEO_AD_LOADED,
				new KrollDict());
	}

	public void onRewardedVideoAdOpened() {
		Log.d(AdmobrewardedModule.LCAT, "onRewardedVideoAdOpened()");
		this.fireEvent(AdmobrewardedModule.AD_REWARDED_VIDEO_AD_OPENED,
				new KrollDict());
	}

	public void onRewardedVideoStarted() {
		Log.d(AdmobrewardedModule.LCAT, "onRewardedVideoStarted()");
		this.fireEvent(AdmobrewardedModule.AD_REWARDED_VIDEO_STARTED,
				new KrollDict());
	}

	public void setAd(RewardedVideoAd ad) {
		this.ad = ad;
	}

	public RewardedVideoAd getAd() {
		return this.ad;
	}

	public void setAdUnitId(String adUnitID) {
		this.adUnitID = adUnitID;
	}

	public String getAdUnitId() {
		return this.adUnitID;
	}

	public void setContext(Context context) {
		this.context = context;
	}

	public Context getContext() {
		return this.context;
	}

}
