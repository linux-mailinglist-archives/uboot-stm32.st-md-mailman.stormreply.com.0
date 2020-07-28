Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7CA230DCA
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 17:28:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 613E5C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 15:28:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D5E6C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 15:28:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SFDebU008275; Tue, 28 Jul 2020 17:28:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C/mDr/o4ja+FBsvLDgcivHF3jW3Vf3QRBr2bcdAk3bU=;
 b=nyyPVAGXnFEKIVqWOd/tyxFc0v8/VShxGusRipTQG/SZGVPiS/6ICJ2He/K9rAAFqRV1
 nxbMhihlSV4ai4aj9OFZbPXgORF2AZHsCPdVgAgaAh8TDDiF5ykOfaaUQ18VR1BkQyXO
 AJtbfx1XNEZIKH1tY9ugHKCtkFWgoXR/R9QKw4BCW9P5ebqGJrpou2TH5OzU7iGQdvmg
 nz58GTINnpFzEwxZwkLRuEVqTYASJux/s1e13VVt0LqyttI2pQc3N692+3/TfX5Vc36z
 h9Vb8DxQwk2fdIh/zsZeuxVfnYWKw6I4NRa2Bo/p8nTPMqMHqrk1ZBsHt8UEcllHZB6g og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv6vwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 17:28:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 890C2100034;
 Tue, 28 Jul 2020 17:28:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EAE02BA2C6;
 Tue, 28 Jul 2020 17:28:41 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 17:28:41 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 17:28:41 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 2/3] stm32mp1: use a specific SD/eMMC
 partition for U-Boot enviromnent
Thread-Index: AQHWZPPFcvPwa3JPyUOgOZJLD7TlFw==
Date: Tue, 28 Jul 2020 15:28:41 +0000
Message-ID: <3183ed45-7b59-ed7f-ab4b-32299ebbd996@st.com>
References: <20200615091824.3022-1-patrick.delaunay@st.com>
 <20200615111823.v2.2.Ib3e7ff4191e854f532f393567064e998dbba7955@changeid>
In-Reply-To: <20200615111823.v2.2.Ib3e7ff4191e854f532f393567064e998dbba7955@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <1CF88377BCC1164E829EC5F1CB0175AA@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_13:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] stm32mp1: use a specific SD/eMMC
 partition for U-Boot enviromnent
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
> Save the environment at the end of the U-Boot partition, the GPT
> partition named "ssbl" in SD card or eMMC and avoid requirements
> on the "bootfs" file system generated via specific raw tools
> (like wic and genimage).
>
> With the previous configuration of the U-Boot environment saved in ext4
> file, U-Boot need to create/modify the file uenv.txt in the ext4 file
> system; so this EXT4 file system need to be generated without some
> functionality, like metadata_csum and dir_index, because they are not
> supported by U-Boot.
>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - remove impact on avenger96 board as ENV is saved in NOR for DHCOR SOM
>   (CONFIG_ENV_IS_IN_SPI_FLASH in stm32mp15_dhcor_basic_defconfig)
>
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 +
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 1 +
>  configs/stm32mp15_basic_defconfig        | 5 +----
>  configs/stm32mp15_trusted_defconfig      | 5 +----
>  4 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index c52abeb1e7..3635965ca4 100644
> --- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> @@ -16,6 +16,7 @@
>  	config {
>  		u-boot,boot-led = "heartbeat";
>  		u-boot,error-led = "error";
> +		u-boot,mmc-env-partition = "ssbl";
>  		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
>  		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> index 84af7fa47b..d3ca5d1e58 100644
> --- a/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi
> @@ -17,6 +17,7 @@
>  	config {
>  		u-boot,boot-led = "heartbeat";
>  		u-boot,error-led = "error";
> +		u-boot,mmc-env-partition = "ssbl";
>  		st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>  		st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;
>  	};
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index c7dd2926c9..acf9331b4b 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -53,13 +53,10 @@ CONFIG_CMD_UBI=y
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
>  CONFIG_ENV_IS_NOWHERE=y
> -CONFIG_ENV_IS_IN_EXT4=y
> +CONFIG_ENV_IS_IN_MMC=y
>  CONFIG_ENV_IS_IN_SPI_FLASH=y
>  CONFIG_ENV_IS_IN_UBI=y
>  CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> -CONFIG_ENV_EXT4_INTERFACE="mmc"
> -CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
> -CONFIG_ENV_EXT4_FILE="/uboot.env"
>  CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index ca4a10813b..b7ff4b2aec 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -40,13 +40,10 @@ CONFIG_CMD_MTDPARTS=y
>  CONFIG_CMD_UBI=y
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_ENV_IS_NOWHERE=y
> -CONFIG_ENV_IS_IN_EXT4=y
> +CONFIG_ENV_IS_IN_MMC=y
>  CONFIG_ENV_IS_IN_SPI_FLASH=y
>  CONFIG_ENV_IS_IN_UBI=y
>  CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
> -CONFIG_ENV_EXT4_INTERFACE="mmc"
> -CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
> -CONFIG_ENV_EXT4_FILE="/uboot.env"
>  CONFIG_ENV_UBI_PART="UBI"
>  CONFIG_ENV_UBI_VOLUME="uboot_config"
>  CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
Applied to u-boot-stm/master

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
