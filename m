Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF11A37B9
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 18:08:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 510C2C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Apr 2020 16:08:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67205C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2020 16:08:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039FrGgx002437; Thu, 9 Apr 2020 18:07:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rLp28NLXTFRICv8pRqnbfIKfagRhdSDTSdoTrKkuQO0=;
 b=QhkqnVWpmm6VnTprdOnvAjVUsroD5JuSQigbtwcZDaQbQl045zzxsTx24QlJsyYFMDs9
 +26U/JScbup4EbUb3YrCVVES1ii7funArSajqVUh+MsbrDPZppj72YmapFmmD/OarNg+
 vP2KwmVZ8aitxaVrrhYc0FzkYTx42G11kcvRjZtBqaAlFAR0EOJfK49k7OZ7tJKzG2tS
 CKAqUoH10dN7jim4KOEKqgjeJtTrZSwBlCYxgsLzckg6xxSS+CidBEBol244/k2+VC2O
 T3bUXzsFpoT6mqISHc1a2uL/S8g4/UZUWpCEatqQgiXO4CAg05XzKFLS1kPmkdJn9wFq dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qkbgh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 18:07:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90F8310003D;
 Thu,  9 Apr 2020 18:07:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A2A92B4563;
 Thu,  9 Apr 2020 18:07:48 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Apr
 2020 18:07:48 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 9 Apr 2020 18:07:48 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] configs: migrate CONFIG_SYS_ARM_CACHE_* in Kconfig
Thread-Index: AQHWDluHARGkLNaj1U+PEHYXxWRLw6hwegwAgABy00A=
Date: Thu, 9 Apr 2020 16:07:48 +0000
Message-ID: <1586448468096.19517@st.com>
References: <20200409124131.1.Ib3bfddef91204749326b4bdd0a089ed0bfcac33e@changeid>
 <6aceec88-f20b-8fd4-3622-87d7be716b6d@denx.de>
In-Reply-To: <6aceec88-f20b-8fd4-3622-87d7be716b6d@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_05:2020-04-07,
 2020-04-09 signatures=0
Cc: Pascal Linder <pascal.linder@edu.hefr.ch>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: migrate CONFIG_SYS_ARM_CACHE_*
	in Kconfig
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

Dear Marek

> From: Marek Vasut <marex@denx.de>
> Sent: jeudi 9 avril 2020 12:47
> 
> On 4/9/20 12:42 PM, Patrick Delaunay wrote:
> 
> [...]
> 
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig index
> > bbb1e2738b..4845a23993 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -340,6 +340,33 @@ config SYS_CACHELINE_SIZE
> >  	default 64 if SYS_CACHE_SHIFT_6
> >  	default 32 if SYS_CACHE_SHIFT_5
> >
> > +choice
> > +	prompt "Select the ARM data write cache policy"
> > +	default SYS_ARM_CACHE_WRITETHROUGH if TARGET_BCMCYGNUS
> ||
> > +TARGET_BCMNSP
> 
> || TARGET is PXA || TARGET is renesas RZA1 , and then you don't need the
> defconfig hacks below :)

Thanks for review, 

I will it in V2

+	default SYS_ARM_CACHE_WRITETHROUGH if TARGET_BCMCYGNUS || \
+					      TARGET_BCMNSP || CPU_PXA || RZA1


Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
