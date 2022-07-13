Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36093573506
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jul 2022 13:13:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAFD3C640FE;
	Wed, 13 Jul 2022 11:13:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FDE5C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 11:13:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D8hvGD023204;
 Wed, 13 Jul 2022 13:13:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=3VT4P3jHvBXX5Lh18VIwOXqp+6p6Z4n4tIDqrwtiDB0=;
 b=y+yU8M2o/J3z8FD3JU1dgvqTbtkAH83pV+U9yPyJbGHy3uCYUc2kyu6eDVdldKAxOLx5
 XmA/s2rjYkBYO6Kc3cbzCdpybZEtxnkK1qRCsNHtGqs4pvzjzXraAphd38amzvq88i/Q
 bQ5drshtu2mS2foW5qIW7tg2UvhNO9n+pgYZjSLp9KV259E0JO8t+RE7hqm9oybFqvt5
 Ds624ahE6rn/5UvWpvxWgpJKzB4DG1sLHwBNQnTiXp914SfWtlWzlcw3cJDaiaMbOese
 XZtK3bBxMTU/xdZjTWl1hqd9lhAurEAOMCi2CBGvmWfjU2CuJ4zH6/3G5ssPwpPsZb5c Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h94gughxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:13:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8417610002A;
 Wed, 13 Jul 2022 13:13:05 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FDEE21B52C;
 Wed, 13 Jul 2022 13:13:05 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 13:13:05 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Wed, 13 Jul 2022 13:12:53 +0200
Message-ID: <165771069386.1352308.15064560800711138962.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220630101930.v2.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 01/10] i2c: stm32: add support for the
	st, stm32mp13 SOC
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

On Thu, 30 Jun 2022 10:20:14 +0200, Patrick Delaunay wrote:
> The stm32mp13 soc differs from the stm32mp15 in terms of
> clear register offset for controlling the FMP (Fast Mode Plus).
> 
> 

Applied to stm32/master, thanks!

[01/10] i2c: stm32: add support for the st,stm32mp13 SOC
        commit: d4d01d0e9998ab1c000ae0d578d33801b31cb845
[02/10] rng: stm32mp1_rng: add conditional reset feature for STM32MP13x
        commit: 12e11aae2d96d4c437c4c068e440ab4b7f08ceb0
[03/10] stm32mp: add support of STM32MP13x Rev.Y
        commit: 50b371fd68afb3650fc285bca6ae88d639418a16
[04/10] ARM: dts: stm32mp13: alignment with v5.19
        commit: 12d5a0626cf11acc3c9a59c91d87657eef726fdc
[05/10] ARM: dts: stm32mp13: activate led on STM32MP13F-DK
        commit: 6d647676ead2caecade3a7145302e98bfbc436f9
[06/10] configs: stm32mp13: Add support for baudrates higher than 115200
        commit: eb67e63da4468195276c889a1866b43821128b25
[07/10] configs: stm32mp13: activate RNG support
        commit: 72d7a302f634029ef2874d864c294fd9bfc48739
[08/10] configs: stm32mp13: activate RTC support
        commit: 420f37a91faefcda64355805fbcb662cd0aac8e1
[09/10] configs: stm32mp13: activate I2C support
        commit: 33129f6130dc125582e09a03ec78afe53a1b27f3
[10/10] configs: stm32mp13: activate some command
        commit: 257d001cb5a3e3e3a582fddb37478dedb1764811

Best regards,
-- 
Patrick Delaunay <patrick.delaunay@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
