Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB523CB419
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:26:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7564C59781;
	Fri, 16 Jul 2021 08:26:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C308C57B6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:26:47 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8CD9a017411; Fri, 16 Jul 2021 10:26:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SraBjgsxNJY8eOB5bdwBMFdeTfKMIMSGrIdZVfTRPXg=;
 b=dvpZK+f6k9X3Sc+1pYbK9CgA9xMObFUz3FUGYLKCcozSQo/Qy4w0wYwR39YQDyn3iG9H
 53ikK5E9TWNlLzc5ZXWvYgS+1vYjLAek+e7R3UiRQUb5MRhj/vJZ4KqFH9F9BF4o+LMt
 v1+C3vEJ3exoBgWPfK9BH6bHC/rUhsBTD3WxuMYzAU2aaQHJNaXUQ7om+acD9VhL06uO
 6qENdC8TOXUxspyHn1WbFSyj730y1+aSynNLKtUkfxq85f3HhqLHqfA368wVSUxexK/z
 HhgL8FePpW7jKR2IbzS8+QdBLux8b/zvGoQR2UiFV/VANdZocjZLR8qfkv3q79BNSCAm kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1htu9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:26:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EF1710002A;
 Fri, 16 Jul 2021 10:26:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64A95217B6A;
 Fri, 16 Jul 2021 10:26:43 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:26:42 +0200
To: <u-boot@lists.denx.de>
References: <20210628144418.1.I207c8af71917766e343179128c630d483c9f6ece@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <655ac334-4053-3a08-6430-7f6b09680019@foss.st.com>
Date: Fri, 16 Jul 2021 10:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628144418.1.I207c8af71917766e343179128c630d483c9f6ece@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: fix the content of
	short help message
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

On 6/28/21 2:44 PM, Patrick Delaunay wrote:
> Reduce the content of short help message for stm32prog command and
> removed the carriage return to fix the display of 'help' command when
> this command is activated.
>
> Fixes: 954bd1a923a6 ("stm32mp: add the command stm32prog")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>

Applied to u-boot-stm/master, thanks!

Regards
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
