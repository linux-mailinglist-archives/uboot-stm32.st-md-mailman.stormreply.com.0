Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 484043CB418
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:25:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAE9CC59781;
	Fri, 16 Jul 2021 08:25:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9128FC57B6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:25:49 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8CCLJ027604; Fri, 16 Jul 2021 10:25:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3tu8VVMBuwA82joDT+GqItbIQdTWLaI+NJE8Ag/giRU=;
 b=R/TMKU1g4pCjaf+JH6K2GAT6ECO5BIxJaMjm5Va7+D6VsxlpeAR7iV1ObHqDvKqY3SPD
 MZQfmiueF/r1+jzx5clTK7VDt6wGeG6/9DI2d90zTU7zeE+5b1P5hwxDYR3ymLYpzQBh
 TxsrINpN+SrxsoVh0i/4z1tMmoQnXKX8uGYfBICrYvQVTSG1Gfy+B/HkEBhdhiQ8o2zR
 L41tts3WziYqFOJYfjoizT5XMvK4d7IWQiMt75/+xTp4B6Ur0KZa5+CbVZm6oyJmQta2
 OhfNFgMYye+Sg7XzGnA3NnOq8D4iAQqg27fFB+D+E+sHYnoj6sgvcmrztAOMnecEUp2u nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1kauct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:25:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEB43100034;
 Fri, 16 Jul 2021 10:25:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E217D218C93;
 Fri, 16 Jul 2021 10:25:44 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:25:44 +0200
To: <u-boot@lists.denx.de>
References: <20210628144151.1.I5e93758388130e77d97fc9904105c8e69363705b@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <ad0adb59-4be8-01f9-c859-82e372d6611f@foss.st.com>
Date: Fri, 16 Jul 2021 10:25:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628144151.1.I5e93758388130e77d97fc9904105c8e69363705b@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: remove splashimage and
 add fdtoverlay_addr_r
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

On 6/28/21 2:42 PM, Patrick Delaunay wrote:
> Add the variable used by PXE command for fdtoverlays support
> since the commit 69076dff2284 ("cmd: pxe: add support for FDT overlays").
>
> Reused the unused "splashimage" address as CONFIG_SPLASH_SOURCE and
> CONFIG_VIDEO_LOGO are not activated and U-Boot display the "BACKGROUND"
> image found in extlinux.conf to manage splashscreen on stm32mp1 boards.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   include/configs/stm32mp1.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
