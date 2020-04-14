Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 582B71A7CD1
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:17:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 175EFC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:17:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 373B2C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:17:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EDH94C005749; Tue, 14 Apr 2020 15:17:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iNHMedasWN0IYgzaej8XeyYzr/DwEGaWgmuZZpM3qyE=;
 b=rZjikMMX2kArzeY9Zgydir48Fb6TTIlJx0TazWUtItvRfgI+TnAA1oYBN1ncP3MZDsq0
 mE4+auyA4Z4PhPXNA9opQFaYWvxvBBhHRvDKeRIEAHBAY7VQryqEuh/37Zom1qxZq79D
 +F7DwgRJ8UlL7ceUBOk2y+EWKj3wGwL/FMTfgscunbMyZRTpPO8ipW/ezpAGYGfrYHaf
 sVuzs4JDe8WbxR3VOAUiStNUzANtUuInQuG+y+BghE30QWGxmWhwQg+UkAzBn2YQmJ7U
 x0PGN4tdv97Y+6Ru1/uddW+sPsz74R165C6oasrItQMCOATyX7SbSvnaSBTJa9SJYLjK 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a5r52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:17:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 211D2100034;
 Tue, 14 Apr 2020 15:17:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 174A22BC7B7;
 Tue, 14 Apr 2020 15:17:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 15:17:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:17:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] stm32mp1: board: add support of
 CONFIG_ENV_IS_IN_MMC
Thread-Index: AQHWEl8ERnvB8vm0YU28SX5heuy6jw==
Date: Tue, 14 Apr 2020 13:17:16 +0000
Message-ID: <7bebada7-adb1-a58c-7a11-a3696710e424@st.com>
References: <20200319102114.8644-1-patrick.delaunay@st.com>
In-Reply-To: <20200319102114.8644-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <3F6C1939583F554CA8F5AA39E88D328D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_06:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] stm32mp1: board: add support of
 CONFIG_ENV_IS_IN_MMC
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

On 3/19/20 11:21 AM, Patrick Delaunay wrote:
> Add support of CONFIG_ENV_IS_IN_MMC in env_get_location, used for
> all mmc device (SD card and eMMC).
> The 2 configs CONFIG_ENV_IS_IN_MMC and CONFIG_ENV_IS_IN_EXT4 are
> incompatible.
>
> Add the weak function mmc_get_env_dev to select the mmc boot instance.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index c36e7655c0..effba41ad1 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -785,6 +785,11 @@ enum env_location env_get_location(enum env_operation op, int prio)
>  		return ENVL_UNKNOWN;
>  
>  	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> +#ifdef CONFIG_ENV_IS_IN_MMC
> +	case BOOT_FLASH_SD:
> +	case BOOT_FLASH_EMMC:
> +		return ENVL_MMC;
> +#endif
>  #ifdef CONFIG_ENV_IS_IN_EXT4
>  	case BOOT_FLASH_SD:
>  	case BOOT_FLASH_EMMC:
> @@ -826,6 +831,15 @@ const char *env_ext4_get_dev_part(void)
>  }
>  #endif
>  
> +#if defined(CONFIG_ENV_IS_IN_MMC)
> +int mmc_get_env_dev(void)
> +{
> +	u32 bootmode = get_bootmode();
> +
> +	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
> +}
> +#endif
> +
>  #ifdef CONFIG_SYS_MTDPARTS_RUNTIME
>  
>  #define MTDPARTS_LEN		256

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
