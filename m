Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5771D5614EC
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:26:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13B3EC60466;
	Thu, 30 Jun 2022 08:26:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28C7EC60465
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:26:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U5krnK017871;
 Thu, 30 Jun 2022 10:26:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EHaZUuemxx4GWlq/Xn3NYqP6Zf4J8qsonUdMHseJ0NM=;
 b=cOS3mpGldMQ8rL6qnHb2klNib/YkVVqE3D4O/rnn3TcIalpmV/QYm7f+esxB1JmL6t3x
 K2JAISypnCCvSH6XG/oYkGEfsGMzZt11f1V78DtM1wim6yeBgGv4flmyBG+5PPTp2olR
 fcszLV3+51RoRU3jF9cWrBiIAYhhTLJxtJ6qN9xZmLSPOPgMdxtpr29C/gUbxz8KpP0B
 2UGBRkIcMxGpEGbRxdCX3VHKtJ5ZUB6BRI4bklNcEIPEfKH5yvz95UbcE5mIKpcUVgNb
 SrOXXZ4hk3WdNPOCYbxVrY8MnB/802FGFYN0Wlvoo8ifsnSuGOXeWFou+Yqjw1YSyEeq vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h0kbxqhb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:26:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0571D10002A;
 Thu, 30 Jun 2022 10:26:39 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F34232132EA;
 Thu, 30 Jun 2022 10:26:38 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.45) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:26:06 +0200
Message-ID: <1bae406b-7074-1d3d-7a19-762400eccc96@foss.st.com>
Date: Thu, 30 Jun 2022 10:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
 <20220630101610.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220630101610.3.I09a7e6bd976c0720cef2de21e3acd62ff8a7b846@changeid>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] stm32mp: add support of STM32MP13x
	Rev.Y
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

On 6/30/22 10:16, Patrick Delaunay wrote:
> Add support of STM32MP13x Rev.Y for the Silicon revision REV_ID = 0x1003.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> Changes in v2:
> - fix value of CPU_REV1_2 = 0x1003, because minor version in REV_ID
>    is bitfield at SoC level (0 = 0, 1 = 1, 2 = 3, 3 = 7, 4 =F, ....)


I use a bad version in message tittle header, this serie is V2

=> I resent this serie with correct version

http://patchwork.ozlabs.org/project/uboot/list/?series=307330&state=*

sorry for this error.


>   arch/arm/mach-stm32mp/include/mach/sys_proto.h | 1 +
>   arch/arm/mach-stm32mp/stm32mp13x.c             | 3 +++
>   2 files changed, 4 insertions(+)
>

regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
