Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD521B9A85
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 10:43:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7F6FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Apr 2020 08:43:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D2A4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 08:43:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03R8ePOj011988; Mon, 27 Apr 2020 10:43:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=X2WgcIcg3sNaUKDkbAtggJqHLVMktk7Enc5u8R7yy8Q=;
 b=X1gquWzcCP8gPrOuSj0JySHDi6We4n7UYELv74OuoaCVjCbLu5crnSGNFnHEC2rzxlWS
 3h/8wqzRzkyZc9GhpnMoCoYIRINS3DC7UZaifvQ7uIBYjIpWNcDQQ1b2pNRvMrJau14F
 O9sPlY7bUcpcchfMAZpjvWDJCTeLQWxWRlSHwEoyXy6Kx8p7O6o1dJ/G4e96GOMjE3F1
 oRJarQF/x7dGA1wjgIDDSO0MDh76XZM/KzkeXReJXlzkH9WLQaD+sLbv9GS33w58iilw
 nmIvJ17bpAR/wqWl8KENaIeNYf/VdiHgtlywGq/UkS0Sd4NmGJYn9NucqEePWTxJSyHv WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcbrkcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 10:43:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F235D10002A;
 Mon, 27 Apr 2020 10:43:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAC972AC5B8;
 Mon, 27 Apr 2020 10:43:19 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Apr
 2020 10:43:19 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 27 Apr 2020 10:43:19 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
Thread-Index: AQHWHG/m/crynmFITUyY4/foQiB07g==
Date: Mon, 27 Apr 2020 08:43:19 +0000
Message-ID: <11ca8147-6152-10c8-857d-de2592bbf50e@st.com>
References: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
In-Reply-To: <20200319105917.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <6BEF9E45DD78044CB29EAB2AD59C2CF8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_03:2020-04-24,
 2020-04-27 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>
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

Hi Joe

As ENV maintainer, do you expect to send a pull request including this series soon ?

We got others series depending of this one in the pipe and we wanted to include them in next v2020.07 release.

Thanks

Patrice

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
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
