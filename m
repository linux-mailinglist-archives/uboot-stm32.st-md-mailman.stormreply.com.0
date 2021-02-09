Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C918F314BA7
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 10:35:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88F6AC57B53;
	Tue,  9 Feb 2021 09:35:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5262CC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 09:34:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1199RCAb010985; Tue, 9 Feb 2021 10:34:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kmO9Ji4jGn/Pxt1nOuilJ0oCptssEtnmIglp7hrKW3w=;
 b=o9ruyQwEJyadqSwhvqrCyLqdJxNqiAG3BzkuqRxC9rqQrjfowFQ4fDONKdg3jQds6sNs
 ucPP2TfjTM8JxsPtfsPxJKH9i/cUCSahmNRAg9lcbzFI86ujWaa0mLJUQEfAPAugmi0G
 B+/jHQj0TkqRbY0/qr2UQQtD1nzTeXAsUZWy7De5t1Nzf9IAfDa+tf/WkSjjlaWrsjfp
 M1U4tDqtiWboqFpGEEm3jbgW+8QNQcrJZzrwnXS13atacSrwCmlDucOAGNIVGJyzwLcF
 YUbjK64L6d4Xx482q3IW8L7BuJKI0bfk4Y4BNDaLIecWTT4f/4xYrFHWE5Pm7s70quwW 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf77m50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 10:34:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CC5C100034;
 Tue,  9 Feb 2021 10:34:56 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B02C221785;
 Tue,  9 Feb 2021 10:34:56 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.119) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 10:34:55 +0100
To: <u-boot@lists.denx.de>
References: <20210122153414.1.I28be53e4ce2082b513afd19d77d1430741ac16f3@changeid>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <4210dc1e-e663-60b2-5fcf-455b981df177@foss.st.com>
Date: Tue, 9 Feb 2021 10:34:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210122153414.1.I28be53e4ce2082b513afd19d77d1430741ac16f3@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG1NODE6.st.com (10.75.127.67) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: add support of I2C6_K
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

On 1/22/21 3:34 PM, Patrick Delaunay wrote:
> Add support of missing I2C6_K with bit 3 of RCC_MC_APB5ENSETR =
> I2C6EN: I2C6 peripheral clocks enable.
>
> This patch allows customer to use I2C6 in SPL or in U-Boot
> as other I2C instance, already support in clk driver.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>   drivers/clk/clk_stm32mp1.c | 1 +
>   1 file changed, 1 insertion(+)
>
Applied to u-boot-stm/master, thanks!

Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
