Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773C1A241A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 16:32:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5016C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Apr 2020 14:32:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A2D7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2020 14:32:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 038EScPe007337; Wed, 8 Apr 2020 16:31:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vZKFESfTiN0i6K7FQsbZco22f5QV+bWsSxfWwq3HKV4=;
 b=FVKksrlYXkaCl2JgY74WukMwEJVBPdut3qL8Yix6uhYyKDqHCdr26E7bbgVOELJBGkIg
 i58k8/vjg2vma8TukBwKTJAWAt/QxUHg/+W9JE3S9qEfk5Rzr+ToNDlia50VLPjvmd2k
 mOd31bM1w0bqpbTMt32UersTzia9Yda8a8lmysYuFKR2FeGkPPoxVB7kVMy53599sYwu
 yPolvi6VeWXQaTOFGSNSOzBV3LcAPHaLCUAy/loNYs+Hr6UogMAjiS+wE/ufu8ad2zbb
 valjEpHe/VZNi5QMRoSJB1QQOH38JQM0XCAPv2knyDty3z0LKoHP6YThPs+6GQITPH4l 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091mamfb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Apr 2020 16:31:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 97C7F100034;
 Wed,  8 Apr 2020 16:31:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 817512B0FB5;
 Wed,  8 Apr 2020 16:31:51 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Apr
 2020 16:31:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 8 Apr 2020 16:31:51 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Wolfgang Denk <wd@denx.de>
Thread-Topic: [PATCH 05/16] arm: stm32mp: spl: add bsec driver in SPL
Thread-Index: AQHWB3YgjlFwFenVyESmD2+EUOkxl6hkAJIAgAsjrRA=
Date: Wed, 8 Apr 2020 14:31:50 +0000
Message-ID: <1a0e59d1db004240a8d1f8f5a668711e@SFHDAG6NODE3.st.com>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
 <20200331180330.5.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
 <20200401112722.7DD9C24003E@gemini.denx.de>
In-Reply-To: <20200401112722.7DD9C24003E@gemini.denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_10:2020-04-07,
 2020-04-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 05/16] arm: stm32mp: spl: add bsec driver
	in SPL
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

Dear Wolfgang,

> From: Wolfgang Denk <wd@denx.de>
> Sent: mercredi 1 avril 2020 13:27
> 
> Dear Patrick Delaunay,
> 
> In message
> <20200331180330.5.I7a042a9ffbb5c2668034eddf5ace91271bb53c5f@changeid>
> you wrote:
> > Add the bsec driver in SPL, as it is needed by SOC part number detection.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---

[...]

> 
> This seems to be an unrelated change?  You should at least explain why this is
> needed, and if it's unrelated, spilt into a separate commit.

Yes, unrelated and it is missing the patch for it (linked to 800MHz support)

I will pushed a separate serie for this point.

> Best regards,
> 
> Wolfgang Denk

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
