Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3435AFCB3
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 08:41:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 557A4C0D2BF;
	Wed,  7 Sep 2022 06:41:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39DB4C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 06:41:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2875KQcs017285;
 Wed, 7 Sep 2022 08:41:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qevca9bX0ariQ2IttRY3ShnaQqLxFlK7N8DcjXS98dM=;
 b=5+3XaVItwApRABN3yCocXyxo5YnzBZLn0q04LPg0nbMAFVOJ590jiYSmBNIBEQjzSYba
 MgVPsAuoNlkQsaNHFQX18InVvCCx4U9slKMSaEddEmJV2eFBmfm35kgjExmMUYFQNv/S
 f4yS0BuYoHhM0uvSg3cwTopPrl3uC9Xbj2zgR6aNbDGrZk9i+lA4ebYHQFNuLFYtqX5E
 Kie9p6Blxn1lIiNkHQsVsR8Wa2JqJuJ0ikzzQZ9Eo8hacZf++O41iJPmUFJMZconWAgG
 kpxChyEJ8T08HcrfsShPHlv34c3dQCv+SpE8r2NcKuVuv1bzJdmPBe9ejnceR1wQGy6g 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jdcav5bmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 08:41:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB39410002A;
 Wed,  7 Sep 2022 08:41:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6928C2128A8;
 Wed,  7 Sep 2022 08:41:46 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 7 Sep 2022
 08:41:46 +0200
Message-ID: <6b1090bc-ff11-1203-bd8d-b6976580efdb@foss.st.com>
Date: Wed, 7 Sep 2022 08:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220906185314.1.I9928b88f3a453611043b484158b02efe9b0c06bf@changeid>
 <20220906185314.2.I7b7ee82b94c5a086ab8f1177294fe72a5b62c06c@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220906185314.2.I7b7ee82b94c5a086ab8f1177294fe72a5b62c06c@changeid>
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/4] stm32mp: stm32prog: change default
 flashlayout location to CONFIG_SYS_LOAD_ADDR
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

On 9/6/22 18:53, Patrick Delaunay wrote:
> Change the defaut flashlayout location, hardcoded at STM32_DDR_BASE,
> to CONFIG_SYS_LOAD_ADDR to avoid issue on board with reserved memory
> at STM32_DDR_BASE.
> 
> This patch changes the command behavior for STM32MP13 and STM32MP15
> platform, as CONFIG_SYS_LOAD_ADDR(0xc2000000) != STM32_DDR_BASE
> but without impact for serial boot with STM32CubeProgrammer.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c    | 2 +-
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c        | 8 ++++----
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c | 2 +-
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c    | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> index f59414e716f..cb9e20da136 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
> @@ -61,7 +61,7 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
>  
>  	dev = (int)dectoul(argv[2], NULL);
>  
> -	addr = STM32_DDR_BASE;
> +	addr = CONFIG_SYS_LOAD_ADDR;
>  	size = 0;
>  	if (argc > 3) {
>  		addr = hextoul(argv[3], NULL);
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> index 65e32288af7..3b2652a0e0d 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
> @@ -1388,7 +1388,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
>  		char buf[ALT_BUF_LEN];
>  
>  		sprintf(buf, "@FlashLayout/0x%02x/1*256Ke ram %x 40000",
> -			PHASE_FLASHLAYOUT, STM32_DDR_BASE);
> +			PHASE_FLASHLAYOUT, CONFIG_SYS_LOAD_ADDR);
>  		ret = dfu_alt_add(dfu, "ram", NULL, buf);
>  		log_debug("dfu_alt_add(ram, NULL,%s) result %d\n", buf, ret);
>  	}
> @@ -1699,15 +1699,15 @@ static void stm32prog_end_phase(struct stm32prog_data *data, u64 offset)
>  {
>  	if (data->phase == PHASE_FLASHLAYOUT) {
>  #if defined(CONFIG_LEGACY_IMAGE_FORMAT)
> -		if (genimg_get_format((void *)STM32_DDR_BASE) == IMAGE_FORMAT_LEGACY) {
> -			data->script = STM32_DDR_BASE;
> +		if (genimg_get_format((void *)CONFIG_SYS_LOAD_ADDR) == IMAGE_FORMAT_LEGACY) {
> +			data->script = CONFIG_SYS_LOAD_ADDR;
>  			data->phase = PHASE_END;
>  			log_notice("U-Boot script received\n");
>  			return;
>  		}
>  #endif
>  		log_notice("\nFlashLayout received, size = %lld\n", offset);
> -		if (parse_flash_layout(data, STM32_DDR_BASE, offset))
> +		if (parse_flash_layout(data, CONFIG_SYS_LOAD_ADDR, offset))
>  			stm32prog_err("Layout: invalid FlashLayout");
>  		return;
>  	}
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> index 2932eae7578..1bf5f5ae0ac 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -462,7 +462,7 @@ static void get_phase_command(struct stm32prog_data *data)
>  		length = strlen(err_msg);
>  	}
>  	if (phase == PHASE_FLASHLAYOUT)
> -		destination = STM32_DDR_BASE;
> +		destination = CONFIG_SYS_LOAD_ADDR;
>  
>  	stm32prog_serial_putc(length + 5);           /* Total length */
>  	stm32prog_serial_putc(phase & 0xFF);         /* partition ID */
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> index a8b57c4d8f0..bcb4d373f69 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
> @@ -90,7 +90,7 @@ static int stm32prog_cmd_read(u64 offset, void *buf, long *len)
>  	}
>  	phase = stm32prog_data->phase;
>  	if (phase == PHASE_FLASHLAYOUT)
> -		destination = STM32_DDR_BASE;
> +		destination = CONFIG_SYS_LOAD_ADDR;
>  	dfu_offset = stm32prog_data->offset;
>  
>  	/* mandatory header, size = PHASE_MIN_SIZE */
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
