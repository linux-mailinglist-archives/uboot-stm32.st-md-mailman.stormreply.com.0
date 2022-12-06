Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F8643E21
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:11:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCEE3C65E6E;
	Tue,  6 Dec 2022 08:11:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE8D8C65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:11:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63HbhO016332; Tue, 6 Dec 2022 09:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Zam45Xu3AuEi0azy0xGzt0rsaHBaq8O3whWk34uKxzg=;
 b=OCgU2UcIDaMC232954Cnhaw6xxOwhr2y/6wm4ApbK/ErDfhv1oONkoXGvlLjC7ALiiIb
 bJkEJHhzp+avOBDO9VuFiWR5hpV/GYWGWbQaxRfsxUWsKD8VfveFadi3gJdxGv7/7piB
 /i5nNDc2ZaYQbx+aZXqFOt3U0DcDt/8RBfI9rp6R3Ki65Ol6fbLBvbibj5HK7wYhVrO1
 wtqNSK+0PK//OYUDrdMFQPS7cFjAfQMJqWQP27rAmQHEhgHi9r8N6Ty0rbDdy4Xnf7fw
 kEZXz7aNOerpa7Ra64yZoShLEb+zqFc02FwzUv57ccedy/N2P3iqLTtlzrkFWZhryAaJ rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7xp6y08c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:11:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F21F510002A;
 Tue,  6 Dec 2022 09:11:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4D582132F6;
 Tue,  6 Dec 2022 09:11:22 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:11:22 +0100
Message-ID: <540cd916-e4ad-f16a-19cf-d57c3c5006aa@foss.st.com>
Date: Tue, 6 Dec 2022 09:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.3.I84d2d6b84d16b3f89fad9af6bc0386252bcab206@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.3.I84d2d6b84d16b3f89fad9af6bc0386252bcab206@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/8] env: mcc: fix compilation error with
 ENV_IS_EMBEDDED
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



On 11/10/22 11:49, Patrick Delaunay wrote:
> When ENV_IS_EMBEDDED is enabled, ret is not defined but is used as a
> return value in env_mmc_load().
> This patch correct this issue and simplify the existing code, test only
> one time #if defined(ENV_IS_EMBEDDED) and not in the function.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index b36bd9ad77ee..661a268ea07d 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -353,10 +353,14 @@ static inline int read_env(struct mmc *mmc, unsigned long size,
>  	return (n == blk_cnt) ? 0 : -1;
>  }
>  
> -#if defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
> +#if defined(ENV_IS_EMBEDDED)
> +static int env_mmc_load(void)
> +{
> +	return 0;
> +}
> +#elif defined(CONFIG_SYS_REDUNDAND_ENVIRONMENT)
>  static int env_mmc_load(void)
>  {
> -#if !defined(ENV_IS_EMBEDDED)
>  	struct mmc *mmc;
>  	u32 offset1, offset2;
>  	int read1_fail = 0, read2_fail = 0;
> @@ -408,13 +412,11 @@ err:
>  	if (ret)
>  		env_set_default(errmsg, 0);
>  
> -#endif
>  	return ret;
>  }
>  #else /* ! CONFIG_SYS_REDUNDAND_ENVIRONMENT */
>  static int env_mmc_load(void)
>  {
> -#if !defined(ENV_IS_EMBEDDED)
>  	ALLOC_CACHE_ALIGN_BUFFER(char, buf, CONFIG_ENV_SIZE);
>  	struct mmc *mmc;
>  	u32 offset;
> @@ -453,7 +455,7 @@ fini:
>  err:
>  	if (ret)
>  		env_set_default(errmsg, 0);
> -#endif
> +
>  	return ret;
>  }
>  #endif /* CONFIG_SYS_REDUNDAND_ENVIRONMENT */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
