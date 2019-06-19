Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C94BC3C
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 17:03:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D09BC5C2A0
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Jun 2019 15:03:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EC2EC5BB1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 15:03:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JF2JKg016679; Wed, 19 Jun 2019 17:02:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=oGGASfLslrx4lbyiH08fTj+Di80by/nqb2sU7LTp2Zg=;
 b=EP8rzsG5Ukih/gCgG/zmlfA/9QeL46dWJX6tTpoWM2cCzBBdzPth53mkldODCOSwT6UO
 SA6t2fMGFgJWYZEHK2BRpLRiWgxjlHVyc+aEJ8HDFPrEKLIwgmZ6AFZm7GNmmW9Auwy7
 4sHlT5GFEt7R/YfgjNkXk4NIDl1HiV3nueKYrPMIcoN3jzrG984eTT2dxzDiYiLMDR8z
 sf4MdY18oyr10CBPetcyx4fn8YBnBaPa3n3ioL2QSv7OOKyt4uBDIGWFiOPJ6Wg10n63
 EaeuPe1rI6ZwdFP6knIhIQ6utT/7+XE65sspHci+m95vbIZQ6H+Vv2oG7wVtFceYMgb1 lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7813cje8-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 19 Jun 2019 17:02:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2AE793A;
 Wed, 19 Jun 2019 15:02:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E00B32AE7;
 Wed, 19 Jun 2019 15:02:55 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Jun
 2019 17:02:55 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 19 Jun 2019 17:02:55 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] MAINTAINERS: Remove Christophe Kerello from STM32MP entry
Thread-Index: AQHVJbQZqzKqfTcQUE2QG6ymnSk+kKai8zaA
Date: Wed, 19 Jun 2019 15:02:55 +0000
Message-ID: <4d392a10-ed70-f182-e312-17441653f94c@st.com>
References: <20190618085848.6887-1-patrice.chotard@st.com>
In-Reply-To: <20190618085848.6887-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <D8E753180777AF4AA5E27366E2F0FC4C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_09:, , signatures=0
Cc: Ramon Fried <ramon.fried@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe
 KERELLO <christophe.kerello@st.com>, Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Heinrich
 Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Alexander Graf <agraf@suse.de>,
 Ryder Lee <ryder.lee@mediatek.com>, Mario Six <mario.six@gdsys.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>,
 Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: Remove Christophe Kerello
	from STM32MP entry
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


On 6/18/19 10:58 AM, Patrice Chotard wrote:
> Christophe will not have maintainer activities, so remove its name.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Christophe Kerello <christophe.kerello@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e26eda2c8..ca32d7e5e1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -295,7 +295,6 @@ F:	arch/arm/include/asm/arch-spear/
>  
>  ARM STM STM32MP
>  M:	Patrick Delaunay <patrick.delaunay@st.com>
> -M:	Christophe Kerello <christophe.kerello@st.com>
>  M:	Patrice Chotard <patrice.chotard@st.com>
>  L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
>  S:	Maintained


Applied to uboot-stm

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
