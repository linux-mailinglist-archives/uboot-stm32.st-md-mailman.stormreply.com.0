Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1AACCC4B
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jun 2025 19:37:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B2D3C349C2;
	Tue,  3 Jun 2025 17:37:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66225C349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:37:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553E5AC4003714;
 Tue, 3 Jun 2025 19:37:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 T+NrBf8p5qyv6xCavF8MPThfhntqmsYdGoygFXU1hz4=; b=5IpT52Ba46Pl5YDN
 wlLry+w51HK+Swf1bHlKAmaiNFSMpWhFp5oajMNVXoJKDvj6DFae8GpcjnSlDyZ/
 ZhyNJGM8J3Ns05soEElvfxOgggStWkCbtgyzYw9aQbKrVyCy24+7240Wi1SdCeHD
 Ydi7xb/TitmMg3xT8MMugrFwysxdQSWR4wnpHc7MQbDjRmnELS9jybJ0O1kWYr67
 IlYRewcPyzdzNijFr6PXg2ZEgQv6RXCLgMOJlwaJ5AYb/q1MRLbAAuSV+xSpy/i/
 nmJj3/yeUfF3aHkMsC+MkTM/L86R2MkTxk3RFt+GFTYEfWFAync0+/qc8u+2JSFo
 enazDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8tddkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jun 2025 19:37:38 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A4AED4006D;
 Tue,  3 Jun 2025 19:36:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BA87B45527;
 Tue,  3 Jun 2025 19:36:21 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 19:36:20 +0200
Message-ID: <1cac00f3-89e2-4a58-b4dc-62af242ded1c@foss.st.com>
Date: Tue, 3 Jun 2025 19:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
 <20250527132755.2169508-13-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250527132755.2169508-13-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 12/13] ARM: dts: stm32: switch from
 fixed to scmi clocks for stm32mp257f-ev1
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

On 5/27/25 15:27, Patrice Chotard wrote:
> SCMI clocks are now available, switch from fixed to SCMI clocks.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   arch/arm/dts/stm32mp25-u-boot.dtsi       |  8 +++
>   arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 74 ------------------------
>   2 files changed, 8 insertions(+), 74 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
