Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A3394305
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 14:54:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19666C5718D;
	Fri, 28 May 2021 12:54:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77035C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 12:54:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCqLDP014397; Fri, 28 May 2021 14:54:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z1ODv9csSisyVm1fpnYUXlO7W/gBwSFtcLtGXS/Zh+U=;
 b=m6mbWcoNIFwkZDe53q/1AgEY9gLv8N6mqzvT7OG8OwUHeSD3Wi7G5zgCu/ViDXtr+1e8
 VRoB6de8KwgWi/225dnfTjt0sihpsxrghQe5CCRKEG66qYgg/VSmVLxPrQNG9jQ/yvPp
 RRirZXTOBwYZeV0xbdVt9Tpm4nEinkJbB3pBUn67ugrQn0y/SNhtnv1GmNSZKBPSbDJK
 nSVHm2/EWZSsWaprmHkscXQD24zIkq4GuRXWKlcVIl2I/TqhLrTPnb8YEoDFb6jOKD9I
 DuQqkCerBF6wuRmTHqGc/mniFhIb2Z1xTvGMFZAiOZdfUAxYDK6+P+xGWFjv5e6eMu1v EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38u03c08b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 14:54:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 235FF10002A;
 Fri, 28 May 2021 14:54:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 186A52291B2;
 Fri, 28 May 2021 14:54:20 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 14:54:19 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.7.I874b9d67ab66c4a1b44c880721f697effa226c5b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <c095a130-dffb-2bad-e952-4c2e39803b49@foss.st.com>
Date: Fri, 28 May 2021 14:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210518151206.7.I874b9d67ab66c4a1b44c880721f697effa226c5b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 07/10] stm32mp: stm32prog: use get_cpu_dev
 for GetID command
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

On 5/18/21 3:12 PM, Patrick Delaunay wrote:
> Use get_cpu_dev() in uart getID command and remove the defines
> DEVICE_ID_BYTE1 and 2 defines.
> 
> This patch prepare the support for new SOC family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> index 2550ae6a2b..7de62668fe 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
> @@ -10,6 +10,7 @@
>  #include <malloc.h>
>  #include <serial.h>
>  #include <watchdog.h>
> +#include <asm/arch/sys_proto.h>
>  #include <dm/lists.h>
>  #include <dm/device-internal.h>
>  #include <linux/delay.h>
> @@ -19,8 +20,7 @@
>  /* - configuration part -----------------------------*/
>  #define USART_BL_VERSION	0x40	/* USART bootloader version V4.0*/
>  #define UBOOT_BL_VERSION	0x03	/* bootloader version V0.3*/
> -#define DEVICE_ID_BYTE1		0x05	/* MSB byte of device ID*/
> -#define DEVICE_ID_BYTE2		0x00	/* LSB byte of device ID*/
> +
>  #define USART_RAM_BUFFER_SIZE	256	/* Size of USART_RAM_Buf buffer*/
>  
>  /* - Commands -----------------------------*/
> @@ -436,10 +436,12 @@ static void get_version_command(struct stm32prog_data *data)
>   */
>  static void get_id_command(struct stm32prog_data *data)
>  {
> +	u32 cpu = get_cpu_dev();
> +
>  	/* Send Device IDCode */
>  	stm32prog_serial_putc(0x1);
> -	stm32prog_serial_putc(DEVICE_ID_BYTE1);
> -	stm32prog_serial_putc(DEVICE_ID_BYTE2);
> +	stm32prog_serial_putc((cpu >> 8) & 0xFF);
> +	stm32prog_serial_putc(cpu & 0xFF);
>  	stm32prog_serial_result(ACK_BYTE);
>  }
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
