Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E354F37A
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jun 2022 10:47:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86058C5F1F2;
	Fri, 17 Jun 2022 08:47:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1659C5F1EE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jun 2022 08:47:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H88N9R027699;
 Fri, 17 Jun 2022 10:47:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9ZyPRQ/HCvI16xMZeCq5KQ1r0RLhvif4xCoqJv3ti4o=;
 b=TvBAitjSkCwto9XAgkcRwiV0hBlZPEhK0LUEdFInKgjaTK5Fs2DUBfecN3uMN493pwRM
 VpM0CcNNAUJrhSF65iqcTqyPM4+ML/WsUafKGCPIGUPbDm6vOdpvs0UXtSXU170uGjOc
 qOekgYe+mOYvPE+uFu1K+YoYwOsCA2rWHw3BkGBz7rHW6zRRLWNDyZCwTiiiozgTtdBu
 7DHrINEMZghvYFCAgmEd/9FV9g9I7DeFLMCwTjCbYv35Bvh0HYtFBe8GgciBLaeTul1z
 Dunyb8SZSvhSEX2I0T/TuJxB7XNBSt3LVTANErHb58eKsXMa61NxO/bhHQv9wPtWkRjh fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gqd185b12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 10:47:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EBED10002A;
 Fri, 17 Jun 2022 10:47:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18EEC2194FB;
 Fri, 17 Jun 2022 10:47:55 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.116) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 17 Jun
 2022 10:47:54 +0200
Message-ID: <2e4eeba2-37e4-6e8b-b401-8310a512fbf4@foss.st.com>
Date: Fri, 17 Jun 2022 10:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.3.I64f8491d095549bcba2adf2bfa962c50ecca7874@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220506160540.3.I64f8491d095549bcba2adf2bfa962c50ecca7874@changeid>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 03/16] arm: stm32mp: move the get_otp
 helper function in bsec
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

On 5/6/22 16:06, Patrick Delaunay wrote:
> As the get_otp() helper function in bsec are common for all STM32MP family,
> move this function in bsec driver
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/bsec.c                   | 17 +++++++++++++++++
>   arch/arm/mach-stm32mp/cpu.c                    | 17 -----------------
>   arch/arm/mach-stm32mp/include/mach/sys_proto.h |  3 +++
>   3 files changed, 20 insertions(+), 17 deletions(-)
>

Applied to u-boot-stm/next, thanks!

Regards
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
