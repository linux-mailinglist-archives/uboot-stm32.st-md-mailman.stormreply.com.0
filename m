Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E512C4113
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 14:24:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C1CBC424AF;
	Wed, 25 Nov 2020 13:24:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E35E0C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 13:24:17 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0APDMIJI008691; Wed, 25 Nov 2020 14:24:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=C6kOs7P6Eak+eGDc0TKObK5+PQh++DUclHcVleylBZI=;
 b=Aio5UWRXFhtW8aV/tGgsPop+wRCiDwRwhz2y/oi/g6kGi+THMScBEZCB2by5wRbj2uoi
 JKKXHNRfTNUDHvyOH7JcJQe0UMnTHDATVx1joQPEz6cLjlFlo/Zrr+yLA6BfwpCBo7eN
 rbY16podsyqZ8kvyKWObeg4A269djY6uXHzs4iGOyfNfgiHVEakaQPlcs819jW8C1Xyl
 IZMNJCU3ZFpS6GTJP2iRBJt+7Z9CSa7URHPVMzZySZDYvEmuEP3FGS7XNL/GYHAl6ePY
 1/MorkGPYFGZsbebiBneUBc63dX1ATlEMD+EYvIxjlpSDPy7ABSyWZLO/BpUIs0MBaAu LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05heawg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 14:24:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 918A510002A;
 Wed, 25 Nov 2020 14:24:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AF71247D18;
 Wed, 25 Nov 2020 14:24:14 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 14:24:13 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 14:24:13 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] board: st: stm32mp1: update load address for FIT examples
Thread-Index: AQHWwx4ksCEf3PXgBkmXx+A/POb8uKnYxYYA
Date: Wed, 25 Nov 2020 13:24:13 +0000
Message-ID: <cd5a2059-86da-3084-fcdf-125267989959@st.com>
References: <20201125122806.1.I077eed496ea5fded723418afa845e759df8e6c9b@changeid>
In-Reply-To: <20201125122806.1.I077eed496ea5fded723418afa845e759df8e6c9b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <D53042678648A945A44ECB36B4BC0834@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: stm32mp1: update load address
	for FIT examples
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

On 11/25/20 12:28 PM, Patrick Delaunay wrote:
> Update kernel load address for FIT examples to avoid relocation:
> - Kernel example uses Image.gz with U-Boot gzip decompression
>   at final kernel location 0x0xC0008000.
> - Copro example loads zImage at a correct location (0xC4000000),
>   to avoid zImage relocation before decompression by kernel code.
>
> An other solution to avoid zImage relocation is to align
> the kernel load and entry address with the real location in FIT
> (the relocation of zImage is skipped in U-Boot bootm command for
> identical address) but it is less flexible because this offset
> depends on FIT content:
>
> For example:
>
> ## Loading kernel from FIT Image at c2000000 ...
>    Using 'ev1' configuration
>    Trying 'kernel' kernel subimage
>      Description:  Linux kernel
>      Created:      2020-10-22   9:08:32 UTC
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0xc20000cc
>
> The kernel offset in FIT is 0xCC in FIT and zImage is decompressed at
> 0xC0008000 by kernel code:
>
> kernel {
> 	description = "Linux kernel";
> 	data = /incbin/("zImage");
> 	type = "kernel";
> 	arch = "arm";
> 	os = "linux";
> 	compression = "none";
> 	load = <0xC20000cc>;
> 	entry = <0xC20000cc>;
> 	hash-1 {
> 		algo = "sha1";
> 	};
> };
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/fit_copro_kernel_dtb.its | 18 ++++++++++++++++--
>  board/st/stm32mp1/fit_kernel_dtb.its       |  6 +++---
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/board/st/stm32mp1/fit_copro_kernel_dtb.its b/board/st/stm32mp1/fit_copro_kernel_dtb.its
> index 3e08fd943e..dc43639af4 100644
> --- a/board/st/stm32mp1/fit_copro_kernel_dtb.its
> +++ b/board/st/stm32mp1/fit_copro_kernel_dtb.its
> @@ -1,6 +1,20 @@
>  /*
>   * Compilation:
>   * mkimage -f fit_copro_kernel_dtb.its fit_copro_kernel_dtb.itb
> + *
> + * M4 firmware to load with remoteproc: rproc-m4-fw.elf
> + *
> + * Files in linux build dir:
> + * - arch/arm/boot/zImage
> + * - arch/arm/boot/dts/stm32mp157c-dk2.dtb
> + * - arch/arm/boot/dts/stm32mp157c-ev1.dtb
> + *
> + * load mmc 0:4 $kernel_addr_r fit_copro_kernel_dtb.itb
> + * bootm $kernel_addr_r
> + * bootm $kernel_addr_r#dk2
> + * bootm $kernel_addr_r#ev1
> + * bootm $kernel_addr_r#dk2-m4
> + * bootm $kernel_addr_r#ev1-m4
>   */
>  
>  /dts-v1/;
> @@ -29,8 +43,8 @@
>  			arch = "arm";
>  			os = "linux";
>  			compression = "none";
> -			load = <0xC0008000>;
> -			entry = <0xC0008000>;
> +			load = <0xC4000000>;
> +			entry = <0xC4000000>;
>  			hash-1 {
>  				algo = "sha1";
>  			};
> diff --git a/board/st/stm32mp1/fit_kernel_dtb.its b/board/st/stm32mp1/fit_kernel_dtb.its
> index 18d03ebf3c..8456a3c460 100644
> --- a/board/st/stm32mp1/fit_kernel_dtb.its
> +++ b/board/st/stm32mp1/fit_kernel_dtb.its
> @@ -3,7 +3,7 @@
>   * mkimage -f fit_kernel_dtb.its fit_kernel_dtb.itb
>   *
>   * Files in linux build dir:
> - * - arch/arm/boot/zImage
> + * - arch/arm/boot/Image (gzipped in Image.gz)
>   * - arch/arm/boot/dts/stm32mp157c-dk2.dtb
>   * - arch/arm/boot/dts/stm32mp157c-ev1.dtb
>   *
> @@ -23,11 +23,11 @@
>  	images {
>  		kernel {
>  			description = "Linux kernel";
> -			data = /incbin/("zImage");
> +			data = /incbin/("Image.gz");
>  			type = "kernel";
>  			arch = "arm";
>  			os = "linux";
> -			compression = "none";
> +			compression = "gzip";
>  			load = <0xC0008000>;
>  			entry = <0xC0008000>;
>  			hash-1 {


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
