Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0125928113A
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 13:30:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBB16C3FAFF;
	Fri,  2 Oct 2020 11:30:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13B9CC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 11:30:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092BRWNt001575; Fri, 2 Oct 2020 13:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GdA3NYiz2HUa9b16j2SfH2HegvFibG0aNkKgLnAaDhM=;
 b=Nj0ahsc1U6N2ky97egLdl/sL9/PkzMpA8PeH+cc2wbblZVwCuBcEN4L5QdjCjlfBP4go
 ao6pMr0cjiawJj5m5dDRhiwNlGp0KItVYXxd8+1/BDgIdTIX6J4vQwlEttPUnDnTNxxy
 U5PZwrw09E3iC8t3S+UJZlrzWES9mEMlNPNALz8XHFOudcxN35KD2b5ceOIOqqpj97+1
 8RJAsV4wIGB1v3v9KFL5F2KMrm9vwuyqParsbeHGhLvEt0NeZ3Qx8WfLQEeBFQlNre2N
 ++q4md4jPGHNlml9QYIumIbiaSrvWNr8x5lghxJgJXykg3ufeozZ3oY62ZF0yrlVWT7H ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33v0dhaxed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 13:30:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A12D10002A;
 Fri,  2 Oct 2020 13:30:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E6982B8A11;
 Fri,  2 Oct 2020 13:30:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 13:30:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 13:30:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 4/4] configs: stm32mp1: enable the fastboot
 oem command bootbus
Thread-Index: AQHWmK90H3t3c+zGPUmYIJF5XBaReQ==
Date: Fri, 2 Oct 2020 11:30:39 +0000
Message-ID: <89cb7da2-8cf5-aa55-6a65-c0c836d62a5b@st.com>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
 <20200909152426.4.I3df1738f393278eeb2df2ad4fd8543360d3a5597@changeid>
In-Reply-To: <20200909152426.4.I3df1738f393278eeb2df2ad4fd8543360d3a5597@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <D78A64FFD36F2249B967F439662588B1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_06:2020-10-02,
 2020-10-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] configs: stm32mp1: enable the
 fastboot oem command bootbus
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

On 9/9/20 3:24 PM, Patrick Delaunay wrote:
> Enable the fastboot oem command bootbus, used to configure the eMMC
> boot behavior, with same format than 'mmc bootbus'
> and with parameter: boot_bus_width reset_boot_bus_width boot_mode
>
> On stm32mp1 boards the expected command is
> $> fastboot oem partconf:0 0 0
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 6cbfbe5274..0115c9b891 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -87,6 +87,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
> +CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index cc114896df..470a2f4c35 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -67,6 +67,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
> +CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
