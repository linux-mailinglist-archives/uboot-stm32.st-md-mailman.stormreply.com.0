Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1263CB42B
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jul 2021 10:28:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D68F5C59783;
	Fri, 16 Jul 2021 08:27:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 096EAC59781
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jul 2021 08:27:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G8CEZL017462; Fri, 16 Jul 2021 10:27:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z99qnyYelT9fDZ+YuAfjucb/MLkoSavCs+r83aDEwEw=;
 b=xTMmJpSW9+QnXVmELhekw5Pc3lo9kofdw1Vnyufj/XlwMd96OL6ys/rwTWbXSLgLNhar
 aVc0jkDSaW0+FoiASQ7jdoc2ZZujBW6ohOt95cR3H0u+CYIMKJsjY7fSlX4TWaOdMTHk
 rjlgeB4SPj2sg0BNht1kapoLQfekRtiN0aYm5H3qjDRLVjv7gWJDZlZN2g4UWL2G0geo
 rJlWHVtHwOaYvukKAyA8JgKp5p4NmyzFy1Ko8HfgUYF6T8xNaVZv66tplG6wnP6emzj8
 8fdSSzgHQsrBY5bKoHNUX6mfZ6uQs+3B4omxuYfUZzy2nu1fW09g0Jcjb2J4Y6WksJY3 jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39tw1htufk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:27:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E369F10002A;
 Fri, 16 Jul 2021 10:27:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA503218C9E;
 Fri, 16 Jul 2021 10:27:57 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Jul
 2021 10:27:57 +0200
To: <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.2.I55399cf019408c6f6d4f86aa8783c8187b090280@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f813647f-c67e-96dd-ef0f-a33052d9829a@foss.st.com>
Date: Fri, 16 Jul 2021 10:27:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.2.I55399cf019408c6f6d4f86aa8783c8187b090280@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/7] stm32mp: cmd_stm32key: use sub command
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

On 6/28/21 2:55 PM, Patrick Delaunay wrote:
> Simplify parsing the command argument by using
> the macro U_BOOT_CMD_WITH_SUBCMDS.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 55 ++++++++++++++++++----------
>   1 file changed, 36 insertions(+), 19 deletions(-)
>
Applied to u-boot-stm/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
