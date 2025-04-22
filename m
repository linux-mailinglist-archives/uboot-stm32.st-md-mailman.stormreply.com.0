Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C14CCA95FD9
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Apr 2025 09:49:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B796C78F68;
	Tue, 22 Apr 2025 07:49:14 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5D0FC78F62
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Apr 2025 07:49:13 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M58IJR013542;
 Tue, 22 Apr 2025 09:49:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 OXWe5acbILS96SHrzLppnsZNLqYyZEH1Z1RxOBuGeZQ=; b=gvLj8E/OxT/RMXyS
 pLajDGbb98nfmQs1h3dAV9sae9vwVyayi1F3eD2S6fs2TixNVjKKc5Z+u5gSLchU
 bUQcJ8JL/WIXZBWcZfoMaiFNa6TyHkFjJPTTX0WRFpIKIVuh9XMrdExZFtazXUkg
 bOT1to3n16WP3I/gWW6GFWwzG2ZoO9D+ymVzVtfKI82rfo9WJKgaJKLv6y9YaLjH
 uvYtlBzbzbVM/jfqTYWw5n3q/kKcDMMdv3sGNp/Y8PKWQwbnnjlOOIyXi4nyhbML
 FsWar6yDzqBcQVfosIdvtbWMv0by57fUADL5BS4pQj4jAPyMrl2PyVhelUcN7JV8
 iayvdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464psp6fwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 09:49:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BD4CF40044;
 Tue, 22 Apr 2025 09:47:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E84549A7B1A;
 Tue, 22 Apr 2025 09:47:08 +0200 (CEST)
Received: from [10.48.87.126] (10.48.87.126) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 09:47:07 +0200
Message-ID: <3757b4a7-735a-4e19-a460-b3cfe73dff5c@foss.st.com>
Date: Tue, 22 Apr 2025 09:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250411092721.331518-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250411092721.331518-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.126]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
Cc: Erik Schumacher <erik.schumacher@iris-sensing.com>,
 Marek Vasut <marex@denx.de>, Greg Malysa <malysagreg@gmail.com>,
 Heesub Shin <heesub@gmail.com>, Philip Oberfichtner <pro@denx.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add support of stm32mp2
	platform
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

On 4/11/25 11:27, Patrice Chotard wrote:
> From: Christophe Roullier <christophe.roullier@foss.st.com>
>
> Add compatible "st,stm32mp25-dwmac" to manage STM32MP2 boards
>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/net/dwc_eth_qos.c       |  4 ++++
>   drivers/net/dwc_eth_qos.h       |  1 +
>   drivers/net/dwc_eth_qos_stm32.c | 11 +++++++++++
>   3 files changed, 16 insertions(+)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
