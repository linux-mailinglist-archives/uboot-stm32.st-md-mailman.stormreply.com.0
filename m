Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D017D5B051F
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Sep 2022 15:29:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DFB1C62D6D;
	Wed,  7 Sep 2022 13:29:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9F57C0D2BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Sep 2022 13:29:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2879DNvu018634;
 Wed, 7 Sep 2022 15:29:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yD28AXcOnqEqhsZMfOQPjgt/50PYezQJa+sxSRCgfJg=;
 b=yRGKMU4t67YhAAJq4JPSXUA4pi8+wS5/wjtNIYJK6ONOuomNqewvGgHMWnbyf3Ul5Gsp
 s/f9uODiatkEOneBwKh+Jz7uaJ0/jSk4kuAX180Vbfl4K/qZLx83i4VorokIG6xeJNOp
 zYrN4x0Qc4wltoaicHagNGLAgWBRsP7PC36RrE35vk+MsFbeqcZx3p29r/p9bYeV1hPQ
 VQlPMa19g8Ht+iHJXwAXoEnqkkMbYyJlHqJzmbPuEizsXLlQWC71rOC8G4htzohJlrNj
 C+1PuTqJA/0hP5OX4TVcfvNFBIzJV9S9pzzFOuQf7c+ZJOJ0cIyVNPi0UxEv6ZDemntF ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jerfv1jjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 15:29:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8528010002A;
 Wed,  7 Sep 2022 15:29:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7101B22A6DC;
 Wed,  7 Sep 2022 15:29:50 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 7 Sep
 2022 15:29:49 +0200
Message-ID: <3eb13a5c-5152-f946-51ce-88b530cb2f9f@foss.st.com>
Date: Wed, 7 Sep 2022 15:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: <u-boot@lists.denx.de>
References: <20220620094959.1.I4d177d06061a5973e5cd25d2b61e74fdb2861a2a@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220620094959.1.I4d177d06061a5973e5cd25d2b61e74fdb2861a2a@changeid>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: simplify the STM32MP15x package
	parsing code
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

On 6/20/22 09:50, Patrick Delaunay wrote:
> Simplify the package parsing code for STM32MP15X as package can be
> affected with get_cpu_package() result.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/stm32mp15x.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
>


Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
