Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21741A7757
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:28:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 757C2C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:28:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06AEFC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:28:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9Rf2Q031103; Tue, 14 Apr 2020 11:28:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JxbR+F1TkwBrbVmotydDwfdtYS0HMHUm9Cc+lTDP1UY=;
 b=x7BfYsObKB17csweXS+d7t3bW84TFxLh0FHpoLsVCzroseWT9UdKxO0ZzLIZYnzxjP9W
 VZjpq1nsfXyc+szhUmq4FgRalJ/+3c6EKcDF+BesIeMvaEegF+NWpHdhSQlP69DWMWgl
 Qew2Tp+yD5DKPfwGbkcipwKv5ucOdv6VZhvu456OsCoiK0VPl+5/mB2sy6y8ZNjZCCFG
 +1g5icP2P4Vqufe5IvVzf0nwLNdoxLMAnctXzEskXVlZktYRb5sOL6yt6IUqYE41lWbN
 3pkfGjxBb4w9DZNfgwruv9MtDRBfkEp4VEJ9XMR1vvxa2mSe2C5h+BqOXEwsQp6QshPb 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5sjvrht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:28:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4CF93100038;
 Tue, 14 Apr 2020 11:28:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 401252AAA05;
 Tue, 14 Apr 2020 11:28:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 11:28:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:28:15 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 04/11] stm32mp1: move MTDPART configuration
 in Kconfig
Thread-Index: AQHWEj8GTNmkb41LWk2Na/a+Fi0Hjg==
Date: Tue, 14 Apr 2020 09:28:15 +0000
Message-ID: <20f8204a-bd83-7fcc-9160-d03716ba21b7@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
 <20200318082254.7522-5-patrick.delaunay@st.com>
In-Reply-To: <20200318082254.7522-5-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <ED44BB337F82E74A91CB1334ACB867A7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 04/11] stm32mp1: move MTDPART
 configuration in Kconfig
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
> This patch reduces the stm32mp1 environment size and builds
> dynamically the MTD partitions with information from defconfig
> (CONFIG_MTDPARTS_...).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice


