Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA43CB43B
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:30:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94483C59781;
	Fri, 16 Jul 2021 08:30:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9546BC57B6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:30:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8SnAC000945; Fri, 16 Jul 2021 10:30:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FY58uagBzli8cByBvz7UyQCHXap5eSwbMm0Xx0WbmPY=;
 b=Zcn0vwgSwmc4qQh6+rlQ3qd3tjBWT97niZ87zWzUr6I9MJLDplYrE5Q9ezyPm+30dqH7
 H6nTE3NXXOurMFbGG/e8zhH/x7ttFk4A2RS/eL2kixmBUzqiFiDZMqFBPP3xh/A4uJi+
 48h5ZwITG8QYEAO0xvNrFZyHlN7f1ZKVZLHhAJmXkoIa5D1hTIHpb2B1hfnxGlKhqL2X
 yQmhTBvTzxco0+SU9w+BzAFRnNAHMhQ8pBuL3T2AqvFBPwyY9YYlnzrB71rmQ4kdWb2r
 SIdkJsZdTIgLt6ipOCcQbDdCHN/NKl1CXZ5eABPyyVOz4Nt5LB+KNr2ytRaB35P0eD0s Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1uamy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:30:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 066DA10002A;
 Fri, 16 Jul 2021 10:30:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F03FC218CB7;
 Fri, 16 Jul 2021 10:30:52 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:30:52 +0200
To: <u-boot@lists.denx.de>
References: <20210705093834.1.I36ee8ad60f6e0ee9c3021a5e2f0fcc1863bb648e@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <b1b12548-fc8c-bcd2-c623-64cbffcd1ca5@foss.st.com>
Date: Fri, 16 Jul 2021 10:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705093834.1.I36ee8ad60f6e0ee9c3021a5e2f0fcc1863bb648e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: use defines for
 virtual partition size
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

On 7/5/21 9:39 AM, Patrick Delaunay wrote:
> Use the existing defines PMIC_SIZE and OTP_SIZE and a new define
> CMD_SIZE for virtual partition size.
>
> This patch corrects the size for OTP partition in alternate name
> (1024 instead of 512) and avoids other alignment issues.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c     | 6 +++---
>   arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h     | 1 +
>   arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 2 +-
>   3 files changed, 5 insertions(+), 4 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
