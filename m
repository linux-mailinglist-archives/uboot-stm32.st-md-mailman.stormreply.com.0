Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BD43E6B7
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 18:59:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F178C5E2BA;
	Thu, 28 Oct 2021 16:59:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76425C5E2B7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 16:59:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR1X4000369; 
 Thu, 28 Oct 2021 18:59:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Co4jduZghp7aMhf0DSg5niNd+KinARH8sQ9Tfk8Ll8Q=;
 b=8PMKomTHbkmXkgiLHwF8Q5CbabS0y/bUF95hs+md4qwANpAnE7ttwmtGt43Xe33Z66y6
 3Jp3wink7bm8Q0zN1k8DRteOqeCsnUrusKWlA6/0elX5wFQcU0V/DknbvTUWBd8dB741
 lVDiBbJu1H6NluouTT9bfTLZBJ3Rxg9zU1mF6TqHkw4T4kOR3Bk4KoF1aUHWI2B2Q5XF
 oBDsHWyzajOAM+LzhikVo8ysNWLZn3LecWkyRIwnP6y0sMNysrdL8ihOHM7+jStFPgcg
 3XYbc0/GKceNLP8FGDbbTYBil5YhdSblR3PeCz7/DOcO35iB73eg8OyZvrMP/QcKwxoE rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bym0gm7yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 18:59:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97DDD10002A;
 Thu, 28 Oct 2021 18:59:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B55621AA64;
 Thu, 28 Oct 2021 18:59:25 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct
 2021 18:59:24 +0200
To: <u-boot@lists.denx.de>
References: <20211028165656.v2.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
 <20211028165656.v2.4.Ib2e58ee67f4d023823d8b5404332dc4d7e847277@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <db147332-4232-87b7-f783-8f471929ea6c@foss.st.com>
Date: Thu, 28 Oct 2021 18:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028165656.v2.4.Ib2e58ee67f4d023823d8b5404332dc4d7e847277@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>, Wolfgang Denk <wd@denx.de>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/5] firmware: scmi: add configs to
 select the supported agents
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


On 10/28/21 4:57 PM, Patrick Delaunay wrote:
> Add two configs CONFIG_SCMI_AGENT_MAILBOX and CONFIG_SCMI_AGENT_SMCCC
> to select the supported agents as all the agents are not supported.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>
> Changes in v2:
> - fix typo s/compatibble/compatible/
> - add acked by Etienne Carriere for the series
>
>   drivers/firmware/scmi/Kconfig  | 16 ++++++++++++++++
>   drivers/firmware/scmi/Makefile |  4 ++--
>   2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/scmi/Kconfig b/drivers/firmware/scmi/Kconfig
> index c3a109beac..c33de87cd0 100644
> --- a/drivers/firmware/scmi/Kconfig
> +++ b/drivers/firmware/scmi/Kconfig
> @@ -17,3 +17,19 @@ config SCMI_FIRMWARE
>   	  based on message exchange. Messages can be exchange over tranport
>   	  channels as a mailbox device or an Arm SMCCC service with some
>   	  piece of identified shared memory.
> +
> +config SCMI_AGENT_MAILBOX
> +	bool "Enable SCMI agent mailbox"
> +	depends on SCMI_FIRMWARE && DM_MAILBOX
> +	default y
> +	help
> +	  Enable the SCMI communication channel based on mailbox
> +	  for compatible "arm,scmi".
> +
> +config SCMI_AGENT_SMCCC
> +	bool "Enable SCMI agent SMCCC"
> +	depends on SCMI_FIRMWARE && ARM_SMCCC
> +	default y
> +	help
> +	  Enable the SCMI communication channel based on Arm SMCCC service for
> +	  compatible "arm,scmi-smc".
> diff --git a/drivers/firmware/scmi/Makefile b/drivers/firmware/scmi/Makefile
> index 966475ec10..d6d6f89493 100644
> --- a/drivers/firmware/scmi/Makefile
> +++ b/drivers/firmware/scmi/Makefile
> @@ -1,5 +1,5 @@
>   obj-y	+= scmi_agent-uclass.o
>   obj-y	+= smt.o
> -obj-$(CONFIG_ARM_SMCCC)		+= smccc_agent.o
> -obj-$(CONFIG_DM_MAILBOX)	+= mailbox_agent.o
> +obj-$(SCMI_AGENT_SMCCC)		+= smccc_agent.o
> +obj-$(SCMI_AGENT_MAILBOX)	+= mailbox_agent.o


erreur here when I copy paste the configuration name

=> missing CONFIG_ in variable

+obj-$(CONFIG_SCMI_AGENT_SMCCC)		+= smccc_agent.o
+obj-$(CONFIG_SCMI_AGENT_MAILBOX)	+= mailbox_agent.o

sorry, I will sent v3 !

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
