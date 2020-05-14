Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2221D2BA3
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:42:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2AA9C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:42:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71098C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:42:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9cPiG023639; Thu, 14 May 2020 11:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=FCkRSilA5DWkt8eZ5Mc0mWfiarCpXimJDQcyRwMtYOk=;
 b=WGSNVqXjDlWtmbforgdOiFQQdeblIF9ag8Kb8aoTW+/fnpKouJGHPwaej9c/GVTXdgPO
 BRcmNdrxuAkbsNYCMA4/Pq8Er0pQUcumQq3fXpjV7e71huWwH9gGqzT5cjavP54lNddZ
 2b/wlES8UKPYezIURJRw0BR3fWByObhMu1K+BXglD1XJcrx9pcccyIifvgKhboPPqS2q
 pTZRpEZHgUreAg2gfIhkSKiqFU8FduObCUQOsTM/bJS392xidLhSWcuZiKsIA8ThUHnT
 d8R/x2on50iOwUEPJKndrnT/1GaF+8UF7ihrrgV16lSdiQPK3ad3rtPNFVEY1ML2Kl6x jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vpja3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:42:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 624D7100034;
 Thu, 14 May 2020 11:42:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 462882AF95C;
 Thu, 14 May 2020 11:42:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 11:42:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:42:00 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] clk: stm32mp1: fix CK_MPU calculation
Thread-Index: AQHWGj775aVu3hEi2kSolIaz+F6vLqinczSQ
Date: Thu, 14 May 2020 09:42:00 +0000
Message-ID: <3252935de21c485d9e8ccf4676c4e9fc@SFHDAG6NODE3.st.com>
References: <20200424154751.1.Ic2e6fdeb2c6943f077579212f2625f0532a16ceb@changeid>
In-Reply-To: <20200424154751.1.Ic2e6fdeb2c6943f077579212f2625f0532a16ceb@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: Lionel DEBIEVE <lionel.debieve@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] clk: stm32mp1: fix CK_MPU calculation
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: vendredi 24 avril 2020 15:48
> To: u-boot@lists.denx.de
> Cc: Lionel DEBIEVE <lionel.debieve@st.com>; Patrick DELAUNAY
> <patrick.delaunay@st.com>; Lukasz Majewski <lukma@denx.de>; Patrice
> CHOTARD <patrice.chotard@st.com>; U-Boot STM32 <uboot-stm32@st-md-
> mailman.stormreply.com>
> Subject: [PATCH] clk: stm32mp1: fix CK_MPU calculation
> Importance: High
> 
> From: Lionel Debieve <lionel.debieve@st.com>
> 
> When the CK_MPU used PLL1_MPUDIV, the current rate is wrong. The clock
> must use stm32mp1_mpu_div as a shift value. Fix the check value used to enter
> PLL_MPUDIV.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/clk/clk_stm32mp1.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
