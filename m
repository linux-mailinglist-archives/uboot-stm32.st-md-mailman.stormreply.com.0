Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA801A7759
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:29:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CB4C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:29:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4281C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:29:03 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9Rsbt015674; Tue, 14 Apr 2020 11:29:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=AE5B+GFGKNA6voF7jEJIDXhg/Scjy/nWUGvvixBBlHc=;
 b=E2rdGudMJmj+koDvY/weapdHO+KockFxnFCvpSubb/sAF+MEQbKoETCXXk5f/revgtdQ
 r8DvjVaELOCurnxCMjbnfBUQ9fxt0uVfdovlLbcjQqAro3kQ977LR2/1tpetqpbjdgkd
 rxZuVKUdVXxXTo0MvS3JZ5eTFfrdOncOLzExI4TwXFED2rcBkbNaB0rE0GWGIYePOZch
 jTzEXarfC3O5+tD88wrudkHzDc0HWxGEFK3hexxOR+WpAr7rIHY/Rx/BQ11mujIpaWR1
 y5S9ce/dI7cnyYBubGN5rwIidZN3eN3efTrh5HAha7jZCRLXyT42Ul6Y35hMZNkjkE/S HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b668cn1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:29:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6966610003A;
 Tue, 14 Apr 2020 11:28:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 602842AC2D2;
 Tue, 14 Apr 2020 11:28:58 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 14 Apr
 2020 11:28:58 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:28:57 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 10/11] board: stm32mp1: adapt MTD partition
 for BOOT from NOR or NAND
Thread-Index: AQHWEj8fLxqk2bRQKkid0zCinHzX5Q==
Date: Tue, 14 Apr 2020 09:28:57 +0000
Message-ID: <5c39b855-2709-f175-f915-5ec9f525f48f@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
 <20200318082254.7522-8-patrick.delaunay@st.com>
