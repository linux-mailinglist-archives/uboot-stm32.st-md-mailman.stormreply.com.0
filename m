Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF4643E20
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:11:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1D77C65E70;
	Tue,  6 Dec 2022 08:11:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2AE9C65E6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:11:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63I0IO013733; Tue, 6 Dec 2022 09:11:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5VHpuKSdLEIbsHOdGO0AZp820qqqkq5XFHp6EqcJ9YQ=;
 b=x4WCYQQHZuEmT1AVr07hHew4/zeo0Udkzq8mOKjF92/Ku29c7qJSWml0qT3Cz61CBdje
 f+HvUT+nWlXUWTPfTQ/bND1/zJAdzxIeWy/VmAd4vr5XExKOHU4jUjciStXAa2j79vEX
 NTmTCHQFb5PxIIKX0JEg2tEsGwtnNRqKzl6WpYr8jT30I4rf+OlwjxqOq+y3S94kPeba
 roRHej7cBoqeTHvgp450aH+k3uilQ4wN03aw1KsCisSScy03rwFQZpnvgfxgISA0X3pq
 gSDAXQYiwlGJ+afPY+/k8C0xwn2l4298tQinmou0cNtXt2zqS9Y4Q2G8AZhP2GQkUivy hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vrqyc0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:11:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C958210002A;
 Tue,  6 Dec 2022 09:11:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2FC42132F6;
 Tue,  6 Dec 2022 09:11:15 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:11:15 +0100
Message-ID: <8c16860d-62b3-c7cd-962e-24e8577e93ab@foss.st.com>
Date: Tue, 6 Dec 2022 09:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.2.Ibde60f29e81b2baef260ec8dd3876281e6a60456@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.2.Ibde60f29e81b2baef260ec8dd3876281e6a60456@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/8] env: mcc: Drop unnecessary #ifdefs
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



