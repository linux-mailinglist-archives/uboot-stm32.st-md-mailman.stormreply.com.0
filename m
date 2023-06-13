Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D152772D9E1
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:25:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 973A0C6A615;
	Tue, 13 Jun 2023 06:25:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 054B6C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:25:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D2w8RE003855; Tue, 13 Jun 2023 08:25:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5tIiQWslSVoCvmjv3ThftsA+rzk3+Bh/eTNfSaM9NSc=;
 b=6BhoOyIg1Bl3jwMoQKLNuFmQk34gtgWQdhgMcsiv/tP1ExeTPnCe9S1vmCA0HIWFF2+j
 e8XZ3DracsweI7l5Dq1hklQFJpksSr22OalsUyvpF+gcD72pgWAqOnIgk2n7FjLPNc8s
 tdVTOsFuYN1mQt4gHjQsxIlIRp+arqJd3BAeQ+0hBgkXivJH24GcCo+vnyr/MnMtYG1K
 BwDEp2+6OV5frzSjEKG5kuHe7jRrj271AbHXOiGL/laAwgdKBiByBzaV3qw0C1Z/waso
 ZZEmFsmtDSn5Tq9H5g9QiWJKpNGorV4wMXUsE79byrWPpNOKyXhtB/hREuuVZIiCkFfx 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6g4xgv38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:25:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 401DC10002A;
 Tue, 13 Jun 2023 08:25:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38188212FA5;
 Tue, 13 Jun 2023 08:25:44 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:25:43 +0200
Message-ID: <478a4e55-7773-b45d-68f0-2dc4f9a1df34@foss.st.com>
Date: Tue, 13 Jun 2023 08:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.12.I7d7a0b6c2347082f9b3c03a5fe72a53cad4c23ef@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.12.I7d7a0b6c2347082f9b3c03a5fe72a53cad4c23ef@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 12/12] arm: dts: stm32: Add partitions in
 flash0 and nand node for stm32mp15xx-dhcom/dhcor
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> Add partitions subnode in flash0 for stm32mp157xx-dhcom/dhcor boards.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi | 27 ++++++++++++++++++++++
>  arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi | 27 ++++++++++++++++++++++
>  configs/stm32mp15_dhcom_basic_defconfig    |  3 ---
>  configs/stm32mp15_dhcor_basic_defconfig    |  3 ---
>  4 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> index bc0730cf2bd0..a808620e1219 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcom-u-boot.dtsi
> @@ -92,6 +92,33 @@
>  
>  &flash0 {
>  	bootph-pre-ram;
> +
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partition@0 {
> +			label = "fsbl1";
> +			reg = <0x00000000 0x00040000>;
> +		};
> +		partition@40000 {
> +			label = "fsbl2";
> +			reg = <0x00040000 0x00040000>;
> +		};
> +		partition@500000 {
> +			label = "uboot";
> +			reg = <0x00080000 0x00160000>;
> +		};
> +		partition@900000 {
> +			label = "env1";
> +			reg = <0x001E0000 0x00010000>;
> +		};
> +		partition@980000 {
> +			label = "env2";
> +			reg = <0x001F0000 0x00010000>;
> +		};
> +	};
>  };
>  
>  &qspi {
> diff --git a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
> index 804c66283e08..eb905ad28201 100644
> --- a/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15xx-dhcor-u-boot.dtsi
> @@ -28,6 +28,33 @@
>  
>  &flash0 {
>  	bootph-pre-ram;
> +
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partition@0 {
> +			label = "fsbl1";
> +			reg = <0x00000000 0x00040000>;
> +		};
> +		partition@40000 {
> +			label = "fsbl2";
> +			reg = <0x00040000 0x00040000>;
> +		};
> +		partition@500000 {
> +			label = "uboot";
> +			reg = <0x00080000 0x00160000>;
> +		};
> +		partition@900000 {
> +			label = "env1";
> +			reg = <0x001E0000 0x00010000>;
> +		};
> +		partition@980000 {
> +			label = "env2";
> +			reg = <0x001F0000 0x00010000>;
> +		};
> +	};
>  };
>  
>  &i2c4 {
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index 430d0bccc9a7..77f0fafc5c71 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -85,9 +85,6 @@ CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_BTRFS=y
>  CONFIG_CMD_EXT4_WRITE=y
> -CONFIG_CMD_MTDPARTS=y
> -CONFIG_MTDIDS_DEFAULT="nor0=nor0"
> -CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(env1),64k(env2)"
>  # CONFIG_SPL_DOS_PARTITION is not set
>  # CONFIG_ISO_PARTITION is not set
>  # CONFIG_SPL_PARTITION_UUIDS is not set
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index f23875fb84fe..4151ad64a4be 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -83,9 +83,6 @@ CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_BTRFS=y
>  CONFIG_CMD_EXT4_WRITE=y
> -CONFIG_CMD_MTDPARTS=y
> -CONFIG_MTDIDS_DEFAULT="nor0=nor0"
> -CONFIG_MTDPARTS_DEFAULT="mtdparts=nor0:256k(fsbl1),256k(fsbl2),1408k(uboot),64k(env1),64k(env2)"
>  # CONFIG_SPL_DOS_PARTITION is not set
>  # CONFIG_ISO_PARTITION is not set
>  # CONFIG_SPL_PARTITION_UUIDS is not set
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
