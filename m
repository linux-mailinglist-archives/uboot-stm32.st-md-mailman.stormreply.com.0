Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C99594589DA
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Nov 2021 08:31:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90D95C5A4FD;
	Mon, 22 Nov 2021 07:31:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE00DC597BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 07:31:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM3kNra013732;
 Mon, 22 Nov 2021 08:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QxqvS3vhE96ceuD2bDDpjcKGzWaqslRvjNfKCdCyDvA=;
 b=iSzh7t9U1J9Gp3yoTsTKWMpEEFo9vizwHRh2nU1VN7kg9hTbf8yQZh5spVpA2KgMlgcs
 R+ulm6ldsUdt5gCa3hu4/6IhPV1TpABiLSUvVFfB+2haVexk+ig3pvE7jZVOuWc9CJbs
 fIn5W45c55736fiurQUmEey4E48f+BPYBF5078CObeTwFjrQD/igq1kQl1TvSC0SeFbJ
 nBfzP3F07VuX6EAs1m4IXntIhTrSgMsuunVNJZ4QALrzwk0eeFBQfb/IypH5SGmXOevm
 PBagH+uZrPhzTZ6JqDsXnxXPPkFLNnXW9wrTmcoMEeEyDHELJXd5PwYBrUYJh7gQn4TE cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cfjepuw1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 08:31:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D1B710002A;
 Mon, 22 Nov 2021 08:31:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54D182171D2;
 Mon, 22 Nov 2021 08:31:16 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 22 Nov
 2021 08:31:15 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211115153223.563377-1-patrick.delaunay@foss.st.com>
 <20211115163155.4.I1fdc777bed680de1bea00b4d1eea43fd75a66e42@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <0b5c2dfd-bc93-9202-392b-08fd93fb0e2b@foss.st.com>
Date: Mon, 22 Nov 2021 08:31:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211115163155.4.I1fdc777bed680de1bea00b4d1eea43fd75a66e42@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 4/7] video: Add video_is_active function
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Patrick

On 11/15/21 4:32 PM, Patrick Delaunay wrote:
> Add the helper function video_is_active() to test if one video device
> is active.
> 
> This function can be used in board code to execute operation
> only when the display is probed / really used.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/video/video-uclass.c | 14 ++++++++++++++
>  include/video.h              |  7 +++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/video/video-uclass.c b/drivers/video/video-uclass.c
> index 9f8cf6ef2a..43ebb3c565 100644
> --- a/drivers/video/video-uclass.c
> +++ b/drivers/video/video-uclass.c
> @@ -228,6 +228,20 @@ void video_sync_all(void)
>  	}
>  }
>  
> +bool video_is_active(void)
> +{
> +	struct udevice *dev;
> +
> +	for (uclass_find_first_device(UCLASS_VIDEO, &dev);
> +	     dev;
> +	     uclass_find_next_device(&dev)) {
> +		if (device_active(dev))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  int video_get_xsize(struct udevice *dev)
>  {
>  	struct video_priv *priv = dev_get_uclass_priv(dev);
> diff --git a/include/video.h b/include/video.h
> index f14fb15f84..5ac1387a39 100644
> --- a/include/video.h
> +++ b/include/video.h
> @@ -276,6 +276,13 @@ static inline int video_sync_copy_all(struct udevice *dev)
>  
>  #endif
>  
> +/**
> + * video_is_active() - Test if one video device it active
> + *
> + * @return true if at least one video device is active, else false.
> + */
> +bool video_is_active(void);
> +
>  #ifndef CONFIG_DM_VIDEO
>  
>  /* Video functions */
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