On 11/10/22 11:48, Patrick Delaunay wrote:
> This file has a lot of conditional code and much of it is unnecessary.
> Clean this up to reduce the number of build combinations.
> 
> This patch replaces the test on CONFIG_ENV_OFFSET_REDUND for the
> more coherent CONFIG_SYS_REDUNDAND_ENVIRONMENT.
> 
> This patch also corrects a compilation issue in init_mmc_for_env()
> when CONFIG_SYS_MMC_ENV_PART is not activated, env_mmc_orig_hwpart is
> not defined.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 120 +++++++++++++++++++++++++++++-------------------------
>  1 file changed, 64 insertions(+), 56 deletions(-)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index 42bcf7e775cc..b36bd9ad77ee 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -46,7 +46,7 @@ DECLARE_GLOBAL_DATA_PTR;
>  #if (defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT) && \
>       (CONFIG_SYS_MMC_ENV_PART == 1) && \
>       (CONFIG_ENV_OFFSET == CONFIG_ENV_OFFSET_REDUND))
> -#define ENV_MMC_HWPART_REDUND
> +#define ENV_MMC_HWPART_REDUND	1
>  #endif
>  
>  #if CONFIG_IS_ENABLED(OF_CONTROL)
> @@ -108,12 +108,11 @@ static inline s64 mmc_offset(int copy)
>  	defvalue = ENV_MMC_OFFSET;
>  	propname = dt_prop.offset;
>  
> -#if defined(CONFIG_ENV_OFFSET_REDUND)
> -	if (copy) {
> +	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT) && copy) {
>  		defvalue = ENV_MMC_OFFSET_REDUND;
>  		propname = dt_prop.offset_redund;
>  	}
> -#endif
> +
>  	return ofnode_conf_read_int(propname, defvalue);
>  }
>  #else
> @@ -121,10 +120,9 @@ static inline s64 mmc_offset(int copy)
>  {
>  	s64 offset = ENV_MMC_OFFSET;
>  
> -#if defined(CONFIG_ENV_OFFSET_REDUND)
> -	if (copy)
> +	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT) && copy)
>  		offset = ENV_MMC_OFFSET_REDUND;
> -#endif
> +
>  	return offset;
>  }
>  #endif
> @@ -165,8 +163,24 @@ static int mmc_set_env_part(struct mmc *mmc, uint part)
>  
>  	return ret;
>  }
> +
> +static bool mmc_set_env_part_init(struct mmc *mmc)
> +{
> +	env_mmc_orig_hwpart = mmc_get_blk_desc(mmc)->hwpart;
> +	if (mmc_set_env_part(mmc, mmc_get_env_part(mmc)))
> +		return false;
> +
> +	return true;
> +}
> +
> +static int mmc_set_env_part_restore(struct mmc *mmc)
> +{
> +	return mmc_set_env_part(mmc, env_mmc_orig_hwpart);
> +}
>  #else
>  static inline int mmc_set_env_part(struct mmc *mmc, uint part) {return 0; };
> +static bool mmc_set_env_part_init(struct mmc *mmc) {return true; }
> +static inline int mmc_set_env_part_restore(struct mmc *mmc) {return 0; };
>  #endif
>  
>  static const char *init_mmc_for_env(struct mmc *mmc)
> @@ -183,8 +197,7 @@ static const char *init_mmc_for_env(struct mmc *mmc)
>  	if (mmc_init(mmc))
>  		return "MMC init failed";
>  #endif
> -	env_mmc_orig_hwpart = mmc_get_blk_desc(mmc)->hwpart;
> -	if (mmc_set_env_part(mmc, mmc_get_env_part(mmc)))
> +	if (!mmc_set_env_part_init(mmc))
>  		return "MMC partition switch failed";
>  
>  	return NULL;
> @@ -192,11 +205,7 @@ static const char *init_mmc_for_env(struct mmc *mmc)
>  
>  static void fini_mmc_for_env(struct mmc *mmc)
>  {
> -#ifdef CONFIG_SYS_MMC_ENV_PART
> -	int dev = mmc_get_env_dev();
> -
> -	blk_select_hwpart_devnum(UCLASS_MMC, dev, env_mmc_orig_hwpart);
> -#endif
> +	mmc_set_env_part_restore(mmc);
>  }
>  
>  #if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_SPL_BUILD)
> @@ -233,21 +242,20 @@ static int env_mmc_save(void)
>  	if (ret)
>  		goto fini;
>  
> -#ifdef CONFIG_ENV_OFFSET_REDUND
> -	if (gd->env_valid == ENV_VALID)
> -		copy = 1;
> -
> -#ifdef ENV_MMC_HWPART_REDUND
> -	ret = mmc_set_env_part(mmc, copy + 1);
> -	if (ret)
> -		goto fini;
> -#endif
> +	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT)) {
> +		if (gd->env_valid == ENV_VALID)
> +			copy = 1;
>  
> -#endif
> +		if (IS_ENABLED(ENV_MMC_HWPART_REDUND)) {
> +			ret = mmc_set_env_part(mmc, copy + 1);
> +			if (ret)
> +				goto fini;
> +		}
>  
> -	if (mmc_get_env_addr(mmc, copy, &offset)) {
> -		ret = 1;
> -		goto fini;
> +		if (mmc_get_env_addr(mmc, copy, &offset)) {
> +			ret = 1;
> +			goto fini;
> +		}
>  	}
>  
>  	printf("Writing to %sMMC(%d)... ", copy ? "redundant " : "", dev);
> @@ -259,12 +267,12 @@ static int env_mmc_save(void)
>  
>  	ret = 0;
>  
> -#ifdef CONFIG_ENV_OFFSET_REDUND
> -	gd->env_valid = gd->env_valid == ENV_REDUND ? ENV_VALID : ENV_REDUND;
> -#endif
> +	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT))
> +		gd->env_valid = gd->env_valid == ENV_REDUND ? ENV_VALID : ENV_REDUND;
>  
>  fini:
>  	fini_mmc_for_env(mmc);
> +
>  	return ret;
>  }
>  
> @@ -308,22 +316,22 @@ static int env_mmc_erase(void)
>  	printf("\n");
>  	ret = erase_env(mmc, CONFIG_ENV_SIZE, offset);
>  
> -#ifdef CONFIG_ENV_OFFSET_REDUND
> -	copy = 1;
> +	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT)) {
> +		copy = 1;
>  
> -#ifdef ENV_MMC_HWPART_REDUND
> -	ret = mmc_set_env_part(mmc, copy + 1);
> -	if (ret)
> -		goto fini;
> -#endif
> +		if (IS_ENABLED(ENV_MMC_HWPART_REDUND)) {
> +			ret = mmc_set_env_part(mmc, copy + 1);
> +			if (ret)
> +				goto fini;
> +		}
>  
> -	if (mmc_get_env_addr(mmc, copy, &offset)) {
> -		ret = CMD_RET_FAILURE;
> -		goto fini;
> -	}
> +		if (mmc_get_env_addr(mmc, copy, &offset)) {
> +			ret = CMD_RET_FAILURE;
> +			goto fini;
> +		}
>  
> -	ret |= erase_env(mmc, CONFIG_ENV_SIZE, offset);
> -#endif
> +		ret |= erase_env(mmc, CONFIG_ENV_SIZE, offset);
> +	}
>  
>  fini:
>  	fini_mmc_for_env(mmc);
> @@ -345,7 +353,7 @@ static inline int read_env(struct mmc *mmc, unsigned long size,
>  	return (n == blk_cnt) ? 0 : -1;
>  }
>  
> -#ifdef CONFIG_ENV_OFFSET_REDUND
> +#if defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
>  static int env_mmc_load(void)
>  {
>  #if !defined(ENV_IS_EMBEDDED)
> @@ -375,19 +383,19 @@ static int env_mmc_load(void)
>  		goto fini;
>  	}
>  
> -#ifdef ENV_MMC_HWPART_REDUND
> -	ret = mmc_set_env_part(mmc, 1);
> -	if (ret)
> -		goto fini;
> -#endif
> +	if (IS_ENABLED(ENV_MMC_HWPART_REDUND)) {
> +		ret = mmc_set_env_part(mmc, 1);
> +		if (ret)
> +			goto fini;
> +	}
>  
>  	read1_fail = read_env(mmc, CONFIG_ENV_SIZE, offset1, tmp_env1);
>  
> -#ifdef ENV_MMC_HWPART_REDUND
> -	ret = mmc_set_env_part(mmc, 2);
> -	if (ret)
> -		goto fini;
> -#endif
> +	if (IS_ENABLED(ENV_MMC_HWPART_REDUND)) {
> +		ret = mmc_set_env_part(mmc, 2);
> +		if (ret)
> +			goto fini;
> +	}
>  
>  	read2_fail = read_env(mmc, CONFIG_ENV_SIZE, offset2, tmp_env2);
>  
> @@ -403,7 +411,7 @@ err:
>  #endif
>  	return ret;
>  }
> -#else /* ! CONFIG_ENV_OFFSET_REDUND */
> +#else /* ! CONFIG_SYS_REDUNDAND_ENVIRONMENT */
>  static int env_mmc_load(void)
>  {
>  #if !defined(ENV_IS_EMBEDDED)
> @@ -448,7 +456,7 @@ err:
>  #endif
>  	return ret;
>  }
> -#endif /* CONFIG_ENV_OFFSET_REDUND */
> +#endif /* CONFIG_SYS_REDUNDAND_ENVIRONMENT */
>  
>  U_BOOT_ENV_LOCATION(mmc) = {
>  	.location	= ENVL_MMC,

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
