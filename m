Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B50520ECE
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:41:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC53C035BF;
	Tue, 10 May 2022 07:31:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C89B4C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:31:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A45Iso011169;
 Tue, 10 May 2022 09:30:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=18akVmV9KL8HoHoBdDjENBSRz7YHX1pwLUU8F48jjJ4=;
 b=BXFyK85T8/WWMLYkxcVKn7zjOz1/cT7UmIf3tIrP0le8ltHHhwri2csHq3OYSZ2qRQ1P
 0CDSn0A8a3DzCB2umnOVHKL/mH9t1NwXXaDqC2yAUlzZP35++J9SNzPQgNHBJ3xiXfBb
 PvjCSvjmGJPqu5+d3FU5yn2lPKXNWs2N0sgW6uSjCmeZzFe+iQOGX8vsxDXg+tD3LQqe
 5QKpXfTjf0tQRrFTo4dE5uBNj7TO+ZRIwF5Vj2DUnTLWhYg4/Y9+zmqOqoE7ZsQ/t8HI
 6FQPnigYyY1ZFVWg204Oa3dHpPNlT4aJESfXs0Ij39tJXbyyx0edgOADjFP3QzwB1ybm bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwfngg3s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:30:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28C2810002A;
 Tue, 10 May 2022 09:30:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1EC7F212316;
 Tue, 10 May 2022 09:30:07 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:30:06 +0200
Message-ID: <f31aca32-3480-b604-13e1-e84551be098d@foss.st.com>
Date: Tue, 10 May 2022 09:30:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
 <20220328192520.7.I08598ebf2b427ac25eaf56e05799ac8d2dc42947@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220328192520.7.I08598ebf2b427ac25eaf56e05799ac8d2dc42947@changeid>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 7/8] stm32mp: stm32prog: handle U-Boot
 script in flashlayout alternate
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



On 3/28/22 19:25, Patrick Delaunay wrote:
> Update the stm32prog command to allow the reception of U-Boot script in
> the FlashLayout alternate during the first USB enumeration.
> 
> This patch is aligned with the last TF-A behavior: the Flashlayout
> is now loaded by U-Boot; it is no more present at STM32_DDR_BASE when
> the stm32prog is launched after a serial boot, on UART or on USB.
> 
> The received script must be a U-Boot legacy image, no more need to add
> a stm32image header.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 9 ++-------
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 9 +++++++++
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     | 2 ++
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index 3957e06e5d..f59414e716 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -76,13 +76,6 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  		stm32prog_header_check(addr, &header);
>  		if (header.type == HEADER_STM32IMAGE) {
>  			size = header.image_length + header.length;
> -
> -#if defined(CONFIG_LEGACY_IMAGE_FORMAT)
> -			/* uImage detected in STM32IMAGE, execute the script */
> -			if (IMAGE_FORMAT_LEGACY ==
> -			    genimg_get_format((void *)(addr + header.length)))
> -				return image_source_script(addr + header.length, "script@1");
> -#endif
>  		}
>  	}
>  
> @@ -160,6 +153,8 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  		else if (CONFIG_IS_ENABLED(CMD_BOOTZ))
>  			do_bootz(cmdtp, 0, 4, bootm_argv);
>  	}
> +	if (data->script)
> +		image_source_script(data->script, "script@stm32prog");
>  
>  	if (reset) {
>  		puts("Reset...\n");
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index d3b3e1ed72..65655e25ca 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -6,6 +6,7 @@
>  #include <command.h>
>  #include <console.h>
>  #include <dfu.h>
> +#include <image.h>
>  #include <malloc.h>
>  #include <misc.h>
>  #include <mmc.h>
> @@ -1697,6 +1698,14 @@ error:
>  static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
>  {
>  	if (data->phase == PHASE_FLASHLAYOUT) {
> +#if defined(CONFIG_LEGACY_IMAGE_FORMAT)
> +		if (genimg_get_format((void *)STM32_DDR_BASE) == IMAGE_FORMAT_LEGACY) {
> +			data->script = STM32_DDR_BASE;
> +			data->phase = PHASE_END;
> +			log_notice("U-Boot script received\n");
> +			return;
> +		}
> +#endif
>  		if (parse_flash_layout(data, STM32_DDR_BASE, 0))
>  			stm32prog_err("Layout: invalid FlashLayout");
>  		return;
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> index b3e5c74810..ac300768ca 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
> @@ -170,6 +170,8 @@ struct stm32prog_data {
>  	u32	initrd;
>  	u32	initrd_size;
>  
> +	u32	script;
> +
>  	/* OPTEE PTA NVMEM */
>  	struct udevice *tee;
>  	u32 tee_session;

Applied to u-boot-stm32

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
