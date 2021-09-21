Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37237412F70
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 09:28:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5042C5A4CC;
	Tue, 21 Sep 2021 07:28:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 508B9C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 07:28:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L7AJS6006195; 
 Tue, 21 Sep 2021 09:28:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uARfGMH41BGy1EpS0zGqYWlHy4vcg/nLo6tSsD0IvD0=;
 b=q823a/s9hR3ceZWo2sY7ivvJ5GAu7pvbSv9TZdPp7R7Vf/rlnr4WvG9GPMOLG3q7kzT9
 6LwLntpBJYaUkfiAHq2uYgE4mec3/Xs2TMo3n/WnG9WOXFJQ9ERvw4x8iuIj6xlKo9Uh
 oYLDRHLfqum6UsiZ+AIFXH7owIoJPBqs3sAllWzpknFv/Hkhbs62j/RhZ5Gz2LLMvR3O
 e8D1daP7fiV9YGe3XkCf0yDMp4LCVkc2gUrf9WFIABLRsWF7zl1Vdt7ubrRp5aI1hcgd
 Te2KCq6Dwsn8YcPpeZAsLHTW+MRvhAHgTZUJyn8BaFdgOs+tRyQnbHdHajHcmwB3rnwf eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7as50302-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:28:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B1AA100034;
 Tue, 21 Sep 2021 09:28:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 733AF21BF6C;
 Tue, 21 Sep 2021 09:28:29 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 09:28:28 +0200
To: <u-boot@lists.denx.de>
References: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <2640a8d4-be28-3836-46d1-111df4a5bb72@foss.st.com>
Date: Tue, 21 Sep 2021 09:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914141449.1.I0015d48aa38713a09d1789547c90a9c444f1321e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp1: use ssbl partition
	name for U-Boot
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

On 9/14/21 2:14 PM, Patrick Delaunay wrote:
> Continue to use the "ssbl" name for GPT partition of secondary boot
> stage = U-Boot for basic boot with SPL to avoid to disturb existing user.
>
> The "fip" partition name is only used for TFA_BOOT with FIP, it is a TF-A
> BL2 requirement; it the default configuration for STMicroelectronics
> boards.
>
> Fixes: b73e8bf453f8 ("arm: stm32mp: add defconfig for trusted boot with FIP")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 4 +++-
>   arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
