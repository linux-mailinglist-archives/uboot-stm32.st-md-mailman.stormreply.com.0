Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E4294BE3
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:43:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 860BAC3FAE0;
	Wed, 21 Oct 2020 11:43:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C2AEC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:43:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBfne9020065; Wed, 21 Oct 2020 13:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=eFS+E07UQ7DxTPxuANdrJ5Ufb+QVpWaNxZzokIazmsc=;
 b=G7MRBGlZ1Qk/6xKeopn9JpmIBqx50KCKwYTJa6RQAfTwFU29lA6SCFi9gXbrjAih9CyY
 kDyOh0fyju6JeyZRYveKDWoW6vCo3+2piI9HLIZ5WoThtseAIzZh+4OkiZ7OVnmqgVq+
 Fws7vAFUSUCbegAoNIOSIO8HYupbnEe0C1PmP4/Oz1Q/CulixnYkvf+k7RuRw6BfAzOj
 HYIrhr5O3byqlhvUBFlpFhPmF4Wa43dWz3xg+MJpFRM7lyZbs7wxKYSoo8sq3RqgOKR/
 Cj28wyyfMuZmPr7NQdWeXVG9ECpZqL4ks5guDanBhZHpJ3FXBkZMBC9Ed1+MYgVvG+do Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qgga9ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:43:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D17EF10002A;
 Wed, 21 Oct 2020 13:43:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C724E2DC342;
 Wed, 21 Oct 2020 13:43:50 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:43:50 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:43:50 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/3] remoteproc: stm32: update error management in
 stm32_copro_start
Thread-Index: AQHWovNExNKPk7IU9ECXRUHXtTcZ46mh13GA
Date: Wed, 21 Oct 2020 11:43:50 +0000
Message-ID: <70f5b281-fe15-7314-6624-7e6228cfa8c2@st.com>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
 <20201015150101.3.If11081706d310a6eb7ed2ba30291bdd20e74927b@changeid>
In-Reply-To: <20201015150101.3.If11081706d310a6eb7ed2ba30291bdd20e74927b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <BE29FED903924E449703B0F3F0E4A020@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] remoteproc: stm32: update error
 management in stm32_copro_start
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

On 10/15/20 3:01 PM, Patrick Delaunay wrote:
> The coprocessor is running as soon as the hold boot is de-asserted.
>
> So indicate this running state and save the resource table even
> if the protective assert, to avoid autonomous reboot, is failed.
>
> This error case should never occurs.
>
>
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/remoteproc/stm32_copro.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
> index da678cb329..dc87cb794e 100644
> --- a/drivers/remoteproc/stm32_copro.c
> +++ b/drivers/remoteproc/stm32_copro.c
> @@ -139,19 +139,18 @@ static int stm32_copro_start(struct udevice *dev)
>  
>  	/*
>  	 * Once copro running, reset hold boot flag to avoid copro
> -	 * rebooting autonomously
> +	 * rebooting autonomously (error should never occur)
>  	 */
>  	ret = reset_assert(&priv->hold_boot);
>  	if (ret)
>  		dev_err(dev, "Unable to assert hold boot (ret=%d)\n", ret);
>  
> -	writel(ret ? TAMP_COPRO_STATE_OFF : TAMP_COPRO_STATE_CRUN,
> -	       TAMP_COPRO_STATE);
> -	if (!ret)
> -		/* Store rsc_address in bkp register */
> -		writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
> +	/* indicates that copro is running */
> +	writel(TAMP_COPRO_STATE_CRUN, TAMP_COPRO_STATE);
> +	/* Store rsc_address in bkp register */
> +	writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  /**

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
