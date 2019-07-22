Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D476FFAF
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 14:32:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A9F1CD21DF
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jul 2019 12:32:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EEFBCD21DE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 12:32:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MCQcvh005001; Mon, 22 Jul 2019 14:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WLptXtMvKSa2ywIiGe/uWSw3ehWxjBPcmEgkv82Y04E=;
 b=qi0T3by5k2+kM9n8ixCOSbwiRUK6xNbN0ui4rG7GLwzN3CmgG73a8m9+8BuaJcDfmeVN
 K/O3FWh5l3S3JZ+Uzy8VLrv9r95b9J3+I7PEOnxcWib/4fwoBOSgubNAyy6u8vvjhR/Q
 AYeZVakpM0RrrfnQRjnr1ebsjevIN2HvBAxYxaQm5KUu5aLMqQFu5qU+BGBf5nqnzgoB
 LL9vz6m8WyMnenTNjc/8/NQfmvcESEIP/GCl/XEnlQ9B5q/KvKmODepJ2XDDLrwj5DK/
 deWSxPhbbJoF9L85bzlsghiBNFpBjyRCdJijj56kAzzZ5ODUFM0YoGvshjXmG79GVO3a XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tuw7w2c7g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 14:32:01 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A01E934;
 Mon, 22 Jul 2019 12:32:00 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 874DE2CF2;
 Mon, 22 Jul 2019 12:32:00 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 14:32:00 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 22 Jul 2019 14:32:00 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Patrice CHOTARD <patrice.chotard@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/4] ARM: dts: stm32: Use kernel qspi compatible string
 for stm32f7-uboot.dtsi
Thread-Index: AQHVLbHZ8Z13I1Krik6aK1EQfJIjOqbWt2oA
Date: Mon, 22 Jul 2019 12:31:59 +0000
Message-ID: <600a6e28c86146c98f8047130cc96ffd@SFHDAG6NODE3.st.com>
References: <20190628130301.18094-1-patrice.chotard@st.com>
 <20190628130301.18094-2-patrice.chotard@st.com>
In-Reply-To: <20190628130301.18094-2-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_10:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>
Subject: Re: [Uboot-stm32] [PATCH 1/4] ARM: dts: stm32: Use kernel qspi
 compatible string for stm32f7-uboot.dtsi
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

> From: Patrice CHOTARD <patrice.chotard@st.com>
> Sent: vendredi 28 juin 2019 15:03
> 
> For STM32 QSPI driver, "st,stm32-qspi" compatible string was first introduced in
> U-boot. But later in kernel side, "st,stm32f469-qspi"
> was used.
> To simplify, align U-boot QSPI compatible string with kernel one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
> 
>  arch/arm/dts/stm32f7-u-boot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied to u-boot-stm32/master, thanks!

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
