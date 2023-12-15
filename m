Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2017C814776
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 12:58:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5D94C6B45B;
	Fri, 15 Dec 2023 11:58:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98F6EC65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 11:58:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BF9hv5X018594; Fri, 15 Dec 2023 12:58:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=n4JCG+nxJsygtROkWxYjTijXeNsI8zsKB4TLL0KQ/8U=; b=dB
 pZV+8ODtjO3YT6MmTNtBv39LnvHMMnNuR1Qdq2V/r0koSW/+zer+uBapajWBSUTW
 z4YBvqCsoxW7BJfnmKe4R93rzV1hJzqDZm8HPyZFiELQFF7dHDXgTGH1ms2JuKqL
 /LueBtBPD+xMkcLisUXDJ6ugmJXOTh6WG3ifcHw/kCUNZeZCEXCEoYtWW3Q9A8TN
 Q3KDgaYjwuMHf0Cg0JuB/63WEmMNB4ldXlSSaa3IrIbC8pe3cgPeqGavbCSD1CHm
 ME4bu7SCXJd9MQNT8QSceZdyUW4WmRUvn0+G80bLIPh8uxw9RRIoiMRZAPKpWprt
 p8h1bnPBobCDTM+xcZ1A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uyb2k9jnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 12:58:01 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8021C100052;
 Fri, 15 Dec 2023 12:58:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 772BE215BFD;
 Fri, 15 Dec 2023 12:58:00 +0100 (CET)
Received: from [10.201.22.165] (10.201.22.165) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 12:57:59 +0100
Message-ID: <d6c9f0fa-863f-4e21-8a6e-d16b982ff5b7@foss.st.com>
Date: Fri, 15 Dec 2023 12:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20231214165112.2182274-1-sjg@chromium.org>
 <20231214165112.2182274-16-sjg@chromium.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20231214165112.2182274-16-sjg@chromium.org>
X-Originating-IP: [10.201.22.165]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_06,2023-12-14_01,2023-05-22_02
Cc: Sean Anderson <sean.anderson@seco.com>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 20/21] stm32: Use bootm_run() and
	bootz_run()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 12/14/23 17:50, Simon Glass wrote:
> Use the new bootm/z_run() functions to avoid having to create an
> argument list for the stm32prog code.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> (no changes since v1)
>
>   .../cmd_stm32prog/cmd_stm32prog.c             | 20 ++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 8670535844d3..3ed393b7199f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <common.h>
> +#include <bootm.h>
>   #include <command.h>
>   #include <dfu.h>
>   #include <image.h>
> @@ -125,12 +126,10 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>   		char dtb_addr[20];
>   		char initrd_addr[40];
>   		char *fdt_arg, *initrd_arg;
> -		char *bootm_argv[5] = {
> -			"bootm", boot_addr_start,
> -		};
>   		const void *uimage = (void *)data->uimage;
>   		const void *dtb = (void *)data->dtb;
>   		const void *initrd = (void *)data->initrd;
> +		struct bootm_info bmi;
>   
>   		fdt_arg = dtb_addr;
>   		if (!dtb)
> @@ -141,7 +140,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>   		snprintf(boot_addr_start, sizeof(boot_addr_start) - 1,
>   			 "0x%p", uimage);
>   
> -		initrd_arg = "-";
> +		initrd_arg = NULL;
>   		if (initrd) {
>   			snprintf(initrd_addr, sizeof(initrd_addr) - 1,
>   				 "0x%p:0x%zx", initrd, data->initrd_size);
> @@ -149,15 +148,18 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>   		}
>   
>   		printf("Booting kernel at %s %s %s...\n\n\n", boot_addr_start,
> -		       initrd_arg, fdt_arg);
> -		bootm_argv[2] = initrd_arg;
> -		bootm_argv[3] = fdt_arg;
> +		       initrd_arg ?: "-", fdt_arg);
> +
> +		bootm_init(&bmi);
> +		bmi.addr_fit = boot_addr_start;
> +		bmi.conf_ramdisk = initrd_arg;
> +		bmi.conf_fdt = fdt_arg;
>   
>   		/* Try bootm for legacy and FIT format image */
>   		if (genimg_get_format(uimage) != IMAGE_FORMAT_INVALID)
> -			do_bootm(cmdtp, 0, 4, bootm_argv);
> +			bootm_run(&bmi);
>   		else if (IS_ENABLED(CONFIG_CMD_BOOTZ))
> -			do_bootz(cmdtp, 0, 4, bootm_argv);
> +			bootz_run(&bmi);
>   	}
>   	if (data->script)
>   		cmd_source_script(data->script, NULL, NULL);



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