In-Reply-To: <20200318082254.7522-8-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <A1DAC59191439F45A506230DDBFE7247@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 10/11] board: stm32mp1: adapt MTD
 partition for BOOT from NOR or NAND
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
> Dynamically adapt the MTD partitions in NAND and SPI-NAND when boot from
> NOR or NAND/SPI-NAND is detected.
>
> This patch avoids to define the save MTD partition name for NOR and NAND
> devices and issue with latest kernel: only the needed MTD partitions
> are defined.
>
> For boot from NOR
> 1/ bootloader (TF-A, U-Boot and OP-TE) in NOR
> 2/ one large UBI partition in NAND
>
> For boot from NAND
> 1/ bootloader (TF-A, U-Boot and OP-TE) in MTD raw partition
> 2/ one large UBI partition
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>
> # Conflicts:
> #	board/st/common/stm32mp_mtdparts.c
> ---
>
>  board/st/common/stm32mp_mtdparts.c | 81 ++++++++++++++++++++++--------
>  1 file changed, 60 insertions(+), 21 deletions(-)
>
> diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
> index 2b6413be16..5028511077 100644
> --- a/board/st/common/stm32mp_mtdparts.c
> +++ b/board/st/common/stm32mp_mtdparts.c
> @@ -10,6 +10,7 @@
>  #include <mtd.h>
>  #include <mtd_node.h>
>  #include <tee.h>
> +#include <asm/arch/sys_proto.h>
>  
>  #define MTDPARTS_LEN		256
>  #define MTDIDS_LEN		128
> @@ -22,7 +23,7 @@ DECLARE_GLOBAL_DATA_PTR;
>  /**
>   * update the variables "mtdids" and "mtdparts" with boot, tee and user strings
>   */
> -static void board_get_mtdparts(const char *dev,
> +static void board_set_mtdparts(const char *dev,
>  			       char *mtdids,
>  			       char *mtdparts,
>  			       const char *boot,
> @@ -65,7 +66,7 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  	static char parts[3 * MTDPARTS_LEN + 1];
>  	static char ids[MTDIDS_LEN + 1];
>  	static bool mtd_initialized;
> -	bool tee = false;
> +	bool tee, nor, nand, spinand;
>  
>  	if (mtd_initialized) {
>  		*mtdids = ids;
> @@ -73,6 +74,28 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  		return;
>  	}
>  
> +	tee = false;
> +	nor = false;
> +	nand = false;
> +	spinand = false;
> +
> +	switch (get_bootmode() & TAMP_BOOT_DEVICE_MASK) {
> +	case BOOT_SERIAL_UART:
> +	case BOOT_SERIAL_USB:
> +		break;
> +	case BOOT_FLASH_NAND:
> +		nand = true;
> +		break;
> +	case BOOT_FLASH_SPINAND:
> +		spinand = true;
> +		break;
> +	case BOOT_FLASH_NOR:
> +		nor = true;
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	if (CONFIG_IS_ENABLED(OPTEE) &&
>  	    tee_find_device(NULL, NULL, NULL, NULL))
>  		tee = true;
> @@ -87,29 +110,45 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>  		pr_debug("mtd device = %s\n", dev->name);
>  	}
>  
> -	mtd = get_mtd_device_nm("nand0");
> -	if (!IS_ERR_OR_NULL(mtd)) {
> -		board_get_mtdparts("nand0", ids, parts,
> -				   CONFIG_MTDPARTS_NAND0_BOOT,
> -				   tee ? CONFIG_MTDPARTS_NAND0_TEE : NULL,
> -				   "-(UBI)");
> -		put_mtd_device(mtd);
> +	if (nor || nand) {
> +		mtd = get_mtd_device_nm("nand0");
> +		if (!IS_ERR_OR_NULL(mtd)) {
> +			const char *mtd_boot = CONFIG_MTDPARTS_NAND0_BOOT;
> +			const char *mtd_tee = CONFIG_MTDPARTS_NAND0_TEE;
> +
> +			board_set_mtdparts("nand0", ids, parts,
> +					   !nor ? mtd_boot : NULL,
> +					   !nor && tee ? mtd_tee : NULL,
> +					   "-(UBI)");
> +			put_mtd_device(mtd);
> +		}
>  	}
>  
> -	mtd = get_mtd_device_nm("spi-nand0");
> -	if (!IS_ERR_OR_NULL(mtd)) {
> -		board_get_mtdparts("spi-nand0", ids, parts,
> -				   CONFIG_MTDPARTS_SPINAND0_BOOT,
> -				   tee ? CONFIG_MTDPARTS_SPINAND0_TEE : NULL,
> -				   "-(UBI)");
> -		put_mtd_device(mtd);
> +	if (nor || spinand) {
> +		mtd = get_mtd_device_nm("spi-nand0");
> +		if (!IS_ERR_OR_NULL(mtd)) {
> +			const char *mtd_boot = CONFIG_MTDPARTS_SPINAND0_BOOT;
> +			const char *mtd_tee = CONFIG_MTDPARTS_SPINAND0_TEE;
> +
> +			board_set_mtdparts("spi-nand0", ids, parts,
> +					   !nor ? mtd_boot : NULL,
> +					   !nor && tee ? mtd_tee : NULL,
> +					   "-(UBI)");
> +			put_mtd_device(mtd);
> +		}
>  	}
>  
> -	if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev))
> -		board_get_mtdparts("nor0", ids, parts,
> -				   CONFIG_MTDPARTS_NOR0_BOOT,
> -				   tee ? CONFIG_MTDPARTS_NOR0_TEE : NULL,
> -				   "-(nor_user)");
> +	if (nor) {
> +		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
> +			const char *mtd_boot = CONFIG_MTDPARTS_NOR0_BOOT;
> +			const char *mtd_tee = CONFIG_MTDPARTS_NOR0_TEE;
> +
> +			board_set_mtdparts("nor0", ids, parts,
> +					   mtd_boot,
> +					   tee ? mtd_tee : NULL,
> +					   "-(nor_user)");
> +		}
> +	}
>  
>  	mtd_initialized = true;
>  	*mtdids = ids;


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
