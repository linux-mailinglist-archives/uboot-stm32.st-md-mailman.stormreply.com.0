Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0448B643E1F
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Dec 2022 09:11:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A586CC65E6E;
	Tue,  6 Dec 2022 08:11:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B365C65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 08:11:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B63Hojg023741; Tue, 6 Dec 2022 09:11:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aSo4LUkugPxYSo86GC58ik0iTQryXjVMVacaZ+whigs=;
 b=ImRXyLme9E07Ti0p5T1kGqQXbKz3Is7+c/VHCP0r9Fa+v1k1DyFsfO5sJr1pKz4UfYXu
 ds8OBrSiM0/DJ3DG1GaLgh8maNmpL/7Lq4ecrykOUm23VG3dfWz0HirVNCNLsPOSTXCl
 +rjEEQI0lKglh7DwWpWta6qGcsVDpBOJcH67ajPHgkFRhKCwt7DUIgkMTsXy9vk/cKnj
 j2iYh9fvyXn7xw10G8Ge3Y06LQFt7eyw6na0yu6tjW05jtZ2zWKrnGzjFRK8JKk7VgNZ
 fdqYXe6qCM+z4StrTSSAEmy4utVf2BupK5kUHOqg5erO8tdffUd/lmLfrEq8tUdcGY3b fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7x7pqeh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 09:11:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E2DD010002A;
 Tue,  6 Dec 2022 09:11:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBB962132F6;
 Tue,  6 Dec 2022 09:11:08 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 6 Dec
 2022 09:11:08 +0100
Message-ID: <4de9711e-e109-e192-de27-cdb2726af669@foss.st.com>
Date: Tue, 6 Dec 2022 09:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <20221110114828.1.Id1b34c2a5cfbd6b1fbc2f49e4d542c3954c1e9f2@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221110114828.1.Id1b34c2a5cfbd6b1fbc2f49e4d542c3954c1e9f2@changeid>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-05_01,2022-06-22_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/8] env: mmc: introduced ENV_MMC_OFFSET
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
> Introduce ENV_MMC_OFFSET defines.
> It is a preliminary step to the next patches to simplify the code.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  env/mmc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/env/mmc.c b/env/mmc.c
> index c28f4c6c6dc0..42bcf7e775cc 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -24,6 +24,17 @@
>  #define __STR(X) #X
>  #define STR(X) __STR(X)
>  
> +#define ENV_MMC_INVALID_OFFSET ((s64)-1)
> +
> +/* Default ENV offset when not defined in Device Tree */
> +#define ENV_MMC_OFFSET		CONFIG_ENV_OFFSET
> +
> +#if defined(CONFIG_ENV_OFFSET_REDUND)
> +#define ENV_MMC_OFFSET_REDUND	CONFIG_ENV_OFFSET_REDUND
> +#else
> +#define ENV_MMC_OFFSET_REDUND	ENV_MMC_INVALID_OFFSET
> +#endif
> +
>  DECLARE_GLOBAL_DATA_PTR;
>  
>  /*
> @@ -94,12 +105,12 @@ static inline s64 mmc_offset(int copy)
>  			return val;
>  	}
>  
> -	defvalue = CONFIG_ENV_OFFSET;
> +	defvalue = ENV_MMC_OFFSET;
>  	propname = dt_prop.offset;
>  
>  #if defined(CONFIG_ENV_OFFSET_REDUND)
>  	if (copy) {
> -		defvalue = CONFIG_ENV_OFFSET_REDUND;
> +		defvalue = ENV_MMC_OFFSET_REDUND;
>  		propname = dt_prop.offset_redund;
>  	}
>  #endif
> @@ -108,11 +119,11 @@ static inline s64 mmc_offset(int copy)
>  #else
>  static inline s64 mmc_offset(int copy)
>  {
> -	s64 offset = CONFIG_ENV_OFFSET;
> +	s64 offset = ENV_MMC_OFFSET;
>  
>  #if defined(CONFIG_ENV_OFFSET_REDUND)
>  	if (copy)
> -		offset = CONFIG_ENV_OFFSET_REDUND;
> +		offset = ENV_MMC_OFFSET_REDUND;
>  #endif
>  	return offset;
>  }
> @@ -122,6 +133,11 @@ __weak int mmc_get_env_addr(struct mmc *mmc, int copy, u32 *env_addr)
>  {
>  	s64 offset = mmc_offset(copy);
>  
> +	if (offset == ENV_MMC_INVALID_OFFSET) {
> +		printf("Invalid ENV offset in MMC, copy=%d\n", copy);
> +		return -ENOENT;
> +	}
> +
>  	if (offset < 0)
>  		offset += mmc->capacity;
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
