Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CEA359AC6
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 12:03:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6CA0C56639;
	Fri,  9 Apr 2021 10:03:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34770C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 10:03:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139A2k3Y022259; Fri, 9 Apr 2021 12:03:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cqyx7/uEhOGaCEUVEOpTMQotXbXC8E7u8icbxjxKZcU=;
 b=YGT4c/y6nt9ey50vdodVUbaUqGDI3HJodGT4VQc9dQWdCJE/jU639i1r53tNTk+DvnmZ
 DSJ54exZiYil7TueXDMZDeJf41yqLolY7SrKbnswB3WTl7aAk2hVyUlsHH1pqq2BhQwJ
 9ChdhD45CJsR1KilBrLDuK4g7etQDoLIKhAhIGryhhaXmFDL4T1k064d/ATKvTUnGEYI
 QOW2pTXPiLu4Xw6QlZW09yVj5PzBmze4kSuU59L3mSV9CS5ReGW7gQC8Nhe5GFCfb8r2
 69j7PpOXaUkeRcK+uQSVAjDTH6OGl9O9OJFQXdCMoTpOnPqakHBT7XZRb/RpHUNkNTfS hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37tj4d969w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 12:03:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18C32100034;
 Fri,  9 Apr 2021 12:03:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DF9D229A3A;
 Fri,  9 Apr 2021 12:03:04 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Apr
 2021 12:03:03 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1b5a2429-1cf9-5dbc-d3e2-a76f39ff344f@foss.st.com>
Date: Fri, 9 Apr 2021 12:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406092731.1.Iad88039569017850ed77dfae267b261f8efc8ad7@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: update uart number in trace
 of serial device not found
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

On 4/6/21 9:27 AM, Patrick Delaunay wrote:
> Align the uart number in the trace of setup_boot_mode() with the name of
> the uart/usart device (start at 1) and not with the instance value
> (start at 0), i.e. the serial device sequence number and the index in
> serial_addr[].
> 
> Fixes: f49eb16c17e2c ("stm32mp: stm32prog: replace alias by serial
> device sequence number")
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 897ec13ad8..2f05c5e91b 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -503,7 +503,7 @@ static void setup_boot_mode(void)
>  				gd->flags &= ~(GD_FLG_SILENT |
>  					       GD_FLG_DISABLE_CONSOLE);
>  			printf("uart%d = %s not found in device tree!\n",
> -			       instance, cmd);
> +			       instance + 1, cmd);
>  			break;
>  		}
>  		sprintf(cmd, "%d", dev_seq(dev));
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
