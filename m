Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FC211D2F
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:41:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B116C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:41:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9628C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:41:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627Wx8j007227; Thu, 2 Jul 2020 09:41:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1lupinOYhbAkQepe/jt8GSOaveZwmi7FMbI52HHbEmU=;
 b=RF9bokUXytrTyvhEx3TwMunYwFpgrJVPQGu9hbvAXWdX39+bBZHTZOJVEDgjIVO/dsSt
 2DaPQkdJL00fuMadBaa/WYrJ3lC8FFnLM5Loi97la9Y+qKML1pyrpMUE/Czl3L8prvL5
 StlvmW974D8nYjnch3ZgNyifn5pl8XlDaVLCN9+KB/QoHdAGozDXgCLaAswXzzE0fFQS
 V478WiaLY0bTEMUIgeWlQTJyAwO7WH9K9KasyBdsS290UDvygvCluq5Jm5FLr0Pqa8nV
 mbTJ9f5GV2KakS8u7gUA25Q6yr0nsj3ctHJ9QMsrOXmVDAID0nuvOnB5m9ordEmHIv+n oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gejr3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:41:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CC40100038;
 Thu,  2 Jul 2020 09:41:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52B3E21E69B;
 Thu,  2 Jul 2020 09:41:08 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:41:07 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:41:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 01/11] configs: stm32mp1: activate
 CONFIG_GPIO_HOG
Thread-Index: AQHWUEQlZHEEWmxK4EeE+lwvWrlcxg==
Date: Thu, 2 Jul 2020 07:41:07 +0000
Message-ID: <aae31384-01db-cc08-6905-78cd92148838@st.com>
References: <20200604123033.25499-1-patrick.delaunay@st.com>
 <20200604143022.v2.1.I92b15db791882c676870dfd8eb2439a1d7f2accc@changeid>
In-Reply-To: <20200604143022.v2.1.I92b15db791882c676870dfd8eb2439a1d7f2accc@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <B1E963DF5B0695429C7A391D56B28270@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 01/11] configs: stm32mp1: activate
 CONFIG_GPIO_HOG
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

HI Patrick

On 6/4/20 2:30 PM, Patrick Delaunay wrote:
> This patch activates the new configuration CONFIG_GPIO_HOG.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2: None
>
>  configs/stm32mp15_basic_defconfig   | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index c7dd2926c9..f180b460d6 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -72,6 +72,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x02000000
>  CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
> +CONFIG_GPIO_HOG=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index ca4a10813b..97a27986a9 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -59,6 +59,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x02000000
>  CONFIG_FASTBOOT_USB_DEV=1
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=1
> +CONFIG_GPIO_HOG=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
