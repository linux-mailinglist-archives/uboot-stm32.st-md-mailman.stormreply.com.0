Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5781B1A776C
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:34:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ED88C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:34:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F9A0C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:34:01 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9RsCB015681; Tue, 14 Apr 2020 11:33:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=m8pUdVoJj+iqvWMfEh43XP/2IRv2iqUFJ9+CPu5guJg=;
 b=mi+gNlj5kvTNWRUXTO+GlAhht1v/I2zqJSvwJmVL8LknaXZ8BO3Ixq+EAujBKjj6+vr6
 Mujw+0J//4wOoUsccW1Sk2X0L1d2X+UljMG1NczKR4gJoYp1ZDS5rfGy8IWDOK06SFGo
 /6MEU8A9fTWO0QVBwU3A1+xsMxbeJI7LTvhMXK5L+FGsjhjII0ZPOak1RMWN0tfdlGFH
 LkViL/XwAE9gAiDK8A066ln3Es5Kb71ZQ8yMRXoewv7QokiPxin5uWJblhjjYAgix1CE
 2Vax56S0WSx8MJOn9q78tUtKAwmls3JFwonYoXRcnf4lrKk7w0ZZWlZw6NmdDWx6iu9j vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668cnws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:33:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CDEC100034;
 Tue, 14 Apr 2020 11:33:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 721F82AC2FE;
 Tue, 14 Apr 2020 11:33:57 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 11:33:56 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:33:56 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/11] board: stm32mp1: support boot from spi-nand
Thread-Index: AQHV/P5zx8/MG75nHEOBI2dtPfjh96h4ZB4A
Date: Tue, 14 Apr 2020 09:33:56 +0000
Message-ID: <1b83e8b4-cff3-f512-4dea-c93b606c820f@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
 <20200318092245.9.I3043020b8fdd70bdd9df04665efc5d87c37168b4@changeid>
In-Reply-To: <20200318092245.9.I3043020b8fdd70bdd9df04665efc5d87c37168b4@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <358BEF6430573141B23651BAF2F8C3CE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: support boot from
	spi-nand
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

On 3/18/20 9:22 AM, Patrick Delaunay wrote:
> Manage BOOT_FLASH_SPINAND, with boot_device="spi-nand"
> and treat this value in bootcmd_stm32mp.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cpu.c                | 4 ++++
>  arch/arm/mach-stm32mp/include/mach/stm32.h | 3 +++
>  arch/arm/mach-stm32mp/spl.c                | 2 ++
>  board/st/stm32mp1/stm32mp1.c               | 2 ++
>  include/configs/stm32mp1.h                 | 5 +++--
>  5 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 9aa5794334..e14e3e47f2 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -435,6 +435,10 @@ static void setup_boot_mode(void)
>  		env_set("boot_device", "nand");
>  		env_set("boot_instance", "0");
>  		break;
> +	case BOOT_FLASH_SPINAND:
> +		env_set("boot_device", "spi-nand");
> +		env_set("boot_instance", "0");
> +		break;
>  	case BOOT_FLASH_NOR:
>  		env_set("boot_device", "nor");
>  		env_set("boot_instance", "0");
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 6daf9f7121..a9bd5bdc1b 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -79,6 +79,9 @@ enum boot_device {
>  
>  	BOOT_SERIAL_USB = 0x60,
>  	BOOT_SERIAL_USB_OTG = 0x62,
> +
> +	BOOT_FLASH_SPINAND = 0x70,
> +	BOOT_FLASH_SPINAND_1 = 0x71,
>  };
>  
>  /* TAMP registers */
> diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
> index ca4231cd0d..9cd7b418a4 100644
> --- a/arch/arm/mach-stm32mp/spl.c
> +++ b/arch/arm/mach-stm32mp/spl.c
> @@ -39,6 +39,8 @@ u32 spl_boot_device(void)
>  		return BOOT_DEVICE_NAND;
>  	case BOOT_FLASH_NOR_QSPI:
>  		return BOOT_DEVICE_SPI;
> +	case BOOT_FLASH_SPINAND_1:
> +		return BOOT_DEVICE_NONE; /* SPINAND not supported in SPL */
>  	}
>  
>  	return BOOT_DEVICE_MMC1;
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 14c56a0f24..423be23555 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -789,6 +789,7 @@ enum env_location env_get_location(enum env_operation op, int prio)
>  #endif
>  #ifdef CONFIG_ENV_IS_IN_UBI
>  	case BOOT_FLASH_NAND:
> +	case BOOT_FLASH_SPINAND:
>  		return ENVL_UBI;
>  #endif
>  #ifdef CONFIG_ENV_IS_IN_SPI_FLASH
> @@ -829,6 +830,7 @@ int ft_board_setup(void *blob, bd_t *bd)
>  #ifdef CONFIG_FDT_FIXUP_PARTITIONS
>  	struct node_info nodes[] = {
>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
> +		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
>  	};
>  	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index c5b09f1a2a..c34a720e0c 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -127,7 +127,7 @@
>   * bootcmd for stm32mp1:
>   * for serial/usb: execute the stm32prog command
>   * for mmc boot (eMMC, SD card), boot only on the same device
> - * for nand boot, boot with on ubifs partition on nand
> + * for nand or spi-nand boot, boot with on ubifs partition on UBI partition
>   * for nor boot, use the default order
>   */
>  #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
> @@ -138,7 +138,8 @@
>  		"run env_check;" \
>  		"if test ${boot_device} = mmc;" \
>  		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
> -		"if test ${boot_device} = nand;" \
> +		"if test ${boot_device} = nand ||" \
> +		  " test ${boot_device} = spi-nand ;" \
>  		"then env set boot_targets ubifs0; fi;" \
>  		"run distro_bootcmd;" \
>  	"fi;\0"

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
