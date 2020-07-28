Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B901230DC8
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:28:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57203C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:28:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A7C3C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:28:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFDCtx018333; Tue, 28 Jul 2020 17:28:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ZqmA5p1GqL+ZjyNV6c9Ae6vqJx5NgN8hilTTjTQlu+s=;
 b=llBktKYvuNki15NkogYbrcQCFwEYaik2LuZultfKCUL297ZE1ILhV2cRYCMt0PGmSLlJ
 xwIuzDmlZrYx4zfkoLNGDP+z/WhhwiujlTQFcuzT1b+FhhXzhErJExiOUd0VDxbzDBnr
 6gB/yqtah3BRyGt1mIQubMlwEwvY0eZHPznXrrLRPkiNCbwiBkMdednSOUas9xq3qTCe
 kxuvGzp5L8UwkxlDq3gx0KlMYm/0AJEkHlYXNnATZn6K01e9RYYDb2gzNqL81GAibay4
 Hk4wtpdOf0+gD+xdidIpNtVv2HBRoRzfjH5JtguBpuueFdTxdQWC60j5s/9XMcb4cff+ oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9f7gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:28:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5030F10002A;
 Tue, 28 Jul 2020 17:28:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 460972B8A3D;
 Tue, 28 Jul 2020 17:28:27 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:28:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:28:26 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 1/3] stm32mp1: board: add support of
 CONFIG_ENV_IS_IN_MMC
Thread-Index: AQHWZPO9MoW/omznE0GwO/rZjHC3rw==
Date: Tue, 28 Jul 2020 15:28:26 +0000
Message-ID: <8a565b1d-540c-d019-352f-f80ae76431b6@st.com>
References: <20200615091824.3022-1-patrick.delaunay@st.com>
 <20200615091824.3022-2-patrick.delaunay@st.com>
In-Reply-To: <20200615091824.3022-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <A1E2A4735BB783479B9A508F193A27A2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] stm32mp1: board: add support of
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


On 6/15/20 11:18 AM, Patrick Delaunay wrote:
> Add support of CONFIG_ENV_IS_IN_MMC in env_get_location, used for
> all mmc device (SD card and eMMC).
> The 2 configs CONFIG_ENV_IS_IN_MMC and CONFIG_ENV_IS_IN_EXT4 are
> incompatible.
>
> Add the weak function mmc_get_env_dev to select the mmc boot instance.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> (no changes since v1)
>
>  board/st/stm32mp1/stm32mp1.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 4553329b25..b695e8bc6b 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -833,6 +833,11 @@ enum env_location env_get_location(enum env_operation op, int prio)
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
> @@ -875,6 +880,15 @@ const char *env_ext4_get_dev_part(void)
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
>  #if defined(CONFIG_OF_BOARD_SETUP)
>  int ft_board_setup(void *blob, bd_t *bd)
>  {
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
