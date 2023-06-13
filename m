Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F8372D9CD
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:23:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A827C6A615;
	Tue, 13 Jun 2023 06:23:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5477C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:23:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D0H0pX031072; Tue, 13 Jun 2023 08:23:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fnNvv+vgKghdwvgmWSgHisVRNlk/pfMy55g8M7UVuoc=;
 b=tit3To+Woox0cfyClkzomjEFWG49M/jt/Piu/eaINqQerAOFmmzwEYSc08e6I4pV0bGU
 cKsdglTu8p69rBKmJFcl7KBMSmpcgdu85YQdd/ILcCMbXwjKcqPUIFf6V/lHL9AvY1/v
 4qpZahmfH6+a03XhRY0GWq42MUNv/YRu2fXKFzMKKYlNf9Fqrol5DBzvsYjTdFgnCQry
 cpIIiBv5310xkHMK+yaKpjUojfnoNn1qW5huXP3FofPJjFu/u+g0TY3eiNGobJVcYQK6
 VlZvhprd3UFZl3lPtkzE1OdHZo5vyDXNhJgcTFRg+VqM2Z4O/3GHLYCG8ejqU88efdyd GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r652tupmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:23:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5D9A10002A;
 Tue, 13 Jun 2023 08:23:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DEBA62128D3;
 Tue, 13 Jun 2023 08:23:44 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:23:44 +0200
