Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F19424279
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 18:20:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C12AC597B3;
	Wed,  6 Oct 2021 16:20:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57649C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 16:20:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196ExnVT018931; 
 Wed, 6 Oct 2021 18:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=pEC1lAH+ohxpMTo7rucmzQG6/xt7Zh0nBslfgVo4G2Q=;
 b=QAVXkn1ni42qOXf0VeHPab83D9SFmN362xR2sEnSWERVR4Y7TsfsHCOnaHpd5YDQAVPO
 LiGkvYj1TojYP1n8nxcepBIKud5AxTcqHIVdqvAzdg4JdtjFrB0B5hIE+7/jhUoa6W54
 ZzR6L7iZgkRbY9rZPBs49srCx0XQMnCGLzls+Ua0qY8I2DpVTe6tYgi4Rq1DEpamIbcH
 sTgO7vgi9d7u9CRJ3rvKUwkwhr+KvKIl/kHj45peLhNDq6FrUAXUiLCYnd2GxWqSJvCU
 P+FwEA3AqyKPSC4Dy7+sMEe4tuTO9Eic+tloo/KSvgHaPuxXxioiA1ClA4K0wWkrwveJ nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bh9c8advw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 18:20:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A66A210002A;
 Wed,  6 Oct 2021 18:20:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B38A2309D6;
 Wed,  6 Oct 2021 18:20:20 +0200 (CEST)
Received: from LMECWL0930 (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Wed, 6 Oct 2021 18:20:19 +0200
From: <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
References: <20211006171839.1.I0774e750b5e88f0d91ea2273a4616b784019c1dd@changeid>
In-Reply-To: <20211006171839.1.I0774e750b5e88f0d91ea2273a4616b784019c1dd@changeid>
Date: Wed, 6 Oct 2021 18:20:18 +0200
Message-ID: <00f801d7bace$0e39fe70$2aadfb50$@foss.st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: fr
Thread-Index: AQHXgWTOQcr2necpScXmzqz1IrhDVqvGl6dQ
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2021-10-06T16:20:17Z;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=bdf33f27-1442-4392-928a-a47bca3d38e3;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
Cc: 'U-Boot STM32' <uboot-stm32@st-md-mailman.stormreply.com>,
 'Priyanka Jain' <priyanka.jain@nxp.com>, 'Simon Glass' <sjg@chromium.org>,
 'Stefan Roese' <sr@denx.de>, 'Vikas Manocha' <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stv0991: remove specific CONFIG_STV0991
	configs
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

Hi,


ST Restricted

> -----Original Message-----
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Sent: mercredi 6 octobre 2021 17:19
> To: u-boot@lists.denx.de
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Simon Glass <sjg@chromium.org>; Stefan Roese
> <sr@denx.de>; Vikas Manocha <vikas.manocha@st.com>; U-Boot STM32
> <uboot-stm32@st-md-mailman.stormreply.com>
> Subject: [PATCH] stv0991: remove specific CONFIG_STV0991 configs
> 
> Remove the following STV0991 specific configs:
> - CONFIG_STV0991 (never used)
> - CONFIG_STV0991_HZ (replaced by generic CONFIG_SYS_HZ)
> - CONFIG_STV0991_HZ_CLOCK (replaced by generic
> CONFIG_SYS_HZ_CLOCK)
> 
> This patch allows to reduce the file config_whitelist.txt.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/cpu/armv7/stv0991/timer.c              | 6 +++---
>  arch/arm/include/asm/arch-stv0991/stv0991_gpt.h | 4 ++--
>  scripts/config_whitelist.txt                    | 3 ---
>  3 files changed, 5 insertions(+), 8 deletions(-)
> 

Even if I don't update patchset version to V2 this patch is replaced by next
one
http://patchwork.ozlabs.org/project/uboot/list/?series=265724&state=*

It is a push error, sorry.

I need to add a modification to avoid the remaining error

+Error: You must add new CONFIG options using Kconfig
+The following new ad-hoc CONFIG options were detected:
+CONFIG_STV0991

CONFIG_STV0991 was never used in code but define in autoconfig by
  CONFIG_SYS_EXTRA_OPTIONS="STV0991"


Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
