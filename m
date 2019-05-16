Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F93200A3
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 09:50:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EAB4C35E03
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 May 2019 07:50:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED459C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2019 07:50:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G7lhWI010253; Thu, 16 May 2019 09:49:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4jK6DmjdLH0L7sUAmQ3I+pIJT/3svy9zPhBwn08jv+4=;
 b=UMDcCJnETS+hXtXFjZGkQdqLL4V0WxFdubJpiUc/gPEqd5bmaJUWYctV7P05+BvTt3ux
 vqjux3JLSNWGPULZVMdlYBHninSquuHXEFJZ5tijBSTVn/0PHFYDpl+Oggc0wJ4Zw/QP
 fp25iwb74XV1ugGQFR5RPp/VM2yILtc8q3XOAPsePBT8PmaL+3qlwnomleAs8s/fMsdp
 j6BfoC4wcyKfWLXIf2cj1huo6wDY3NKv98hIRLkDgApHYeaQEiqfAVkMzLxe2QpqEpkI
 +sRvmQNIzdx1X88TNGZr8UPYDXBl+QljbmLqU5p/yLRPcjOw93J7vR1t2mOf3gz0mbo/ mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sdkv05fcx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 16 May 2019 09:49:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A50031;
 Thu, 16 May 2019 07:49:49 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C53DD1487;
 Thu, 16 May 2019 07:49:48 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 May
 2019 09:49:48 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 16 May 2019 09:49:48 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Fabien DESSENNE <fabien.dessenne@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Christophe KERELLO <christophe.kerello@st.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>, Alexander Graf
 <agraf@suse.de>, Stefan Roese <sr@denx.de>, Mario Six <mario.six@gdsys.cc>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, "Andrew F . Davis"
 <afd@ti.com>, Michal Simek <michal.simek@xilinx.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Ryder Lee <ryder.lee@mediatek.com>, Liviu Dudau
 <Liviu.Dudau@foss.arm.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, York Sun <york.sun@nxp.com>,
 "Andreas Dannenberg" <dannenberg@ti.com>,
 Loic PALLARDY <loic.pallardy@st.com>, "Lokesh Vutla" <lokeshvutla@ti.com>
Thread-Topic: [PATCH 3/4] configs: stm32mp15: enable IPCC mailbox
Thread-Index: AQHVCjZVA5BBCYOFxkiO9Ci+kd1LOKZtQegA
Date: Thu, 16 May 2019 07:49:47 +0000
Message-ID: <e9d88972-793e-b8af-cff7-c89c415e57f7@st.com>
References: <1557825637-25153-1-git-send-email-fabien.dessenne@st.com>
 <1557825637-25153-4-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1557825637-25153-4-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <D007E924FAA94B478AB2903DC95A309F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_06:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH 3/4] configs: stm32mp15: enable IPCC
	mailbox
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



On 5/14/19 11:20 AM, Fabien Dessenne wrote:
> Activate the ipcc mailbox for stm32mp15 configs.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  configs/stm32mp15_basic_defconfig   | 2 ++
>  configs/stm32mp15_trusted_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 0ea9dff..f03c72c 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -52,6 +52,8 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> +CONFIG_DM_MAILBOX=y
> +CONFIG_STM32_IPCC=y
>  CONFIG_DM_MMC=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 3c2bb75..525f4c3 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -44,6 +44,8 @@ CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
>  CONFIG_LED=y
>  CONFIG_LED_GPIO=y
> +CONFIG_DM_MAILBOX=y
> +CONFIG_STM32_IPCC=y
>  CONFIG_DM_MMC=y
>  CONFIG_SUPPORT_EMMC_BOOT=y
>  CONFIG_STM32_SDMMC2=y
> 

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
