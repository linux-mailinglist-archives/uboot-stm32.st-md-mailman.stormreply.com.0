Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC33C21CB
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Jul 2021 11:49:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F32E0C424BD;
	Fri,  9 Jul 2021 09:49:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46885C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 09:49:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1699f89o013829; Fri, 9 Jul 2021 11:49:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DMErP0i0bmlmWIYSkacdlKspXQcNZOH0hwPXwAFLClw=;
 b=N7GWcT7pxlTr9F0fQqKBG6zCmoa73bYMb8LxwbspraVaX/USrxi6/50iC+COkxVwXkBD
 X14uRHe5lxzH6BYwwdxGypXaPhBznSOy1g+qRQfQSsAZIzKGRdiYwL9aifJpk5q3a7eA
 UqY9sKo5egrZdAQB+KnioabP5t6/Jw/ikE2AihiPOsTZAwlW7VRwqLl3DkE4XK81uXbu
 GAmgxcQxZ1i4fO+ZRoEAnnlRKxAIbfsA8vkBeecX6Rs9sJz0DBd+r80tv9hjofqmE2W0
 R7iSDuZOZgaUuQAZu6BFciJppmqf7ysoiRWmG4dhhlSHwqBff4tTtkgB8CQdHvDAKN74 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39p4vbc53h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 11:49:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF050100038;
 Fri,  9 Jul 2021 11:49:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99F4A21B535;
 Fri,  9 Jul 2021 11:49:24 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 11:49:23 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210708105353.1.If5e2c9dc73be2ddb58f1495b4f41186cda743798@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <4c05c6c8-5c6c-d705-22c8-59e8291a3ee9@foss.st.com>
Date: Fri, 9 Jul 2021 11:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708105353.1.If5e2c9dc73be2ddb58f1495b4f41186cda743798@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_04:2021-07-09,
 2021-07-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp1: force boot_device variable
 for invalid TAMP register value
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

On 7/8/21 10:53 AM, Patrick Delaunay wrote:
> When the TAMP register 20 have an invalid value (0x0 for example after
> TAMPER error) the "boot_device" U-Boot env variable have no value and
> no error is displayed in U-Boot log.
> 
> The STM32MP boot command bootcmd_stm32mp failed with strange trace:
>   "Boot over !"
> 
> and the next command in bootcmd_stm32mp failed with few indication:
>   if test ${boot_device} = serial || test ${boot_device} = usb;
> 	then stm32prog ${boot_device} ${boot_instance};
> 
> As it is difficult to investigate, the current patch avoids this issue:
> - change the debug message to error: "unexpected boot mode" is displayed
> - display trace "Boot over invalid!" in bootcmd_stm32mp
> - execute "run distro_bootcmd" to try all the possible target
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 592bfd413d..5ea1ddc497 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -542,7 +542,9 @@ static void setup_boot_mode(void)
>  		env_set("boot_instance", "0");
>  		break;
>  	default:
> -		log_debug("unexpected boot mode = %x\n", boot_mode);
> +		env_set("boot_device", "invalid");
> +		env_set("boot_instance", "");
> +		log_err("unexpected boot mode = %x\n", boot_mode);
>  		break;
>  	}
>  
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