>  board/st/common/Kconfig            | 57 ++++++++++++++++++
>  board/st/common/stm32mp_mtdparts.c | 93 +++++++++++++++---------------
>  include/configs/stm32mp1.h         | 22 -------
>  3 files changed, 104 insertions(+), 68 deletions(-)
>
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> index 08df845982..015ba40939 100644
> --- a/board/st/common/Kconfig
> +++ b/board/st/common/Kconfig
> @@ -6,6 +6,63 @@ config CMD_STBOARD
>  	  This compile the stboard command to
>  	  read and write the board in the OTP.
>  
> +config MTDPARTS_NAND0_BOOT
> +	string "mtd boot partitions for nand0"
> +	default "2m(fsbl),2m(ssbl1),2m(ssbl2)"
> +	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
> +	help
> +	  This define the partitions of nand0 used to build mtparts dynamically
> +	  for boot from nand0.
> +	  Each partition need to be aligned with the device erase block size,
> +	  512KB is the max size for the NAND supported by stm32mp1 platform.
> +
> +config MTDPARTS_NAND0_TEE
> +	string "mtd tee partitions for nand0"
> +	default "512k(teeh),512k(teed),512k(teex)"
> +	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
> +	help
> +	  This define the tee partitions added in mtparts dynamically
> +	  when tee is supported with boot from nand0.
> +	  Each partition need to be aligned with the device erase block size,
> +	  512KB is the max size for the NAND supported by stm32mp1 platform.
> +
> +config MTDPARTS_NOR0_BOOT
> +	string "mtd boot partitions for nor0"
> +	default "256k(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env)"
> +	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
> +	help
> +	  This define the partitions of nand0 used to build mtparts dynamically
> +	  for boot from nor0.
> +	  Each partition need to be aligned with the device erase block size,
> +	  with 256KB we support all the NOR.
> +	  U-Boot env partition (512kB) use 2 erase block for redundancy.
> +
> +config MTDPARTS_NOR0_TEE
> +	string "mtd tee partitions for nor0"
> +	default "256k(teeh),256k(teed),256k(teex)"
> +	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
> +	help
> +	  This define the tee partitions added in mtparts dynamically
> +	  when tee is supported with boot from nor0.
> +
> +config MTDPARTS_SPINAND0_BOOT
> +	string "mtd boot partitions for spi-nand0"
> +	default "2m(fsbl),2m(ssbl1),2m(ssbl2)"
> +	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
> +	help
> +	  This define the partitions of nand0 used to build mtparts dynamically
> +	  for boot from spi-nand0,
> +	  512KB is the max size for the NAND supported by stm32mp1 platform.
> +
> +config MTDPARTS_SPINAND0_TEE
> +	string "mtd tee partitions for spi-nand0"
> +	default "512k(teeh),512k(teed),512k(teex)"
> +	depends on SYS_MTDPARTS_RUNTIME && ARCH_STM32MP
> +	help
> +	  This define the tee partitions added in mtparts dynamically
> +	  when tee is supported with boot from spi-nand0,
> +	  512KB is the max size for the NAND supported by stm32mp1 platform.
> +
>  config DFU_ALT_RAM0
>  	string "dfu for ram0"
>  	default "uImage ram 0xc2000000 0x2000000;devicetree.dtb ram 0xc4000000 0x100000;uramdisk.image.gz ram 0xc4400000 0x10000000"
> diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
> index d77e075864..d4c0a7db9f 100644
> --- a/board/st/common/stm32mp_mtdparts.c
> +++ b/board/st/common/stm32mp_mtdparts.c
> @@ -19,54 +19,42 @@
>  DECLARE_GLOBAL_DATA_PTR;
>  
>  /**
> - * The mtdparts_nand0 and mtdparts_nor0 variable tends to be long.
> - * If we need to access it before the env is relocated, then we need
> - * to use our own stack buffer. gd->env_buf will be too small.
> - *
> - * @param buf temporary buffer pointer MTDPARTS_LEN long
> - * @return mtdparts variable string, NULL if not found
> - */
> -static const char *env_get_mtdparts(const char *str, char *buf)
> -{
> -	if (gd->flags & GD_FLG_ENV_READY)
> -		return env_get(str);
> -	if (env_get_f(str, buf, MTDPARTS_LEN) != -1)
> -		return buf;
> -
> -	return NULL;
> -}
> -
> -/**
> - * update the variables "mtdids" and "mtdparts" with content of mtdparts_<dev>
> + * update the variables "mtdids" and "mtdparts" with boot, tee and user strings
>   */
>  static void board_get_mtdparts(const char *dev,
>  			       char *mtdids,
> -			       char *mtdparts)
> +			       char *mtdparts,
> +			       const char *boot,
> +			       const char *tee,
> +			       const char *user)
>  {
> -	char env_name[32] = "mtdparts_";
> -	char tmp_mtdparts[MTDPARTS_LEN];
> -	const char *tmp;
> -
> -	/* name of env variable to read = mtdparts_<dev> */
> -	strcat(env_name, dev);
> -	tmp = env_get_mtdparts(env_name, tmp_mtdparts);
> -	if (tmp) {
> -		/* mtdids: "<dev>=<dev>, ...." */
> -		if (mtdids[0] != '\0')
> -			strcat(mtdids, ",");
> -		strcat(mtdids, dev);
> -		strcat(mtdids, "=");
> -		strcat(mtdids, dev);
> -
> -		/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
> -		if (mtdparts[0] != '\0')
> -			strncat(mtdparts, ";", MTDPARTS_LEN);
> -		else
> -			strcat(mtdparts, "mtdparts=");
> -		strncat(mtdparts, dev, MTDPARTS_LEN);
> -		strncat(mtdparts, ":", MTDPARTS_LEN);
> -		strncat(mtdparts, tmp, MTDPARTS_LEN);
> +	/* mtdids: "<dev>=<dev>, ...." */
> +	if (mtdids[0] != '\0')
> +		strcat(mtdids, ",");
> +	strcat(mtdids, dev);
> +	strcat(mtdids, "=");
> +	strcat(mtdids, dev);
> +
> +	/* mtdparts: "mtdparts=<dev>:<mtdparts_<dev>>;..." */
> +	if (mtdparts[0] != '\0')
> +		strncat(mtdparts, ";", MTDPARTS_LEN);
> +	else
> +		strcat(mtdparts, "mtdparts=");
> +
> +	strncat(mtdparts, dev, MTDPARTS_LEN);
> +	strncat(mtdparts, ":", MTDPARTS_LEN);
> +
> +	if (boot) {
> +		strncat(mtdparts, boot, MTDPARTS_LEN);
> +		strncat(mtdparts, ",", MTDPARTS_LEN);
> +	}
> +
> +	if (CONFIG_IS_ENABLED(STM32MP1_OPTEE) && tee) {
> +		strncat(mtdparts, tee, MTDPARTS_LEN);
> +		strncat(mtdparts, ",", MTDPARTS_LEN);
>  	}
> +
> +	strncat(mtdparts, user, MTDPARTS_LEN);
>  }
>  
>  void board_mtdparts_default(const char **mtdids, const char **mtdparts)
> @@ -76,6 +64,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  	static char parts[3 * MTDPARTS_LEN + 1];
>  	static char ids[MTDIDS_LEN + 1];
>  	static bool mtd_initialized;
> +	bool tee = false;
>  
>  	if (mtd_initialized) {
>  		*mtdids = ids;
> @@ -83,6 +72,9 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  		return;
>  	}
>  
> +	if (CONFIG_IS_ENABLED(STM32MP1_OPTEE))
> +		tee = true;
> +
>  	memset(parts, 0, sizeof(parts));
>  	memset(ids, 0, sizeof(ids));
>  
> @@ -95,18 +87,27 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  
>  	mtd = get_mtd_device_nm("nand0");
>  	if (!IS_ERR_OR_NULL(mtd)) {
> -		board_get_mtdparts("nand0", ids, parts);
> +		board_get_mtdparts("nand0", ids, parts,
> +				   CONFIG_MTDPARTS_NAND0_BOOT,
> +				   tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
> +				   "-(UBI)");
>  		put_mtd_device(mtd);
>  	}
>  
>  	mtd = get_mtd_device_nm("spi-nand0");
>  	if (!IS_ERR_OR_NULL(mtd)) {
> -		board_get_mtdparts("spi-nand0", ids, parts);
> +		board_get_mtdparts("spi-nand0", ids, parts,
> +				   CONFIG_MTDPARTS_SPINAND0_BOOT,
> +				   tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
> +				   "-(UBI)");
>  		put_mtd_device(mtd);
>  	}
>  
>  	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
> -		board_get_mtdparts("nor0", ids, parts);
> +		board_get_mtdparts("nor0", ids, parts,
> +				   CONFIG_MTDPARTS_NOR0_BOOT,
> +				   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
> +				   "-(nor_user)");
>  
>  	mtd_initialized = true;
>  	*mtdids = ids;
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index a9631d2a92..a80741f6a2 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -149,27 +149,6 @@
>  
>  #include <config_distro_bootcmd.h>
>  
> -#ifdef CONFIG_STM32MP1_OPTEE
> -/* with OPTEE: define specific MTD partitions = teeh, teed, teex */
> -#define STM32MP_MTDPARTS \
> -	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),256k(teeh),256k(teed),256k(teex),-(nor_user)\0" \
> -	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),512k(teeh),512k(teed),512k(teex),-(UBI)\0" \
> -	"mtdparts_spi-nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),"\
> -		"512k(teeh),512k(teed),512k(teex),-(UBI)\0"
> -
> -#else /* CONFIG_STM32MP1_OPTEE */
> -#define STM32MP_MTDPARTS \
> -	"mtdparts_nor0=256k(fsbl1),256k(fsbl2),2m(ssbl),256k(u-boot-env),-(nor_user)\0" \
> -	"mtdparts_nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0" \
> -	"mtdparts_spi-nand0=2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI)\0"
> -
> -#endif /* CONFIG_STM32MP1_OPTEE */
> -
> -#ifndef CONFIG_SYS_MTDPARTS_RUNTIME
> -#undef STM32MP_MTDPARTS
> -#define STM32MP_MTDPARTS
> -#endif
> -
>  /*
>   * memory layout for 32M uncompressed/compressed kernel,
>   * 1M fdt, 1M script, 1M pxe and 1M for splashimage
> @@ -188,7 +167,6 @@
>  	"env_check=if test $env_default -eq 1;"\
>  		" then env set env_default 0;env save;fi\0" \
>  	STM32MP_BOOTCMD \
> -	STM32MP_MTDPARTS \
>  	BOOTENV \
>  	"boot_net_usb_start=true\0"
>  
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
