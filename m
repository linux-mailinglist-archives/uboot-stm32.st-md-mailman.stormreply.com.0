Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC12C3BCB
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Nov 2020 10:16:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FEAFC5662F;
	Wed, 25 Nov 2020 09:16:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5935BC424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Nov 2020 09:16:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AP9CdPh031660; Wed, 25 Nov 2020 10:16:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=yIEl3AKX47LK9zzATSJGyCHlRCzB5Rzg+HQ7X7DVuVE=;
 b=SaqgBHGxPoGP2T2uTPIQmC2Vn+6U5sMHY2nlXAQ58fnZYVcDnxxbyhenRHY8x8jWcHhP
 S2Qd8+P0DE7W2OZukx3cQk5pMbv7IyscqpXR7nhjt42Qs2x+evUpNrzOyIKUNJrvi33P
 TGTW6E7Wg9pvvFd6jXK+1dfimj1flWowwEOuYRcLEab5IHWBDW1jaN/F3CiPRJMPz+hl
 eNyUXZUNBa4tY4p8W1GgVo+B2LnaAp/Cn3P+B4nH9x4nrtguJZRTIRYBPGbHb4MR+DtJ
 i43Gd979YbAPzrUETr5S5cbJQ/c2nCvfGif1J0wbpnMnRTIGgVH7JLD3PW9o2Vbk2oA3 og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y05hcw0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:16:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACD9710002A;
 Wed, 25 Nov 2020 10:16:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2B73230987;
 Wed, 25 Nov 2020 10:16:30 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 10:16:30 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 25 Nov 2020 10:16:30 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH v1 3/4] ARM: dts: stm32: Fix timer initialization for
 stm32 MCU's board
Thread-Index: AQHWtAwnOx/WDen0Uk69N8yUPXJX16nYrxtg
Date: Wed, 25 Nov 2020 09:16:30 +0000
Message-ID: <432bc8f37a7940fcb137aed42770c842@SFHDAG2NODE3.st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
 <20201106071200.6933-4-patrice.chotard@st.com>
In-Reply-To: <20201106071200.6933-4-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_05:2020-11-25,
 2020-11-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 3/4] ARM: dts: stm32: Fix timer
 initialization for stm32 MCU's board
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

Hi Patrice

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 6 novembre 2020 08:12
> 
> Commit 4b2be78ab66c ("time: Fix get_ticks being non-monotonic") puts in
> evidence that get_ticks is called before timer initialization.
> Fix it by initializing timer before relocation.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  arch/arm/dts/stm32429i-eval-u-boot.dtsi  |  4 ++++  arch/arm/dts/stm32f429-
> disco-u-boot.dtsi |  4 ++++  arch/arm/dts/stm32f469-disco-u-boot.dtsi | 20
> ++++++++++++--------  arch/arm/dts/stm32f746-disco-u-boot.dtsi |  4 ----
>  arch/arm/dts/stm32h7-u-boot.dtsi         |  4 ++++
>  5 files changed, 24 insertions(+), 12 deletions(-)
> 

Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot-stm/master, thanks!

Thanks

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
