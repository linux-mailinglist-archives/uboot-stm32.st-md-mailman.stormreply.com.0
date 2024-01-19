Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E7832A4B
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:24:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32A7BC6DD73;
	Fri, 19 Jan 2024 13:24:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B776CC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:24:30 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JAt5dF017221; Fri, 19 Jan 2024 14:24:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=t7GDVniMJ6emRSrX2bZr9gfk0O2OPRINE8jvCAMVgXU=; b=VQ
 0/jGHW0kVBE/Ux7sWssrFBD34DTzifXtilFNH4VW8c7FgwdUg+N1TnuLP7bhj1Hb
 RR2Q2vzoGZDdw46oVtlFoHCpcZiCMV8EizIjyiheAzEXnGjZnfznrHu5KWvQLNW6
 5Ve+ov7RLbIkAHVOZbnEu7tQYIYPvnoYm5I9haYYd42sVasdFg8WAQp60q2mV8PO
 5CqPjtT9BXLNdqXc70OihDZXdhWMApGyuAbhaZUPhLZafnhTz/UQgAdsxOKB9ZJz
 O3sZCUyBMBBMXzXMSFO1wolz6CE5Iq8Al8DEwAziFQGxGGgXqvdE+Q9htuGoJyfq
 JrRAMY/4U3PcjX/BuKnw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y5bu8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 14:24:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1467100082;
 Fri, 19 Jan 2024 14:24:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA78A24B889;
 Fri, 19 Jan 2024 14:24:28 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:24:28 +0100
Message-ID: <d8c34dfa-265d-479b-8c0b-ada474696eb4@foss.st.com>
Date: Fri, 19 Jan 2024 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.2.I98f906c5860d42cc6f0c38219ff8391e7f537efb@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240115150451.v2.2.I98f906c5860d42cc6f0c38219ff8391e7f537efb@changeid>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v2 02/14] arm: stm32mp: add Rev.B support
	for STM32MP25
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



On 1/15/24 15:05, Patrick Delaunay wrote:
> From: Yann Gautier <yann.gautier@foss.st.com>
> 
> Add chip revision B support for STM32MP25, for displaying it in trace.
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
> index 4b2f70af9cc6..7f896a0d65d2 100644
> --- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
> @@ -167,6 +167,9 @@ void get_soc_name(char name[SOC_NAME_SIZE])
>  		case CPU_REV1:
>  			cpu_r = "A";
>  			break;
> +		case CPU_REV2:
> +			cpu_r = "B";
> +			break;
>  		default:
>  			break;
>  		}
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
