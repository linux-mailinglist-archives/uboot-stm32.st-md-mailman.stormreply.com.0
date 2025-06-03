Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84EACCC3E
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jun 2025 19:33:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC246C349C2;
	Tue,  3 Jun 2025 17:33:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98BBFC349C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:33:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553Dn2FR023653;
 Tue, 3 Jun 2025 19:33:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1lrAH1phohat/C/BGTdN8konOda2KWYW4+fJgG8pPHM=; b=v7Fa+SlWvn55U36R
 E0exlgkXj+aCvog2wyTRHqNE8BiWBFy5H+BhhgQAU5EXBE4vhU80VwL6TgC3S5Dv
 Y4PzSOmg1jj1vYtoWRVcE1EgROGl33y2E1OphxMEIfaPjfacFdU1NcXLnKHcA048
 kBrTd3lILLp6PPIFhG4qGVUAdDDZLLtQCNVE8YX+97jxdKr5UefQNy2wtXmT3yo+
 /biAWcdCGRs/xBw7jJhpHKFhvzGmDRqeXlhLlNiPJ3EPEpZ3yu2cMmpT7i4R5ZYT
 TKdxYM/5GNoMkio41WNm8giwBoMtOMGCLyjNTADKQAVAhb1e+tKZ7Ws+iHzHgHV6
 DE8fcw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8v583f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jun 2025 19:33:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2A83F40049;
 Tue,  3 Jun 2025 19:32:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44E52B58C8A;
 Tue,  3 Jun 2025 19:32:17 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Jun
 2025 19:32:16 +0200
Message-ID: <065acb17-0a14-4cc9-9802-30d7f8a5e2ab@foss.st.com>
Date: Tue, 3 Jun 2025 19:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
 <20250527132755.2169508-11-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250527132755.2169508-11-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Sean Anderson <seanga2@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 10/13] clk: stm32: fix clock counter
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
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>
> In RCC the ops of the CCF registered CLK device can be called directly,
> this patch avoid recursive call of clk_ function done by CCF clock
> framework which update the clock information, for example
> clk_enable is called 2 times, clkp->enable_count is increased 2 times.
>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Sean Anderson <seanga2@gmail.com>
> ---
>
> (no changes since v1)
>
>   drivers/clk/stm32/clk-stm32-core.c | 68 ++++++++++++++++++++++++++++--
>   1 file changed, 64 insertions(+), 4 deletions(-)
>

this patch is working with clk_get_by_id() and many clock provider 
(SCMI, PHY, clock fixed, ....)

so the CONFIG_CLK_AUTO_ID is mandatory....


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
