Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0C28101D
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Oct 2020 11:50:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C850AC424AF;
	Fri,  2 Oct 2020 09:50:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E96FC3FAFF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 09:50:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0929l5dK027654; Fri, 2 Oct 2020 11:50:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=1Pj3hSndyGue6xDnIBbNrdJWnCIERkbAa93k43MACqw=;
 b=GVddB1QvixHjDtiUfwdRCZvbFt5PT6ju5kFxR7XGMN/0VBwLIbXwM0MHxRKkJQ5t3sX2
 t3Az1nEbrv63pJlpIxPdeZEVxybZuz335gaDnPPOy20r2DDRd2qoqvy583gpzKlyS54C
 y1/t36XA+whMp5x83cYJw9/bT3pZx8C/raDI6ehAatja5YcFIwkvIzpsjpct+FqNCuSM
 OfmAaazlwV/O6AFYqHqMmqJftV8M1RkkBg+ULtecKUOlE1Uhx0cnCbT2ZJwH5xGxpomj
 ObOSXeV1n+0SOfKoMRsj5+eQkinxGLpappf4YN3V4FHTpaTG4F4gUQ3M0vRhRtrbDtNE BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33svhf2ged-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Oct 2020 11:50:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F4AB10002A;
 Fri,  2 Oct 2020 11:50:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93B992B1526;
 Fri,  2 Oct 2020 11:50:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 11:50:16 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 2 Oct 2020 11:50:16 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/4] configs: stm32mp1: enable the fastboot
 oem command format
Thread-Index: AQHWmKFus0UMmw9F30W3YET62R7XEQ==
Date: Fri, 2 Oct 2020 09:50:16 +0000
Message-ID: <e8fe0850-6953-4216-b7bf-48645694166f@st.com>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
 <20200909152426.2.Ia6ff004576355889c1813b2d056d9754110d8f2e@changeid>
In-Reply-To: <20200909152426.2.Ia6ff004576355889c1813b2d056d9754110d8f2e@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <C3C6465E58D3504DB9AB74CD17BD6D4C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_05:2020-10-02,
 2020-10-02 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-philippe ROMAIN <jean-philippe.romain@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] configs: stm32mp1: enable the
 fastboot oem command format
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
> From: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
>
> Enable the fastboot oem command format and set the variable
> "partitions" with default eMMC partitions list.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
> ---
>
>  configs/stm32mp15_basic_defconfig   |  1 +
>  configs/stm32mp15_trusted_defconfig |  1 +
>  include/configs/stm32mp1.h          | 14 ++++++++++++++
>  3 files changed, 16 insertions(+)
>
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index fc3d2cc4fb..0f705eccb2 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -85,6 +85,7 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
>  CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
> +CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index bfe9e6b06c..3e9cca6a1e 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -65,6 +65,7 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
>  CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
>  CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
> +CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
>  CONFIG_DM_I2C=y
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index b937233797..e3cbca9713 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -140,6 +140,19 @@
>  		"run distro_bootcmd;" \
>  	"fi;\0"
>  
> +#ifdef CONFIG_FASTBOOT_CMD_OEM_FORMAT
> +/* eMMC default partitions for fastboot command: oem format */
> +#define PARTS_DEFAULT \
> +	"partitions=" \
> +	"name=ssbl,size=2M;" \
> +	"name=bootfs,size=64MB,bootable;" \
> +	"name=vendorfs,size=16M;" \
> +	"name=rootfs,size=746M;" \
> +	"name=userfs,size=-\0"
> +#else
> +#define PARTS_DEFAULT
> +#endif
> +
>  #include <config_distro_bootcmd.h>
>  
>  /*
> @@ -158,6 +171,7 @@
>  	"altbootcmd=run bootcmd\0" \
>  	"env_check=if env info -p -d -q; then env save; fi\0" \
>  	STM32MP_BOOTCMD \
> +	PARTS_DEFAULT \
>  	BOOTENV \
>  	"boot_net_usb_start=true\0"
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
