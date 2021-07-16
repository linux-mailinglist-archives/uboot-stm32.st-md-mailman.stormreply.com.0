Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AED73CB42E
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:28:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECE72C59783;
	Fri, 16 Jul 2021 08:28:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08B86C59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:28:25 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8D0bI030318; Fri, 16 Jul 2021 10:28:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jnJlq8N+qKhay/i0nlEL4a7f/V/2wfp8UHi6mYvH9kY=;
 b=P8nKJ4WM/90wW2fEB7Sf1znsRjugCoHEYSVqspxLfvJAMYxLcdT6lqw5/f5FK7SxWwvv
 k4mjjHfpWWkNi/Q7fCZXOTZZXIoH/R99X3PhVmn5D0ukDemmvWa9dC28d7MAr7rUnMzk
 xUT4b/1px2+HdURKFJGBZDeMAReuX2KNaYrbz+H4UvXM1FHgjv+bCvDmV8NZ/5uihO2Y
 1RQJCRz/6zAdLpCS2Cm5MmxqUuBZmO1mgqAThDO7mVCdqygF2Ab7Pa8N5C6Z8mVW8Hx/
 2/VRVz30/mO/LUVOoVK5nDgDb12qNbwmsdv+yNi7Im693IDL7L7oTaC+WZuAZQLcqZ+h VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1uamhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:28:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 35D1610002A;
 Fri, 16 Jul 2021 10:28:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C30C218C9E;
 Fri, 16 Jul 2021 10:28:23 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:28:22 +0200
To: <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.4.I8410e2048aae4150e956478327751a71d8124024@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <fd064b02-bfed-9b48-53b3-755e9d997965@foss.st.com>
Date: Fri, 16 Jul 2021 10:28:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.4.I8410e2048aae4150e956478327751a71d8124024@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/7] stm32mp: cmd_stm32key: lock of PKH
	OTP after fuse
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

On 6/28/21 2:56 PM, Patrick Delaunay wrote:
> Lock the OTP value of key's hash after the command
> $> stm32key fuse <address>
>
> This operation forbids a second update of these OTP as they are
> ECC protected in BSEC: any update of these OTP with a different value
> causes a BSEC disturb error and the closed chip will be bricked.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