Message-ID: <b665a475-160c-cfd0-7a84-5c479ccb60cc@foss.st.com>
Date: Tue, 13 Jun 2023 08:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.6.Ic6e6157ff0175b60d31738882e11485ea60b8b61@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.6.Ic6e6157ff0175b60d31738882e11485ea60b8b61@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 06/12] arm: dts: stm32: Add partitions in
 flash0 and nand node for stm32mp15xx-ev1
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
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Add partitions subnode in flash0 and nand nodes for all stm32mp157xx-ev1
> boards. Update only the file stm32mp157c-ev1-*u-boot.dtsi, included by
> other files  stm32mp15*-ev1-*-u-boot.dtsi.
> 
> For SCMI variant of device tree used with stm32mp15_defconfig
> add partitions needed by TF-A firmware update:
> - metadata to save the TF-A information: 2 copy
> - fip-a / fip-b: two FIP slots, used for system A/B (seamless) update
> - the previous "fsbl" partition with 2 copy of TFA is replaced
>   by 2 partitions (only one copy in each MTD partition) to simplify
>   the update: no need to managed this copy on update, need to update the
>   two partition (skip bad block for NAND)
> The offset for ENV partition are also updated in stm32mp15_defconfig
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi | 85 ++++++++++++++++
>  arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi      | 98 ++++++++++++++++++-
>  configs/stm32mp15_defconfig                   |  4 +-
>  3 files changed, 184 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> index eef717946b5f..9768db8de9c9 100644
> --- a/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ev1-scmi-u-boot.dtsi
> @@ -23,6 +23,91 @@
>  
>  &flash0 {
>  	bootph-pre-ram;
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		partition@0 {
> +			label = "fsbl1";
> +			reg = <0x00000000 0x00040000>;
> +		};
> +		partition@40000 {
> +			label = "fsbl2";
> +			reg = <0x00040000 0x00040000>;
> +		};
> +		partition@80000 {
> +			label = "metadata1";
> +			reg = <0x00080000 0x00040000>;
> +		};
> +		partition@c0000 {
> +			label = "metadata2";
> +			reg = <0x000c0000 0x00040000>;
> +		};
> +		partition@100000 {
> +			label = "fip-a";
> +			reg = <0x00100000 0x00400000>;
> +		};
> +		partition@500000 {
> +			label = "fip-b";
> +			reg = <0x00500000 0x00400000>;
> +		};
> +		partition@900000 {
> +			label = "u-boot-env";
> +			reg = <0x00900000 0x00080000>;
> +		};
> +		partition@980000 {
> +			label = "nor-user";
> +			reg = <0x00980000 0x03680000>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	nand-controller@4,0 {
> +		nand@0 {
> +			partitions {
> +				compatible = "fixed-partitions";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				partition@0 {
> +					label = "fsbl1";
> +					reg = <0x00000000 0x00080000>;
> +				};
> +				partition@80000 {
> +					label = "fsbl2";
> +					reg = <0x00080000 0x00080000>;
> +				};
> +				partition@100000 {
> +					label = "metadata1";
> +					reg = <0x00100000 0x00080000>;
> +				};
> +				partition@180000 {
> +					label = "metadata2";
> +					reg = <0x00180000 0x00080000>;
> +				};
> +				partition@200000 {
> +					label = "fip-a1";
> +					reg = <0x00200000 0x00400000>;
> +				};
> +				partition@600000 {
> +					label = "fip-a2";
> +					reg = <0x00600000 0x00400000>;
> +				};
> +				partition@a00000 {
> +					label = "fip-b1";
> +					reg = <0x00a00000 0x00400000>;
> +				};
> +				partition@e00000 {
> +					label = "fip-b2";
> +					reg = <0x00e00000 0x00400000>;
> +				};
> +				partition@1200000 {
> +					label = "UBI";
> +					reg = <0x01200000 0x3ee00000>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &qspi {
> diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
> index cb32c30431c2..1f7fdbce5304 100644
> --- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
> @@ -23,6 +23,103 @@
>  
>  &flash0 {
>  	bootph-pre-ram;
> +	partitions {
> +		compatible = "fixed-partitions";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
> +		partition@0 {
> +			label = "fsbl1";
> +			reg = <0x00000000 0x00040000>;
> +		};
> +		partition@80000 {
> +			label = "fsbl2";
> +			reg = <0x00040000 0x00040000>;
> +		};
> +		partition@100000 {
> +			label = "ssbl";
> +			reg = <0x00080000 0x00200000>;
> +		};
> +		partition@280000  {
> +			label = "u-boot-env";
> +			reg = <0x00280000 0x00080000>;
> +		};
> +		partition@300000 {
> +			label = "nor-user";
> +			reg = <0x00300000 0x03d00000>;
> +		};
> +#else
> +		partition@0 {
> +			label = "fsbl1";
> +			reg = <0x00000000 0x00040000>;
> +		};
> +		partition@40000 {
> +			label = "fsbl2";
> +			reg = <0x00040000 0x00040000>;
> +		};
> +		partition@100000 {
> +			label = "fip";
> +			reg = <0x00080000 0x00400000>;
> +		};
> +		partition@480000 {
> +			label = "u-boot-env";
> +			reg = <0x00480000 0x00080000>;
> +		};
> +		partition@500000 {
> +			label = "nor-user";
> +			reg = <0x00500000 0x03b00000>;
> +		};
> +#endif
> +	};
> +};
> +
> +&fmc {
> +	nand-controller@4,0 {
> +		nand@0 {
> +			partitions {
> +				compatible = "fixed-partitions";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +#if defined(CONFIG_STM32MP15x_STM32IMAGE) || defined(CONFIG_SPL)
> +				partition@0 {
> +					label = "fsbl";
> +					reg = <0x00000000 0x00200000>;
> +				};
> +				partition@200000 {
> +					label = "ssbl1";
> +					reg = <0x00200000 0x00200000>;
> +				};
> +				partition@400000 {
> +					label = "ssbl2";
> +					reg = <0x00400000 0x00200000>;
> +				};
> +				partition@600000 {
> +					label = "UBI";
> +					reg = <0x00600000 0x3fa00000>;
> +				};
> +#else
> +				partition@0 {
> +					label = "fsbl";
> +					reg = <0x00000000 0x00200000>;
> +				};
> +				partition@200000 {
> +					label = "fip1";
> +					reg = <0x00200000 0x00400000>;
> +				};
> +				partition@600000 {
> +					label = "fip2";
> +					reg = <0x00600000 0x00400000>;
> +				};
> +				partition@1200000 {
> +					label = "UBI";
> +					reg = <0x00a00000 0x3f600000>;
> +				};
> +#endif
> +			};
> +		};
> +	};
>  };
>  
>  &qspi {
> @@ -55,4 +152,3 @@
>  		bootph-pre-ram;
>  	};
>  };
> -
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 2669aae0f2f4..bad5c32ef808 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -3,7 +3,7 @@ CONFIG_ARCH_STM32MP=y
>  CONFIG_TFABOOT=y
>  CONFIG_SYS_MALLOC_F_LEN=0x80000
>  CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0100000
> -CONFIG_ENV_OFFSET=0x480000
> +CONFIG_ENV_OFFSET=0x900000
>  CONFIG_ENV_SECT_SIZE=0x40000
>  CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
>  CONFIG_SYS_PROMPT="STM32MP> "
> @@ -11,7 +11,7 @@ CONFIG_DDR_CACHEABLE_SIZE=0x10000000
>  CONFIG_CMD_STM32KEY=y
>  CONFIG_TYPEC_STUSB160X=y
>  CONFIG_TARGET_ST_STM32MP15x=y
> -CONFIG_ENV_OFFSET_REDUND=0x4C0000
> +CONFIG_ENV_OFFSET_REDUND=0x940000
>  CONFIG_CMD_STM32PROG=y
>  # CONFIG_ARMV7_NONSEC is not set
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
