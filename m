Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FF1ADD5B
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 14:37:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242E9C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 12:37:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A195EC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 12:37:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03HCVwI7011400; Fri, 17 Apr 2020 14:37:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1828SfkzZqrZwR9CfdEMFU/cs558g9c+oPIJTdUmybE=;
 b=s374QefZfgQLB/NhwLetDU8+80R84HKsG8M+XtDqepbXAqIwti78K2OC4EDFSEtMJ00Z
 gxewPJCuvHE4OiRCd1Z9Z1nEQ94MhVwG/7NRgXMAtYL+6ws87ELTVHZLiTjF02gCCdkr
 veK0Q0K6kjU7SPzuYIgl+Arml5Ipf5phYn/JGb+J/mdPA57rUE7gwTFiaiolu6tmm5KV
 vd/lvxDylh9qfpbZv9lHePp+E9VSsUJtNdBTTj1z6zg470W4Z4vW345yvsCutbV/gzRJ
 UhEHcW9fOExAdo3F5wXVkqRO7N4c0AwQNJzM4is0KeYL2iawcgMr+AifXMJE/52bhODl 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn761gc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 14:37:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3AF6100034;
 Fri, 17 Apr 2020 14:36:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79E072B1893;
 Fri, 17 Apr 2020 14:36:59 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Apr
 2020 14:36:58 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Apr 2020 14:36:58 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
Thread-Index: AQHWFLTi3Ay3q7Yulk2Pi//5LTul/A==
Date: Fri, 17 Apr 2020 12:36:58 +0000
Message-ID: <0568fd18-bd0f-9c3b-f25a-37ddd7730f2e@st.com>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
In-Reply-To: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <E3317FD2B98E5341A2690EF4428EF813@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_03:2020-04-17,
 2020-04-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Peng Fan <peng.fan@nxp.com>,
 Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
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

Hi

On 3/19/20 10:59 AM, Patrick Delaunay wrote:
> Use the weak function mmc_get_env_dev in mmc_offset_try_partition
> function to allow dynamic selection of mmc device to use
> and no more use directly the define CONFIG_SYS_MMC_ENV_DEV.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  env/mmc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/env/mmc.c b/env/mmc.c
> index 251ad07d7c..902cca23ad 100644
> --- a/env/mmc.c
> +++ b/env/mmc.c
> @@ -24,14 +24,25 @@
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> +#if !defined(CONFIG_SYS_MMC_ENV_DEV)
> +#define CONFIG_SYS_MMC_ENV_DEV 0
> +#endif
> +
> +__weak int mmc_get_env_dev(void)
> +{
> +	return CONFIG_SYS_MMC_ENV_DEV;
> +}
> +
>  #if CONFIG_IS_ENABLED(OF_CONTROL)
>  static inline int mmc_offset_try_partition(const char *str, s64 *val)
>  {
>  	disk_partition_t info;
>  	struct blk_desc *desc;
>  	int len, i, ret;
> +	char dev_str[4];
>  
> -	ret = blk_get_device_by_str("mmc", STR(CONFIG_SYS_MMC_ENV_DEV), &desc);
> +	snprintf(dev_str, sizeof(dev_str), "%d", mmc_get_env_dev());
> +	ret = blk_get_device_by_str("mmc", dev_str, &desc);
>  	if (ret < 0)
>  		return (ret);
>  
> @@ -114,11 +125,6 @@ __weak int mmc_get_env_addr(struct mmc *mmc, int copy, u32 *env_addr)
>  	return 0;
>  }
>  
> -__weak int mmc_get_env_dev(void)
> -{
> -	return CONFIG_SYS_MMC_ENV_DEV;
> -}
> -
>  #ifdef CONFIG_SYS_MMC_ENV_PART
>  __weak uint mmc_get_env_part(struct mmc *mmc)
>  {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
