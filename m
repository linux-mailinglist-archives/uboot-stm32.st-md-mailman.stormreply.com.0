Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4E81A7CF4
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 15:18:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B00EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 13:18:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FFF8C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 13:18:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ED3glm020517; Tue, 14 Apr 2020 15:18:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=eWXdHIS+SXNozz2f7UZZ3EfCck2Kk5BCHvY+xtZiPW0=;
 b=hfWf+9hBYU3ibqf9KHm1d998Ww1B8LpSc/2+Q6l8rP7abHkmcC5FXxuhAHlKRu3/yUrq
 /W9cLLwrqGp8joiRmygd4KRLMJ08/FKvTH7wYRCiIulkjcTxPumhp2F1KtuiTyUJm97D
 AlYv8VtecJFevbYUyDN3nt8fGl3dh+3nC6tAQDZ3iuuKR91vyncQsUMl6obiuQ1HtZi/
 scxYwmN7tQsnXyRsacfXcxi55tzvzN3iqyG+M/mzIYTnbs8ZJ4ljPssMk+S3MlNPrfRU
 VzohXBDBU3j0AhI4iDMJq7b8WrXMmUTBFf0Dwm53PBEP/xEjnSeZM7uWDi8QLKmo2kKm Wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5sjwvb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 15:18:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5144F100038;
 Tue, 14 Apr 2020 15:18:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48EA72BC7B3;
 Tue, 14 Apr 2020 15:18:02 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 15:18:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 15:18:01 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 2/3] stm32mp1: use a specific SD/eMMC
 partition for U-Boot enviromnent
Thread-Index: AQHWEl8fscJahSGIwkqQNuMXD03fOA==
Date: Tue, 14 Apr 2020 13:18:01 +0000
Message-ID: <7dcff725-167a-25c5-f254-509afa365108@st.com>
References: <20200319102114.8644-1-patrick.delaunay@st.com>
 <20200319112109.2.Ib3e7ff4191e854f532f393567064e998dbba7955@changeid>
In-Reply-To: <20200319112109.2.Ib3e7ff4191e854f532f393567064e998dbba7955@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <B376F0D5D3CC9549BD9ADEA8850B7288@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] stm32mp1: use a specific SD/eMMC
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

Hi

On 3/19/20 11:21 AM, Patrick Delaunay wrote:
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
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 1 +
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi       | 1 +
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi       | 1 +
>  configs/stm32mp15_basic_defconfig              | 5 +----
>  configs/stm32mp15_optee_defconfig              | 5 +----
>  configs/stm32mp15_trusted_defconfig            | 5 +----
>  6 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> index d6dc746365..8e49c47a1d 100644
> --- a/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> @@ -20,6 +20,7 @@
>  	config {
>  		u-boot,boot-led = "led1";
>  		u-boot,error-led = "led4";
> +		u-boot,mmc-env-partition = "ssbl";
>  	};
>  };
>  
> diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
> index a5cc01dd19..e3f75208fd 100644
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
> index 347edf7e58..4d00ec618a 100644
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
> index 6d82365348..dd55a8b632 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -55,13 +55,10 @@ CONFIG_CMD_UBI=y
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
> diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
> index 298611776d..1f40669872 100644
> --- a/configs/stm32mp15_optee_defconfig
> +++ b/configs/stm32mp15_optee_defconfig
> @@ -42,13 +42,10 @@ CONFIG_CMD_MTDPARTS=y
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
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 6928e9a65c..7dae7663b0 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -41,13 +41,10 @@ CONFIG_CMD_MTDPARTS=y
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

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
