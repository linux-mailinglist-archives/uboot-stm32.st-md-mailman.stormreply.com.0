Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13079332600
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:03:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF971C57195;
	Tue,  9 Mar 2021 13:03:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81D9EC57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:03:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129Cu9kh020423; Tue, 9 Mar 2021 14:03:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+CgsExKL/masCWJgvCo5XkR0gCy5gFLYupzhJa6H5a8=;
 b=lBjdg1/euwDo/SrJLhqOtyBzEkQcNAU026Bsle3eI1weXizD8NuJnSGMr9nYrnEVXwa2
 vLmBZ6hCJ5DmkzatgyjL9ckqxBBxZL00pICiS6plUVNih9evxI55MhlxVVyBV4lVMNRM
 r5hJeLH7zlel3LdXJZEaquE/UlXscbsYiGTmqCCZpVmq0VQ7vRrFRWmVxIqjIGwCV2ji
 vSLHna2HTvINJq6a/V65kj4HsOcZB/BvXyCmC4VQkP3uTDjLLMBMngnFoGBX0WG8aLx1
 JQTEGuTfqlwyKcJClJ+3+6IP8A8VrNCq3aeFoOYRkJg6zmU7XOo3J2dCjDWEVrN9pmFd Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6sced-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:03:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3F0E710002A;
 Tue,  9 Mar 2021 14:03:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30A8A258C56;
 Tue,  9 Mar 2021 14:03:46 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:03:44 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.4.I390560c87a294deb05e06e1ad92e02fb736ba9a0@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d1116cb0-8b31-a20c-22c2-dd502762c806@foss.st.com>
Date: Tue, 9 Mar 2021 14:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224111907.4.I390560c87a294deb05e06e1ad92e02fb736ba9a0@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 4/6] scmi: define LOG_CATEGORY
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

On 2/24/21 11:19 AM, Patrick Delaunay wrote:
> Define LOG_CATEGORY to allow filtering with log command.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/firmware/scmi/mailbox_agent.c        | 2 ++
>  drivers/firmware/scmi/sandbox-scmi_agent.c   | 2 ++
>  drivers/firmware/scmi/sandbox-scmi_devices.c | 2 ++
>  drivers/firmware/scmi/scmi_agent-uclass.c    | 2 ++
>  drivers/firmware/scmi/smccc_agent.c          | 2 ++
>  drivers/firmware/scmi/smt.c                  | 2 ++
>  6 files changed, 12 insertions(+)
> 
> diff --git a/drivers/firmware/scmi/mailbox_agent.c b/drivers/firmware/scmi/mailbox_agent.c
> index 3f4b04a4ae..8043e2c2de 100644
> --- a/drivers/firmware/scmi/mailbox_agent.c
> +++ b/drivers/firmware/scmi/mailbox_agent.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020 Linaro Limited.
>   */
>  
> +#define LOG_CATEGORY UCLASS_SCMI_AGENT
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <dm/device_compat.h>
> diff --git a/drivers/firmware/scmi/sandbox-scmi_agent.c b/drivers/firmware/scmi/sandbox-scmi_agent.c
> index 35de68c75d..97a5dace15 100644
> --- a/drivers/firmware/scmi/sandbox-scmi_agent.c
> +++ b/drivers/firmware/scmi/sandbox-scmi_agent.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020, Linaro Limited
>   */
>  
> +#define LOG_CATEGORY UCLASS_SCMI_AGENT
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <malloc.h>
> diff --git a/drivers/firmware/scmi/sandbox-scmi_devices.c b/drivers/firmware/scmi/sandbox-scmi_devices.c
> index 1a6fafbf53..69239a198f 100644
> --- a/drivers/firmware/scmi/sandbox-scmi_devices.c
> +++ b/drivers/firmware/scmi/sandbox-scmi_devices.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020, Linaro Limited
>   */
>  
> +#define LOG_CATEGORY UCLASS_MISC
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
> index 516e690ac2..2491e0a747 100644
> --- a/drivers/firmware/scmi/scmi_agent-uclass.c
> +++ b/drivers/firmware/scmi/scmi_agent-uclass.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020 Linaro Limited.
>   */
>  
> +#define LOG_CATEGORY UCLASS_SCMI_AGENT
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <dm/device_compat.h>
> diff --git a/drivers/firmware/scmi/smccc_agent.c b/drivers/firmware/scmi/smccc_agent.c
> index 81c2884bb7..f185891e8f 100644
> --- a/drivers/firmware/scmi/smccc_agent.c
> +++ b/drivers/firmware/scmi/smccc_agent.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020 Linaro Limited.
>   */
>  
> +#define LOG_CATEGORY UCLASS_SCMI_AGENT
> +
>  #include <common.h>
>  #include <dm.h>
>  #include <errno.h>
> diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
> index d25478796a..60b9d499b7 100644
> --- a/drivers/firmware/scmi/smt.c
> +++ b/drivers/firmware/scmi/smt.c
> @@ -4,6 +4,8 @@
>   * Copyright (C) 2019-2020 Linaro Limited.
>   */
>  
> +#define LOG_CATEGORY UCLASS_SCMI_AGENT
> +
>  #include <common.h>
>  #include <cpu_func.h>
>  #include <dm.h>
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
