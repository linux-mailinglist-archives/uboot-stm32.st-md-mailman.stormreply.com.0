Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 482B650FBFA
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Apr 2022 13:29:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F784C5F1F2;
	Tue, 26 Apr 2022 11:29:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D02C5F1D6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 11:29:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QAKgYd030389;
 Tue, 26 Apr 2022 13:29:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4aHqRxiJHu2hFN3LAFdJA+z5kPfg5zv1qZVLcKm309Y=;
 b=WFkmKCi8mYQB0/Pwvs/hPj3uy4yrNfrcSvq8Nsvm8kejzgn7RK7YJM2qKJVBEZtbE04w
 5qXele0vLYGabgWDvqCO1vTptu11CuyKZ0UIRNGqPZNlQ6kA/SwaPCF2l7JGN/ti5brA
 WQm4CgQsHxy5prdFKCRcqi2wy/8xeRGI3ZOXRDV/k+T2ViUN6P89yHCZj2UqPIudp9pr
 uuP7SPAK1ULLnHWFNGU1cmvS0tItEeKjCntSPX3T2XbbqVxtUQIX5NqCJVAlwJzZtuC8
 tFR6rAF2x4/V83eA4hQ9VL3J5WOWejoEZjX/LnF55vxFcDd/EAyS3QVHfOT8QiUjdNLJ rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8bh6u17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 13:29:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C5EF10002A;
 Tue, 26 Apr 2022 13:29:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3655D21FE81;
 Tue, 26 Apr 2022 13:29:49 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 26 Apr
 2022 13:29:48 +0200
Message-ID: <b5150906-7c60-95ea-94ae-96d2081db0b7@foss.st.com>
Date: Tue, 26 Apr 2022 13:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
 <20220413150500.23883-3-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220413150500.23883-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_02,2022-04-26_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v1 02/12] configs: stm32f746-disco: Rename
 stm32f746-disco_defconfig to stm32f746-disco_spl_defconfig
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


On 4/13/22 17:04, Patrice Chotard wrote:
> The current stm32f746-disco_defconfig file supports SPL, rename it to
> stm32f746-disco_spl_defconfig to reflect the supported configuration.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   board/st/stm32f746-disco/MAINTAINERS                             | 1 +
>   .../{stm32f746-disco_defconfig => stm32f746-disco_spl_defconfig} | 0
>   2 files changed, 1 insertion(+)
>   rename configs/{stm32f746-disco_defconfig => stm32f746-disco_spl_defconfig} (100%)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
