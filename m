Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A037332602
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:04:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 639C7C57195;
	Tue,  9 Mar 2021 13:04:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EAE1C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:04:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129Cu9kn020423; Tue, 9 Mar 2021 14:04:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jPga+vMWZTBB3SVuU9F2UgBND3oJWJEcmAatN9T7pqY=;
 b=sZDMnyJHvWeph/Vmr/Tl/FH+dZDR+6o0reYKZ9HxTcvXah10fhpSUoEu6MYb2bBx4VHH
 HhlwxGEyt4gcSPdmaMtKFXgVQ9NwGqYmUZTcpTbDbDRCni+dOwoCSAbRjHXzkmnR+0O+
 qSolYkXe4vPoSvn2CTzwe+2DL2epVXG8UWtd1Eivdt8fzPTMJl6gEqdfM/4GGfXYeL5S
 Fp5j/y/6yyndTLQjaNandDGZX05hrLCD2n7DRNl+XNfFc8pN41RHFsHf00syG7cXFJmr
 HLQwfNNYEQbf2iwTb3AGLK2KRwkLYHGIle9aY6VhFHoxWM+wpVqqU+pHkzsxfzdewQsU YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6scjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:04:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24E8E10002A;
 Tue,  9 Mar 2021 14:04:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16E232422A4;
 Tue,  9 Mar 2021 14:04:28 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:04:26 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.5.I9181e07a082adec8ea1c0afd5b103d005f05b860@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1714ed28-4a5e-ff42-45ec-22a5ee6894cb@foss.st.com>
Date: Tue, 9 Mar 2021 14:04:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224111907.5.I9181e07a082adec8ea1c0afd5b103d005f05b860@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Etienne Carriere <etienne.carriere@linaro.org>,
 Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 5/6] scmi: cosmetic: reorder include files
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
> Reorder include files in expected order.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/firmware/scmi/mailbox_agent.c     | 2 +-
>  drivers/firmware/scmi/scmi_agent-uclass.c | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/scmi/mailbox_agent.c b/drivers/firmware/scmi/mailbox_agent.c
> index 8043e2c2de..ea35e7e09e 100644
> --- a/drivers/firmware/scmi/mailbox_agent.c
> +++ b/drivers/firmware/scmi/mailbox_agent.c
> @@ -7,11 +7,11 @@
>  
>  #include <common.h>
>  #include <dm.h>
> -#include <dm/device_compat.h>
>  #include <errno.h>
>  #include <mailbox.h>
>  #include <scmi_agent.h>
>  #include <scmi_agent-uclass.h>
> +#include <dm/device_compat.h>
>  #include <dm/devres.h>
>  #include <linux/compat.h>
>  
> diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
> index 2491e0a747..527163b5ce 100644
> --- a/drivers/firmware/scmi/scmi_agent-uclass.c
> +++ b/drivers/firmware/scmi/scmi_agent-uclass.c
> @@ -7,11 +7,10 @@
>  
>  #include <common.h>
>  #include <dm.h>
> -#include <dm/device_compat.h>
>  #include <errno.h>
>  #include <scmi_agent-uclass.h>
>  #include <scmi_protocols.h>
> -
> +#include <dm/device_compat.h>
>  #include <dm/device-internal.h>
>  #include <linux/compat.h>
>  
> 


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
