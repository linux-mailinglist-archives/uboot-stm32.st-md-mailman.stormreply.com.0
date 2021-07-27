Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6B93D71B4
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 11:08:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C6CEC597AB;
	Tue, 27 Jul 2021 09:08:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 462B7C5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 09:08:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R985Cn023421; Tue, 27 Jul 2021 11:08:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YUQsZ3ZVD2OrVJCB9msNSCZk/KvmfZihtKI1K2fEloU=;
 b=1TAIzWudzWY7dLEhRUaQ2+e3R6Xk9/UtiqW6bpqfT7+UNT4EdPE5WHJFyUvuRe8pHo8D
 Kb1vEVa8S4Ac0RlSpRrpOJnqL4YRohsQ9G+DlpGsIvAI3DmL+FKfmofdFnjvvt/8ZPnw
 t4JatgX4c+w/rGMmPnBae/yNHMBYr3C/dQt3HSqU3O7WEFUTkzsAchEymqbnWtRzzr23
 BXOnxNSvZMYM2ntEDLsnPgzLhv8o6ECYyvxxyqpYihVwdIUZbWBsCILHOp6sNkhX6Gn3
 /HghsMsuptcEsZonPHrupAA24d0JNDq+paBlB6G+0NN2D6UwYEZiY8nv79nyQPdhNQig jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a235gb9mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 11:08:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DED3410002A;
 Tue, 27 Jul 2021 11:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D02F721B53E;
 Tue, 27 Jul 2021 11:08:34 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 27 Jul
 2021 11:08:34 +0200
To: <u-boot@lists.denx.de>
References: <20210708105353.1.If5e2c9dc73be2ddb58f1495b4f41186cda743798@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <178a7c00-568c-012b-2216-346fd9f4911b@foss.st.com>
Date: Tue, 27 Jul 2021 11:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708105353.1.If5e2c9dc73be2ddb58f1495b4f41186cda743798@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 7/8/21 10:53 AM, Patrick Delaunay wrote:
> When the TAMP register 20 have an invalid value (0x0 for example after
> TAMPER error) the "boot_device" U-Boot env variable have no value and
> no error is displayed in U-Boot log.
>
> The STM32MP boot command bootcmd_stm32mp failed with strange trace:
>    "Boot over !"
>
> and the next command in bootcmd_stm32mp failed with few indication:
>    if test ${boot_device} = serial || test ${boot_device} = usb;
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
>   arch/arm/mach-stm32mp/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
